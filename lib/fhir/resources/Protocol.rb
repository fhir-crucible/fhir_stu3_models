module FHIR
  class Protocol < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["identifier", "subject"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Protocol.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Protocol.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Protocol.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Protocol.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'Protocol.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Protocol.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Protocol.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Protocol.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Protocol.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'title' => {'type'=>'string', 'path'=>'Protocol.title', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/protocol-status'=>['draft', 'testing', 'review', 'active', 'withdrawn', 'superseded']}, 'type'=>'code', 'path'=>'Protocol.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/protocol-status'}},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/protocol-type'=>['condition', 'device', 'drug', 'study']}, 'type'=>'code', 'path'=>'Protocol.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/protocol-type'}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Medication'], 'type'=>'Reference', 'path'=>'Protocol.subject', 'min'=>0, 'max'=>1},
      'group' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Protocol.group', 'min'=>0, 'max'=>1},
      'purpose' => {'type'=>'string', 'path'=>'Protocol.purpose', 'min'=>1, 'max'=>1},
      'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Protocol.author', 'min'=>0, 'max'=>1},
      'step' => {'type'=>'Protocol::Step', 'path'=>'Protocol.step', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Step < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Step.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Step.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Step.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Step.name', 'min'=>0, 'max'=>1},
        'description' => {'type'=>'string', 'path'=>'Step.description', 'min'=>0, 'max'=>1},
        'duration' => {'type'=>'Quantity', 'path'=>'Step.duration', 'min'=>0, 'max'=>1},
        'precondition' => {'type'=>'Protocol::Step::Precondition', 'path'=>'Step.precondition', 'min'=>0, 'max'=>1},
        'exit' => {'type'=>'Protocol::Step::Precondition', 'path'=>'Step.exit', 'min'=>0, 'max'=>1},
        'firstActivity' => {'type'=>'uri', 'path'=>'Step.firstActivity', 'min'=>0, 'max'=>1},
        'activity' => {'type'=>'Protocol::Step::Activity', 'path'=>'Step.activity', 'min'=>0, 'max'=>Float::INFINITY},
        'next' => {'type'=>'Protocol::Step::Next', 'path'=>'Step.next', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Precondition < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Precondition.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Precondition.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Precondition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'description' => {'type'=>'string', 'path'=>'Precondition.description', 'min'=>0, 'max'=>1},
          'condition' => {'type'=>'Protocol::Step::Precondition::Condition', 'path'=>'Precondition.condition', 'min'=>0, 'max'=>1},
          'intersection' => {'type'=>'Protocol::Step::Precondition', 'path'=>'Precondition.intersection', 'min'=>0, 'max'=>Float::INFINITY},
          'union' => {'type'=>'Protocol::Step::Precondition', 'path'=>'Precondition.union', 'min'=>0, 'max'=>Float::INFINITY},
          'exclude' => {'type'=>'Protocol::Step::Precondition', 'path'=>'Precondition.exclude', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Condition < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          MULTIPLE_TYPES = {
            'value' => ['CodeableConcept', 'boolean', 'Quantity', 'Range']
          }
          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Condition.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Condition.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Condition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'type' => {'type'=>'CodeableConcept', 'path'=>'Condition.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
            'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Condition.value[x]', 'min'=>1, 'max'=>1},
            'valueBoolean' => {'type'=>'boolean', 'path'=>'Condition.value[x]', 'min'=>1, 'max'=>1},
            'valueQuantity' => {'type'=>'Quantity', 'path'=>'Condition.value[x]', 'min'=>1, 'max'=>1},
            'valueRange' => {'type'=>'Range', 'path'=>'Condition.value[x]', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                   # 0-1 id
          attr_accessor :extension            # 0-* [ Extension ]
          attr_accessor :modifierExtension    # 0-* [ Extension ]
          attr_accessor :type                 # 1-1 CodeableConcept
          attr_accessor :valueCodeableConcept # 1-1 CodeableConcept
          attr_accessor :valueBoolean         # 1-1 boolean
          attr_accessor :valueQuantity        # 1-1 Quantity
          attr_accessor :valueRange           # 1-1 Range
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :description       # 0-1 string
        attr_accessor :condition         # 0-1 Protocol::Step::Precondition::Condition
        attr_accessor :intersection      # 0-* [ Protocol::Step::Precondition ]
        attr_accessor :union             # 0-* [ Protocol::Step::Precondition ]
        attr_accessor :exclude           # 0-* [ Protocol::Step::Precondition ]
      end

      class Activity < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Activity.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Activity.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Activity.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'alternative' => {'type'=>'uri', 'path'=>'Activity.alternative', 'min'=>0, 'max'=>Float::INFINITY},
          'component' => {'type'=>'Protocol::Step::Activity::Component', 'path'=>'Activity.component', 'min'=>0, 'max'=>Float::INFINITY},
          'following' => {'type'=>'uri', 'path'=>'Activity.following', 'min'=>0, 'max'=>Float::INFINITY},
          'wait' => {'type'=>'Quantity', 'path'=>'Activity.wait', 'min'=>0, 'max'=>1},
          'detail' => {'type'=>'Protocol::Step::Activity::Detail', 'path'=>'Activity.detail', 'min'=>1, 'max'=>1}
        }

        class Component < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Component.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Component.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Component.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'sequence' => {'type'=>'integer', 'path'=>'Component.sequence', 'min'=>0, 'max'=>1},
            'activity' => {'type'=>'uri', 'path'=>'Component.activity', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :sequence          # 0-1 integer
          attr_accessor :activity          # 1-1 uri
        end

        class Detail < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          MULTIPLE_TYPES = {
            'timing' => ['CodeableConcept', 'Timing']
          }
          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'category' => {'valid_codes'=>{'http://hl7.org/fhir/activity-definition-category'=>['diet', 'drug', 'encounter', 'observation', 'procedure', 'supply', 'other']}, 'type'=>'code', 'path'=>'Detail.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/activity-definition-category'}},
            'code' => {'type'=>'CodeableConcept', 'path'=>'Detail.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
            'timingCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Detail.timing[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
            'timingTiming' => {'type'=>'Timing', 'path'=>'Detail.timing[x]', 'min'=>0, 'max'=>1},
            'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Detail.location', 'min'=>0, 'max'=>1},
            'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Detail.performer', 'min'=>0, 'max'=>Float::INFINITY},
            'product' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/Substance'], 'type'=>'Reference', 'path'=>'Detail.product', 'min'=>0, 'max'=>1},
            'quantity' => {'type'=>'Quantity', 'path'=>'Detail.quantity', 'min'=>0, 'max'=>1},
            'description' => {'type'=>'string', 'path'=>'Detail.description', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                    # 0-1 id
          attr_accessor :extension             # 0-* [ Extension ]
          attr_accessor :modifierExtension     # 0-* [ Extension ]
          attr_accessor :category              # 0-1 code
          attr_accessor :code                  # 0-1 CodeableConcept
          attr_accessor :timingCodeableConcept # 0-1 CodeableConcept
          attr_accessor :timingTiming          # 0-1 Timing
          attr_accessor :location              # 0-1 Reference(Location)
          attr_accessor :performer             # 0-* [ Reference(Practitioner|Organization|RelatedPerson|Patient) ]
          attr_accessor :product               # 0-1 Reference(Medication|Substance)
          attr_accessor :quantity              # 0-1 Quantity
          attr_accessor :description           # 0-1 string
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :alternative       # 0-* [ uri ]
        attr_accessor :component         # 0-* [ Protocol::Step::Activity::Component ]
        attr_accessor :following         # 0-* [ uri ]
        attr_accessor :wait              # 0-1 Quantity
        attr_accessor :detail            # 1-1 Protocol::Step::Activity::Detail
      end

      class Next < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Next.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Next.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Next.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'description' => {'type'=>'string', 'path'=>'Next.description', 'min'=>0, 'max'=>1},
          'reference' => {'type'=>'uri', 'path'=>'Next.reference', 'min'=>0, 'max'=>1},
          'condition' => {'type'=>'Protocol::Step::Precondition', 'path'=>'Next.condition', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :description       # 0-1 string
        attr_accessor :reference         # 0-1 uri
        attr_accessor :condition         # 0-1 Protocol::Step::Precondition
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 0-1 string
      attr_accessor :description       # 0-1 string
      attr_accessor :duration          # 0-1 Quantity
      attr_accessor :precondition      # 0-1 Protocol::Step::Precondition
      attr_accessor :exit              # 0-1 Protocol::Step::Precondition
      attr_accessor :firstActivity     # 0-1 uri
      attr_accessor :activity          # 0-* [ Protocol::Step::Activity ]
      attr_accessor :next              # 0-* [ Protocol::Step::Next ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :title             # 0-1 string
    attr_accessor :status            # 1-1 code
    attr_accessor :type              # 1-1 code
    attr_accessor :subject           # 0-1 Reference(Condition|Device|Medication)
    attr_accessor :group             # 0-1 Reference(Group)
    attr_accessor :purpose           # 1-1 string
    attr_accessor :author            # 0-1 Reference(Organization)
    attr_accessor :step              # 0-* [ Protocol::Step ]

    def resourceType
      'Protocol'
    end
  end
end