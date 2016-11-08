require 'tempfile'
module FHIR
  class Definitions
    @@defns = File.expand_path '../definitions', File.dirname(File.absolute_path(__FILE__))
    @@types = nil
    @@resources = nil
    @@profiles = nil
    @@extensions = nil
    @@expansions = nil
    @@valuesets = nil
    @@search_params = nil

    # ----------------------------------------------------------------
    #  Types
    # ----------------------------------------------------------------

    def self.load_types
      if @@types.nil?
        # load the types
        filename = File.join(@@defns, 'structures', 'profiles-types.json')
        raw = File.open(filename, 'r:UTF-8', &:read)
        @@types = JSON.parse(raw)['entry'].map { |e| e['resource'] }
      end
    end

    def self.get_primitive_types
      load_types
      # primitive data types start with a lowercase letter
      @@types.select { |t| t['id'][0] == t['id'][0].downcase }
    end

    def self.get_complex_types
      load_types
      # complex data types start with an uppercase letter
      # and we'll filter out profiles on types (for example, Age is a profile on Quantity)
      @@types.select { |t| (t['id'][0] == t['id'][0].upcase) && (t['id'] == t['snapshot']['element'].first['path']) }
    end

    def self.get_type_definition(type_name)
      return nil if type_name.nil?
      load_types
      d = @@types.find { |x| x['xmlId'] == type_name || x['name'] == type_name || x['url'] == type_name }
      d = FHIR::StructureDefinition.new(d) if !d.nil?
      d
    end

    # ----------------------------------------------------------------
    #  Resources, Profiles, Extensions
    # ----------------------------------------------------------------

    def self.load_resources
      if @@resources.nil?
        # load the resources
        filename = File.join(@@defns, 'structures', 'profiles-resources.json')
        raw = File.open(filename, 'r:UTF-8', &:read)
        @@resources = JSON.parse(raw)['entry'].map { |e| e['resource'] }
      end
    end

    def self.get_resource_definitions
      load_resources
      @@resources
    end

    def self.get_resource_definition(resource_name)
      return nil if resource_name.nil?
      load_resources
      d = @@resources.find { |x| x['xmlId'] == resource_name || x['name'] == resource_name || x['url'] == resource_name }
      d = FHIR::StructureDefinition.new(d) if !d.nil?
      d
    end

    def self.load_profiles
      if @@profiles.nil?
        # load the built-in profiles
        filename = File.join(@@defns, 'structures', 'profiles-others.json')
        raw = File.open(filename, 'r:UTF-8', &:read)
        @@profiles = JSON.parse(raw)['entry'].map { |e| e['resource'] }
      end
    end

    def self.load_extensions
      if @@extensions.nil?
        # load the built-in extensions
        filename = File.join(@@defns, 'structures', 'extension-definitions.json')
        raw = File.open(filename, 'r:UTF-8', &:read)
        @@extensions = JSON.parse(raw)['entry'].map { |e| e['resource'] }
      end
    end

    def self.get_extension_definition(extension_name)
      return nil if extension_name.nil?
      load_extensions
      d = @@extensions.find { |x| x['xmlId'] == extension_name || x['name'] == extension_name || x['url'] == extension_name }
      d = FHIR::StructureDefinition.new(d) if !d.nil?
      d
    end

    # Get the basetype (String) for a given profile or extension.
    def self.get_basetype(uri)
      return nil if uri.nil?
      load_profiles
      load_extensions

      defn = @@profiles.select { |x| x['url'] == uri }.first
      defn = @@extensions.select { |x| x['url'] == uri }.first if defn.nil?

      basetype = nil
      basetype = defn['baseType'] if !defn.nil?
      basetype
    end

    # Get the StructureDefinition for a given profile.
    def self.get_profile(uri)
      return nil if uri.nil?
      load_profiles
      load_extensions

      defn = @@profiles.select { |x| x['url'] == uri }.first
      defn = @@extensions.select { |x| x['url'] == uri }.first if defn.nil?

      profile = nil
      profile = FHIR::StructureDefinition.new(defn) if !defn.nil?
      profile
    end

    def self.get_profiles_for_resource(resource_name)
      return nil if resource_name.nil?
      load_profiles
      @@profiles.select { |x| x['baseType'] == resource_name }.map { |x| FHIR::StructureDefinition.new(x) }
    end

    # Get a dynamically generated class for a given profile.
    def self.get_profile_class(uri)
      return nil if uri.nil?
      load_profiles
      load_extensions

      defn = @@profiles.select { |x| x['url'] == uri }.first
      defn = @@extensions.select { |x| x['url'] == uri }.first if defn.nil?

      klass = nil
      if !defn.nil?
        generator = FHIR::Boot::Generator.new(false)
        type = defn['baseType']
        id = defn['id'].gsub(/-|_/, '').capitalize
        defn['id'] = type # override profile id with baseType name for generator
        template = generator.generate_class([type], defn)
        f = Tempfile.new(["profile-#{id}", '.rb'])
        f.write("module FHIR\n")
        f.write("module Profile\n")
        f.write("module #{id}\n")
        f.write(template.to_s)
        3.times { f.write("\nend") }
        f.close
        begin
          # load the profiled class
          load f
          # set the return class type
          klass = Object.const_get("FHIR::Profile::#{id}::#{type}")
        rescue
          FHIR.logger.error "Failed to generate class for profile #{uri}"
        end
        # unlink the file so it can be garbage collected
        f.unlink
      end
      klass
    end

    # ----------------------------------------------------------------
    #  ValueSet Code Expansions
    # ----------------------------------------------------------------

    def self.load_expansions
      if @@expansions.nil?
        # load the expansions
        filename = File.join(@@defns, 'valuesets', 'expansions.json')
        raw = File.open(filename, 'r:UTF-8', &:read)
        @@expansions = JSON.parse(raw)['entry'].map { |e| e['resource'] }
      end
      if @@valuesets.nil?
        # load the valuesets
        filename = File.join(@@defns, 'valuesets', 'valuesets.json')
        raw = File.open(filename, 'r:UTF-8', &:read)
        @@valuesets = JSON.parse(raw)['entry'].map { |e| e['resource'] }
      end
    end

    # Get codes (Array of Strings) for a given expansion.
    def self.get_codes(uri)
      return nil if uri.nil?
      load_expansions
      codes = nil
      valueset = @@expansions.select { |x| x['url'] == uri }.first
      if !valueset.nil?
        codes = {}
        if !valueset['expansion'].nil? && !valueset['expansion']['contains'].nil?
          keys = valueset['expansion']['contains'].map { |x| x['system'] }.uniq
          keys.each { |x| codes[x] = [] }
          valueset['expansion']['contains'].each { |x| codes[x['system']] << x['code'] }
        end
        if !valueset['compose'].nil? && !valueset['compose']['include'].nil?
          included_systems = valueset['compose']['include'].map { |x| x['system'] }.uniq
          included_systems.each { |x| codes[x] = [] if !codes.keys.include?(x) }
          systems = @@valuesets.select { |x| x['resourceType'] == 'CodeSystem' && included_systems.include?(x['url']) }
          systems.each do |x|
            x['concept'].each { |y| codes[x['url']] << y['code'] }
          end
        end
      end
      codes
    end

    # ----------------------------------------------------------------
    #  Search Params
    # ----------------------------------------------------------------

    def self.load_search_params
      if @@search_params.nil?
        # load the search parameters
        filename = File.join(@@defns, 'structures', 'search-parameters.json')
        raw = File.open(filename, 'r:UTF-8', &:read)
        @@search_params = JSON.parse(raw)['entry'].map { |e| e['resource'] }
      end
    end

    def self.get_search_parameters(type_name)
      return nil if type_name.nil?
      load_search_params
      @@search_params.select { |p| p['base'] == type_name && p['xpath'] && !p['xpath'].include?('extension') }.map { |p| p['code'] }
    end

    private_class_method :load_types, :load_extensions, :load_expansions, :load_profiles, :load_resources, :load_search_params
  end
end
