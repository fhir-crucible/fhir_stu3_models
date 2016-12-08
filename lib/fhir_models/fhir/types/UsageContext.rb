module FHIR
  class UsageContext < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'value' => ['CodeableConcept', 'Quantity', 'Range']
    }
    SEARCH_PARAMS = []
    METADATA = {
      'id' => {'type'=>'string', 'path'=>'UsageContext.id', 'min'=>0, 'max'=>1},
      'extension' => {'type'=>'Extension', 'path'=>'UsageContext.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'code' => {'valid_codes'=>{'http://hl7.org/fhir/usage-context-type'=>['gender', 'age', 'focus', 'user', 'workflow', 'task', 'venue', 'gender', 'age', 'focus', 'user', 'workflow', 'task', 'venue']}, 'type'=>'Coding', 'path'=>'UsageContext.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/usage-context-type'}},
      'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'UsageContext.value[x]', 'min'=>1, 'max'=>1},
      'valueQuantity' => {'type'=>'Quantity', 'path'=>'UsageContext.value[x]', 'min'=>1, 'max'=>1},
      'valueRange' => {'type'=>'Range', 'path'=>'UsageContext.value[x]', 'min'=>1, 'max'=>1}
    }

    attr_accessor :id                   # 0-1 string
    attr_accessor :extension            # 0-* [ Extension ]
    attr_accessor :code                 # 1-1 Coding
    attr_accessor :valueCodeableConcept # 1-1 CodeableConcept
    attr_accessor :valueQuantity        # 1-1 Quantity
    attr_accessor :valueRange           # 1-1 Range
  end
end