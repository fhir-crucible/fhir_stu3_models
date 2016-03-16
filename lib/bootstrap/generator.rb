module FHIR
  module Boot
    class Generator

      attr_accessor :types
      attr_accessor :resources
      attr_accessor :extensions
      attr_accessor :profiles
      attr_accessor :lib

      def initialize    
        defns = File.expand_path '../../definitions',File.dirname(File.absolute_path(__FILE__))

        # load the types
        filename = File.join(defns,'structures','profiles-types.json')
        raw = File.open(filename,'r:UTF-8',&:read)
        @types = JSON.parse(raw)['entry'].map{|e|e['resource']}

        # load the resources
        filename = File.join(defns,'structures','profiles-resources.json')
        raw = File.open(filename,'r:UTF-8',&:read)
        @resources = JSON.parse(raw)['entry'].map{|e|e['resource']}

        # load the extensions
        filename = File.join(defns,'structures','extension-definitions.json')
        raw = File.open(filename,'r:UTF-8',&:read)
        @extensions = JSON.parse(raw)['entry'].map{|e|e['resource']}

        # load the profiles
        filename = File.join(defns,'structures','profiles-others.json')
        raw = File.open(filename,'r:UTF-8',&:read)
        @profiles = JSON.parse(raw)['entry'].map{|e|e['resource']}        

        # make folders for generated content if they do not exist
        @lib = File.expand_path '..', File.dirname(File.absolute_path(__FILE__))
        Dir.mkdir(File.join(@lib,'fhir')) if !Dir.exists?(File.join(@lib,'fhir'))
        Dir.mkdir(File.join(@lib,'fhir','types')) if !Dir.exists?(File.join(@lib,'fhir','types'))
        Dir.mkdir(File.join(@lib,'fhir','resources')) if !Dir.exists?(File.join(@lib,'fhir','resources'))

        # delete previously generated folder contents
        Dir.glob(File.join(@lib,'fhir','*')).each{|f|File.delete(f) if !File.directory?(f)}
        Dir.glob(File.join(@lib,'fhir','**','*')).each{|f|File.delete(f) if !File.directory?(f)}
      end

      def generate_primitives
        # primitive data types start with a lowercase letter
        primitives = @types.select{|t|t['id'][0]==t['id'][0].downcase}

        template = FHIR::Boot::Template.new([])
        hash = {}

        primitives.each do |p|
          field = FHIR::Field.new
          field.name = nil

          # try to find the element that describes the value
          type = p['snapshot']['element'].select{|e| e['path'].end_with?('.value')}.first['type'].first

          # try to find the JSON data type
          begin
            ext = type['_code']['extension'].select{|e| e['url']=='http://hl7.org/fhir/StructureDefinition/structuredefinition-json-type'}.first
            field.type = ext['valueString']
          rescue 
            field.type = 'string'
          end

          # try to find a regex
          begin
            ext = type['extension'].select{|e| e['url']=='http://hl7.org/fhir/StructureDefinition/structuredefinition-regex'}.first
            field.regex = ext['valueString']
          rescue 
          end

          hash[ p['id' ] ] = field.to_hash
        end

        template.constants['PRIMITIVES'] = hash

        filename = File.join(@lib,'fhir','types','primitives.rb')
        file = File.open(filename,'w:UTF-8')
        file.write(template.to_s)
        file.close
      end

      def generate_types
        folder = File.join @lib,'fhir','types'
        # complex data types start with an uppercase letter
        complexTypes = @types.select{|t|t['id'][0]==t['id'][0].upcase}
        generate_class(folder,complexTypes)
      end

      def generate_resources
        folder = File.join @lib,'fhir','resources'
        generate_class(folder,@resources)
      end

      def generate_class(folder=@lib,structureDefs)
        structureDefs.each do |structureDef|
          typeName = structureDef['id']
          constrainedType = structureDef['constrainedType']
          pathType = typeName
          pathType = constrainedType if constrainedType

          template = FHIR::Boot::Template.new([ typeName ])
          multipleDataTypes = {}

          structureDef['snapshot']['element'].each do |element|
            # skip the first element
            next if element['path']==pathType

            field_base_name = element['path'].gsub("#{pathType}.",'')
            # If the element has a type, treat it as a datatype or resource
            # If not, treat it as a reference to an already declared internal class
            if !element['type'].nil?
              # profiles contains a list of profiles if the datatype is Reference
              profiles = []
              element['type'].select{|t|t['code']=='Reference'}.each do |dataType|
                profiles << dataType['profile']
              end
              profiles.select!{|p|!p.nil?}
              profiles.flatten!

              # Calculate fields that have multiple data types
              if element['type'].length > 1
                fieldname = field_base_name.gsub('[x]','')
                unique_types = element['type'].map{|t|t['code']}.uniq
                multipleDataTypes[fieldname] = unique_types if(unique_types.length>1)
              end

              # generate a field for each valid datatype... this is for things like Resource.attribute[x]
              element['type'].map{|t|t['code']}.uniq.each do |dataType|
                capitalized = String.new(dataType)
                # capitalize first letter, cannot use capitalize method because of camel-cased names
                capitalized[0] = capitalized[0].upcase
                fieldname = field_base_name.gsub('[x]',capitalized)
                field = FHIR::Field.new(fieldname)
                field.path = element['path'].gsub(pathType,typeName)
                field.type = dataType
                field.type_profiles = profiles if dataType=='Reference'
                field.min = element['min']
                field.max = element['max']
                field.max = field.max.to_i
                field.max = '*' if element['max']=='*'

                if ['code','Coding','CodeableConcept'].include?(dataType) && element['binding']
                  field.binding = element['binding']
                  field.binding['uri'] = field.binding['valueSetUri']
                  field.binding['uri'] = field.binding['valueSetReference'] if field.binding['uri'].nil?
                  field.binding['uri'] = field.binding['uri']['reference'] if field.binding['uri'].is_a?(Hash)
                  field.binding.delete('valueSetUri')
                  field.binding.delete('valueSetReference')
                  field.binding.delete('description')
                  # TODO: need to replace with actual code list
                  # field.valid_codes <<
                end

                template.fields << field
              end
            else # If there is not data type, treat the type as a reference to an already declared internal class
              field = FHIR::Field.new(field_base_name)
              field.path = element['path'].gsub(pathType,typeName)
              field.type = element['nameReference']
              field.min = element['min']
              field.max = element['max']
              field.max = field.max.to_i
              field.max = '*' if element['max']=='*'
              template.fields << field
            end
          end

          template.constants['MULTIPLE_TYPES'] = multipleDataTypes if !multipleDataTypes.empty?

          filename = File.join(folder,"#{typeName}.rb")
          file = File.open(filename,'w:UTF-8')
          file.write(template.to_s)
          file.close 
        end
      end

    end
  end
end
