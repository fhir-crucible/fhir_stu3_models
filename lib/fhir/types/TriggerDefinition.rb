module FHIR
  class TriggerDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'eventTiming' => ['Timing', 'Reference', 'date', 'dateTime']
    }
    SEARCH_PARAMS = []
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'TriggerDefinition.id', 'min'=>0, 'max'=>1},
      'extension' => {'type'=>'Extension', 'path'=>'TriggerDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/trigger-type'=>['named-event', 'periodic', 'data-added', 'data-modified', 'data-removed', 'data-accessed', 'data-access-ended']}, 'type'=>'code', 'path'=>'TriggerDefinition.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/trigger-type'}},
      'eventName' => {'type'=>'string', 'path'=>'TriggerDefinition.eventName', 'min'=>0, 'max'=>1},
      'eventTimingTiming' => {'type'=>'Timing', 'path'=>'TriggerDefinition.eventTiming[x]', 'min'=>0, 'max'=>1},
      'eventTimingReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Schedule'], 'type'=>'Reference', 'path'=>'TriggerDefinition.eventTiming[x]', 'min'=>0, 'max'=>1},
      'eventTimingDate' => {'type'=>'date', 'path'=>'TriggerDefinition.eventTiming[x]', 'min'=>0, 'max'=>1},
      'eventTimingDateTime' => {'type'=>'dateTime', 'path'=>'TriggerDefinition.eventTiming[x]', 'min'=>0, 'max'=>1},
      'eventData' => {'type'=>'DataRequirement', 'path'=>'TriggerDefinition.eventData', 'min'=>0, 'max'=>1}
    }

    attr_accessor :id                   # 0-1 id
    attr_accessor :extension            # 0-* [ Extension ]
    attr_accessor :type                 # 1-1 code
    attr_accessor :eventName            # 0-1 string
    attr_accessor :eventTimingTiming    # 0-1 Timing
    attr_accessor :eventTimingReference # 0-1 Reference(Schedule)
    attr_accessor :eventTimingDate      # 0-1 date
    attr_accessor :eventTimingDateTime  # 0-1 dateTime
    attr_accessor :eventData            # 0-1 DataRequirement
  end
end