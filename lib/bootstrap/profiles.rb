module FHIR
  class Profiles

    @@profiles = nil
    @@extensions = nil

    def self.load_definitions    
      if @@profiles.nil? || @@extensions.nil?
        defns = File.expand_path '../../definitions',File.dirname(File.absolute_path(__FILE__))

        # load the built-in profiles
        filename = File.join(defns,'structures','profiles-others.json')
        raw = File.open(filename,'r:UTF-8',&:read)
        @@profiles = JSON.parse(raw)['entry'].map{|e|e['resource']}

        # load the built-in extensions
        filename = File.join(defns,'structures','extension-definitions.json')
        raw = File.open(filename,'r:UTF-8',&:read)
        @@extensions = JSON.parse(raw)['entry'].map{|e|e['resource']}
      end
    end

    def self.get_basetype(uri)
      load_definitions

      defn = @@profiles.select{|x|x['url']==uri}.first
      defn = @@extensions.select{|x|x['url']==uri}.first if defn.nil?

      basetype = nil
      basetype = defn['baseType'] if !defn.nil?
      basetype
    end

    def self.get_metadata(uri)
      load_definitions

      defn = @@profiles.select{|x|x['url']==uri}.first
      defn = @@extensions.select{|x|x['url']==uri}.first if defn.nil?

      metadata = nil
      if !defn.nil?
        generator = FHIR::Boot::Generator.new(false)
        type = defn['baseType']
        defn['id'] = type # override profile id with baseType name for generator
        template = generator.generate_class([ type ],defn)
        metadata = template.get_metadata
        metadata.each do |key,value|
          value['max'] = Float::INFINITY if value['max']=='*' 
        end
      end
      metadata
    end

  end
end
