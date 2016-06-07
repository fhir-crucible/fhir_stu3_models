module FHIR
  class Order < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'reason' => ['CodeableConcept', 'Reference']
    }
    SEARCH_PARAMS = ["date", "detail", "identifier", "patient", "source", "subject", "target", "when", "when_code"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Order.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Order.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Order.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Order.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'Order.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Order.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Order.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Order.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Order.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'date' => {'type'=>'dateTime', 'path'=>'Order.date', 'min'=>0, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Substance'], 'type'=>'Reference', 'path'=>'Order.subject', 'min'=>0, 'max'=>1},
      'source' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Order.source', 'min'=>0, 'max'=>1},
      'target' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Order.target', 'min'=>0, 'max'=>1},
      'reasonCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Order.reason[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Order.reason[x]', 'min'=>0, 'max'=>1},
      'when' => {'type'=>'Order::When', 'path'=>'Order.when', 'min'=>0, 'max'=>1},
      'detail' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Order.detail', 'min'=>1, 'max'=>Float::INFINITY}
    }

    class When < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'When.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'When.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'When.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'CodeableConcept', 'path'=>'When.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
        'schedule' => {'type'=>'Timing', 'path'=>'When.schedule', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 0-1 CodeableConcept
      attr_accessor :schedule          # 0-1 Timing
    end

    attr_accessor :id                    # 0-1 id
    attr_accessor :meta                  # 0-1 Meta
    attr_accessor :implicitRules         # 0-1 uri
    attr_accessor :language              # 0-1 code
    attr_accessor :text                  # 0-1 Narrative
    attr_accessor :contained             # 0-* [ Resource ]
    attr_accessor :extension             # 0-* [ Extension ]
    attr_accessor :modifierExtension     # 0-* [ Extension ]
    attr_accessor :identifier            # 0-* [ Identifier ]
    attr_accessor :date                  # 0-1 dateTime
    attr_accessor :subject               # 0-1 Reference(Patient|Group|Device|Substance)
    attr_accessor :source                # 0-1 Reference(Practitioner|Organization)
    attr_accessor :target                # 0-1 Reference(Organization|Device|Practitioner)
    attr_accessor :reasonCodeableConcept # 0-1 CodeableConcept
    attr_accessor :reasonReference       # 0-1 Reference(Resource)
    attr_accessor :when                  # 0-1 Order::When
    attr_accessor :detail                # 1-* [ Reference(Resource) ]

    def resourceType
      'Order'
    end
  end
end