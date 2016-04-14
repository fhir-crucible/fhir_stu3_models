module FHIR
  module Json

    #
    #  This module includes methods to serialize or deserialize FHIR resources to and from JSON.
    #

    def to_json
      hash = {}
      hash = self.to_hash
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
        $LOG.error("Failed to deserialize JSON:\n#{json}\n#{e.backtrace}")
        resource = nil
      end
      resource
    end

  end
end
