module FHIR
  class Field
    include FHIR::Hashable

    attr_accessor :name
    attr_accessor :path
    attr_accessor :type
    attr_accessor :type_profiles
    attr_accessor :min
    attr_accessor :max
    attr_accessor :valid_codes
    attr_accessor :binding
    attr_accessor :regex
    attr_accessor :constraint

    def initialize(name='')
      @name = name
      @type_profiles = []
      @valid_codes = []
    end
  end
end