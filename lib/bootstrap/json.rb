module FHIR
  module Json

    #
    #  This module includes methods to serialize or deserialize FHIR resources to and from JSON.
    #

    def to_json
      hash = {}
      hash = self.to_hash
      hash['resourceType'] = self.class.name.split('::').last
      JSON.pretty_unparse(hash)
    end

    def self.from_json(json)
      hash = JSON.parse(json)
      resource = nil
      begin
        resourceType = hash['resourceType']
        klass = Module.const_get("FHIR::#{resourceType}")
        resource = klass.new
        resource.from_hash(hash)
      rescue Exception => e
        binding.pry
        resource = nil
      end
      resource
    end

  end
end
