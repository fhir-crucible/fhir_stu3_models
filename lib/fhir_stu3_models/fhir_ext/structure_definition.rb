# Extend StructureDefinition for profile validation code
require 'nokogiri'
require 'yaml'
require 'bcp47'

module FHIR
  module STU3
    class StructureDefinition
      extend FHIR::STU3::Deprecate
      attr_accessor :finding
      attr_accessor :errors
      attr_accessor :warnings
      attr_accessor :hierarchy

      # -------------------------------------------------------------------------
      #                            Profile Validation
      # -------------------------------------------------------------------------

      class << self; attr_accessor :vs_validators end
      @vs_validators = {}
      def self.validates_vs(valueset_uri, &validator_fn)
        @vs_validators[valueset_uri] = validator_fn
      end

      def self.clear_validates_vs(valueset_uri)
        @vs_validators.delete valueset_uri
      end

      def self.clear_all_validates_vs
        @vs_validators = {}
      end

      def validates_resource?(resource)
        validate_resource(resource).empty?
      end

      def validate_resource(resource)
        @errors = []
        @warnings = []
        if resource.is_a?(FHIR::STU3::Model)
          valid_json?(resource.to_json) if resource
        else
          @errors << "#{resource.class} is not a resource."
        end
        @errors
      end

      def validates_hash?(hash)
        @errors = []
        @warnings = []
        valid_json?(hash) if hash
        @errors
      end

      # Checks whether or not the "json" is valid according to this definition.
      # json == the raw json for a FHIR resource
      def valid_json?(json)
        build_hierarchy if @hierarchy.nil?

        if json.is_a? String
          begin
            json = JSON.parse(json)
          rescue StandardError => e
            @errors << "Failed to parse JSON: #{e.message} %n #{h} %n #{e.backtrace.join("\n")}"
            return false
          end
        end

        @hierarchy.children.each do |element|
          verify_element(element, json)
        end

        @errors.size.zero?
      end
      deprecate :is_valid_json?, :valid_json?

      def build_hierarchy
        @hierarchy = nil
        snapshot.element.each do |element|
          if @hierarchy.nil?
            @hierarchy = element
          else
            @hierarchy.add_descendent(element)
          end
        end
        changelist = differential.element.map(&:path)
        @hierarchy.keep_children(changelist)
        @hierarchy.sweep_children
        @hierarchy
      end

      def describe_element(element)
        if element.path.end_with?('.extension', '.modifierExtension') && element.sliceName
          "#{element.path} (#{element.sliceName})"
        else
          element.path
        end
      end

      def get_json_nodes(json, path)
        results = []
        return [json] if path.nil?

        steps = path.split('.')
        steps.each.with_index do |step, index|
          case json
          when Hash
            json = json[step]
          when Array
            json.each do |e|
              results << get_json_nodes(e, steps[index..].join('.'))
            end
            return results.flatten!
          else
            # this thing doesn't exist
            return results
          end
          return results if json.nil?
        end

        if json.is_a? Array
          results += json
        else
          results << json
        end
        results
      end

      def verify_element(element, json)
        path = element.local_name || element.path
        path = path[(@hierarchy.path.size + 1)..] if path.start_with? @hierarchy.path

        if element.type && !element.type.empty?
          data_type_found = element.type.first.code
        else
          @warnings << "Unable to guess data type for #{describe_element(element)}"
          data_type_found = nil
        end

        # get the JSON nodes associated with this element path
        if path.end_with?('[x]')
          nodes = []
          element.type.each do |type|
            data_type_found = type.code
            capcode = type.code.clone
            capcode[0] = capcode[0].upcase
            nodes = get_json_nodes(json, path.gsub('[x]', capcode))
            break unless nodes.empty?
          end
        else
          nodes = get_json_nodes(json, path)
        end

        # special filtering on extension urls
        extension_profile = element.type.find { |t| t.code == 'Extension' && !t.profile.nil? }
        if extension_profile
          nodes = nodes.select { |x| extension_profile.profile == x['url'] }
        end

        verify_cardinality(element, nodes)

        return if nodes.empty?

        # Check the datatype for each node, only if the element has one declared, and it isn't the root element
        if !element.type.empty? && element.path != id
          # element.type not being empty implies data_type_found != nil, for valid profiles
          codeable_concept_pattern = element.pattern&.is_a?(FHIR::STU3::CodeableConcept)
          codeable_concept_binding = element.binding
          matching_pattern = false
          nodes.each do |value|
            matching_type = 0

            # the element is valid, if it matches at least one of the datatypes
            temp_messages = []
            verified_extension = false
            verified_data_type = false
            if data_type_found == 'Extension' # && !type.profile.nil?
              verified_extension = true
              # TODO: should verify extensions
              # extension_def = FHIR::STU3::Definitions.get_extension_definition(value['url'])
              # if extension_def
              #   verified_extension = extension_def.validates_resource?(FHIR::STU3::Extension.new(deep_copy(value)))
              # end
            else
              temp = @errors
              @errors = []
              verified_data_type = data_type?(data_type_found, value)
              temp_messages += @errors
              @errors = temp
            end
            if data_type_found && (verified_extension || verified_data_type)
              matching_type += 1
              if data_type_found == 'code' # then check the binding
                unless element.binding.nil?
                  matching_type += check_binding_element(element, value)
                end
              elsif data_type_found == 'CodeableConcept' && codeable_concept_pattern
                vcc = FHIR::STU3::CodeableConcept.new(value)
                pattern = element.pattern.coding
                pattern.each do |pcoding|
                  vcc.coding.each do |vcoding|
                    matching_pattern = true if vcoding.system == pcoding.system && vcoding.code == pcoding.code
                  end
                end
              elsif data_type_found == 'CodeableConcept' && codeable_concept_binding
                binding_issues =
                  case element.binding.strength
                  when 'extensible'
                    @warnings
                  when 'required'
                    @errors
                  else # e.g., example-strength or unspecified
                    [] # Drop issues errors on the floor, in throwaway array
                  end

                valueset_uri = element.binding&.valueSetReference && element.binding.valueSetReference.reference
                vcc = FHIR::STU3::CodeableConcept.new(value)
                if valueset_uri && self.class.vs_validators[valueset_uri]
                  check_fn = self.class.vs_validators[valueset_uri]
                  has_valid_code = vcc.coding&.any? { |c| check_fn.call(c) }
                  unless has_valid_code
                    binding_issues << "#{describe_element(element)} has no codings from #{valueset_uri}. Codings evaluated: #{vcc.to_json}"
                  end
                end

                unless has_valid_code
                  vcc.coding.each do |c|
                    check_fn = self.class.vs_validators[c.system]
                    if check_fn && !check_fn.call(c)
                      binding_issues << "#{describe_element(element)} has no codings from it's specified system: #{c.system}.  "\
                                        "Codings evaluated: #{vcc.to_json}"
                    end
                  end
                end

              elsif data_type_found == 'String' && !element.maxLength.nil? && (value.size > element.maxLength)
                @errors << "#{describe_element(element)} exceed maximum length of #{element.maxLength}: #{value}"
              end
            elsif data_type_found
              temp_messages << "#{describe_element(element)} is not a valid #{data_type_found}: '#{value}'"
            else
              # we don't know the data type... so we say "OK"
              matching_type += 1
              @warnings >> "Unable to guess data type for #{describe_element(element)}"
            end

            if matching_type <= 0
              @errors += temp_messages
              @errors << "#{describe_element(element)} did not match one of the valid data types: #{element.type.map(&:code)}"
            else
              @warnings += temp_messages
            end
            verify_fixed_value(element, value)
          end
          if codeable_concept_pattern && matching_pattern == false
            @errors << "#{describe_element(element)} CodeableConcept did not match defined pattern: #{element.pattern.to_hash}"
          end
        end

        # Check FluentPath invariants 'constraint.xpath' constraints...
        # This code is not very robust, and is likely to be throwing *many* exceptions.
        # This is partially because the FluentPath evaluator is not complete, and partially
        # because the context of an expression (element.constraint.expression) is not always
        # consistent with the current context (element.path). For example, sometimes expressions appear to be
        # written to be evaluated within the element, other times at the resource level, or perhaps
        # elsewhere. There is no good way to determine "where" you should evaluate the expression.
        element.constraint.each do |constraint|
          next unless constraint.expression && !nodes.empty?

          nodes.each do |node|
            result = FluentPath::STU3.evaluate(constraint.expression, node)
            if !result && constraint.severity == 'error'
              @errors << "#{describe_element(element)}: FluentPath expression evaluates to false for #{name} invariant rule #{constraint.key}: #{constraint.human}"
              @errors << node.to_s
            end
          rescue StandardError
            @warnings << "#{describe_element(element)}: unable to evaluate FluentPath expression against JSON for #{name} invariant rule #{constraint.key}: #{constraint.human}"
            @warnings << node.to_s
          end
        end

        # check children if the element has any
        return unless element.children

        nodes.each do |node|
          element.children.each do |child|
            verify_element(child, node)
          end
        end
      end

      def verify_cardinality(element, nodes)
        # Check the cardinality
        min = element.min
        max = element.max == '*' ? Float::INFINITY : element.max.to_i
        @errors << "#{describe_element(element)} failed cardinality test (#{min}..#{max}) -- found #{nodes.size}" if (nodes.size < min) || (nodes.size > max)
      end

      def verify_fixed_value(element, value)
        @errors << "#{describe_element(element)} value of '#{value}' did not match fixed value: #{element.fixed}" if !element.fixed.nil? && element.fixed != value
      end

      # data_type_code == a FHIR DataType code (see http://hl7.org/fhir/2015May/datatypes.html)
      # value == the representation of the value
      def data_type?(data_type_code, value)
        # FHIR models covers any base Resources
        if FHIR::STU3::RESOURCES.include?(data_type_code)
          definition = FHIR::STU3::Definitions.resource_definition(data_type_code)
          unless definition.nil?
            ret_val = false
            begin
              # klass = Module.const_get("FHIR::STU3::#{data_type_code}")
              # ret_val = definition.validates_resource?(klass.new(deep_copy(value)))
              ret_val = definition.validates_hash?(value)
              unless ret_val
                @errors += definition.errors
                @warnings += definition.warnings
              end
            rescue StandardError
              @errors << "Unable to verify #{data_type_code} as a FHIR Resource."
            end
            return ret_val
          end
        end

        # Remaining data types: handle special cases before checking type StructureDefinitions
        case data_type_code.downcase
        when 'domainresource'
          true # we don't have to verify domain resource, because it will be included in the snapshot
        when 'resource'
          resource_type = value['resourceType']
          definition = FHIR::STU3::Definitions.resource_definition(resource_type)
          if !definition.nil?
            ret_val = false
            begin
              # klass = Module.const_get("FHIR::STU3::#{resource_type}")
              # ret_val = definition.validates_resource?(klass.new(deep_copy(value)))
              ret_val = definition.validates_hash?(value)
              unless ret_val
                @errors += definition.errors
                @warnings += definition.warnings
              end
            rescue StandardError
              @errors << "Unable to verify #{resource_type} as a FHIR Resource."
            end
            ret_val
          else
            @errors << "Unable to find base Resource definition: #{resource_type}"
            false
          end
        when *FHIR::STU3::PRIMITIVES.keys.map(&:downcase)
          FHIR::STU3.primitive?(datatype: data_type_code, value: value)
        else
          # Eliminate endless loop on Element is an Element
          return true if data_type_code == 'Element' && id == 'Element'

          definition = FHIR::STU3::Definitions.type_definition(data_type_code)
          definition = FHIR::STU3::Definitions.resource_definition(data_type_code) if definition.nil?
          if !definition.nil?
            ret_val = false
            begin
              # klass = Module.const_get("FHIR::STU3::#{data_type_code}")
              # ret_val = definition.validates_resource?(klass.new(deep_copy(value)))
              ret_val = definition.validates_hash?(value)
              unless ret_val
                @errors += definition.errors
                @warnings += definition.warnings
              end
            rescue StandardError
              @errors << "Unable to verify #{data_type_code} as a FHIR type."
            end
            ret_val
          else
            @errors << "Unable to find base type definition: #{data_type_code}"
            false
          end
        end
      end
      deprecate :is_data_type?, :data_type?

      def check_binding_element(element, value)
        vs_uri = element.binding.valueSetUri || element.binding.valueSetReference.reference
        valueset = FHIR::STU3::Definitions.get_codes(vs_uri)

        matching_type = 0

        if ['http://hl7.org/fhir/ValueSet/content-type', 'http://www.rfc-editor.org/bcp/bcp13.txt'].include?(vs_uri)
          matches = MIME::Types[value]
          if (matches.nil? || matches.size.zero?) && !some_type_of_xml_or_json?(value)
            @errors << "#{element.path} has invalid mime-type: '#{value}'"
            matching_type -= 1 if element.binding.strength == 'required'
          end
        elsif ['http://hl7.org/fhir/ValueSet/languages', 'http://tools.ietf.org/html/bcp47'].include?(vs_uri)
          has_region = !(value =~ /-/).nil?
          valid = !BCP47::Language.identify(value.downcase).nil? && (!has_region || !BCP47::Region.identify(value.upcase).nil?)
          unless valid
            @errors << "#{element.path} has unrecognized language: '#{value}'"
            matching_type -= 1 if element.binding.strength == 'required'
          end
        elsif valueset.nil?
          @warnings << "#{element.path} has unknown ValueSet: '#{vs_uri}'"
          if element.binding.strength == 'required'
            if element.short
              @warnings << "#{element.path} guessing codes for ValueSet: '#{vs_uri}'"
              guess_codes = element.short.split(' | ')
              matching_type -= 1 unless guess_codes.include?(value)
            else
              matching_type -= 1
            end
          end
        elsif !valueset.values.flatten.include?(value)
          message = "#{element.path} has invalid code '#{value}' from #{vs_uri}"
          if element.binding.strength == 'required'
            @errors << message
            matching_type -= 1
          else
            @warnings << message
          end
        end

        matching_type
      end

      def some_type_of_xml_or_json?(code)
        m = code.downcase
        return true if ['xml', 'json'].include?(m)
        return true if m.start_with?('application/', 'text/') && m.end_with?('json', 'xml')
        return true if m.start_with?('application/xml', 'text/xml', 'application/json', 'text/json')

        false
      end
      deprecate :is_some_type_of_xml_or_json, :some_type_of_xml_or_json?

      private :valid_json?, :get_json_nodes, :build_hierarchy, :verify_element, :check_binding_element
    end
  end
end
