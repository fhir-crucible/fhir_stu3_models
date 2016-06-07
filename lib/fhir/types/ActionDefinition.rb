module FHIR
  class ActionDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = []
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ActionDefinition.id', 'min'=>0, 'max'=>1},
      'extension' => {'type'=>'Extension', 'path'=>'ActionDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'actionIdentifier' => {'type'=>'Identifier', 'path'=>'ActionDefinition.actionIdentifier', 'min'=>0, 'max'=>1},
      'label' => {'type'=>'string', 'path'=>'ActionDefinition.label', 'min'=>0, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'ActionDefinition.title', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'ActionDefinition.description', 'min'=>0, 'max'=>1},
      'textEquivalent' => {'type'=>'string', 'path'=>'ActionDefinition.textEquivalent', 'min'=>0, 'max'=>1},
      'concept' => {'type'=>'CodeableConcept', 'path'=>'ActionDefinition.concept', 'min'=>0, 'max'=>Float::INFINITY},
      'supportingEvidence' => {'type'=>'Attachment', 'path'=>'ActionDefinition.supportingEvidence', 'min'=>0, 'max'=>Float::INFINITY},
      'documentation' => {'type'=>'Attachment', 'path'=>'ActionDefinition.documentation', 'min'=>0, 'max'=>Float::INFINITY},
      'relatedAction' => {'type'=>'ActionDefinition::Relatedaction', 'path'=>'ActionDefinition.relatedAction', 'min'=>0, 'max'=>1},
      'participantType' => {'valid_codes'=>{'http://hl7.org/fhir/action-participant-type'=>['patient', 'practitioner', 'related-person']}, 'type'=>'code', 'path'=>'ActionDefinition.participantType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/action-participant-type'}},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/action-type'=>['create', 'update', 'remove', 'fire-event']}, 'type'=>'code', 'path'=>'ActionDefinition.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/action-type'}},
      'behavior' => {'type'=>'ActionDefinition::Behavior', 'path'=>'ActionDefinition.behavior', 'min'=>0, 'max'=>Float::INFINITY},
      'resource' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'ActionDefinition.resource', 'min'=>0, 'max'=>1},
      'customization' => {'type'=>'ActionDefinition::Customization', 'path'=>'ActionDefinition.customization', 'min'=>0, 'max'=>Float::INFINITY},
      'action' => {'type'=>'ActionDefinition', 'path'=>'ActionDefinition.action', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Relatedaction < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'offset' => ['Quantity', 'Range']
      }
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Relatedaction.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Relatedaction.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'actionIdentifier' => {'type'=>'Identifier', 'path'=>'Relatedaction.actionIdentifier', 'min'=>1, 'max'=>1},
        'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/action-relationship-type'=>['before', 'after']}, 'type'=>'code', 'path'=>'Relatedaction.relationship', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/action-relationship-type'}},
        'offsetQuantity' => {'type'=>'Quantity', 'path'=>'Relatedaction.offset[x]', 'min'=>0, 'max'=>1},
        'offsetRange' => {'type'=>'Range', 'path'=>'Relatedaction.offset[x]', 'min'=>0, 'max'=>1},
        'anchor' => {'valid_codes'=>{'http://hl7.org/fhir/action-relationship-anchor'=>['start', 'end']}, 'type'=>'code', 'path'=>'Relatedaction.anchor', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/action-relationship-anchor'}}
      }

      attr_accessor :id               # 0-1 id
      attr_accessor :extension        # 0-* [ Extension ]
      attr_accessor :actionIdentifier # 1-1 Identifier
      attr_accessor :relationship     # 1-1 code
      attr_accessor :offsetQuantity   # 0-1 Quantity
      attr_accessor :offsetRange      # 0-1 Range
      attr_accessor :anchor           # 0-1 code
    end

    class Behavior < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Behavior.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Behavior.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/action-behavior-type'=>['grouping', 'selection', 'required', 'precheck', 'cardinality']}, 'type'=>'Coding', 'path'=>'Behavior.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/action-behavior-type'}},
        'value' => {'type'=>'Coding', 'path'=>'Behavior.value', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id        # 0-1 id
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :type      # 1-1 Coding
      attr_accessor :value     # 1-1 Coding
    end

    class Customization < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Customization.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Customization.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'path' => {'type'=>'string', 'path'=>'Customization.path', 'min'=>1, 'max'=>1},
        'expression' => {'type'=>'string', 'path'=>'Customization.expression', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id         # 0-1 id
      attr_accessor :extension  # 0-* [ Extension ]
      attr_accessor :path       # 1-1 string
      attr_accessor :expression # 1-1 string
    end

    attr_accessor :id                 # 0-1 id
    attr_accessor :extension          # 0-* [ Extension ]
    attr_accessor :actionIdentifier   # 0-1 Identifier
    attr_accessor :label              # 0-1 string
    attr_accessor :title              # 0-1 string
    attr_accessor :description        # 0-1 string
    attr_accessor :textEquivalent     # 0-1 string
    attr_accessor :concept            # 0-* [ CodeableConcept ]
    attr_accessor :supportingEvidence # 0-* [ Attachment ]
    attr_accessor :documentation      # 0-* [ Attachment ]
    attr_accessor :relatedAction      # 0-1 ActionDefinition::Relatedaction
    attr_accessor :participantType    # 0-* [ code ]
    attr_accessor :type               # 0-1 code
    attr_accessor :behavior           # 0-* [ ActionDefinition::Behavior ]
    attr_accessor :resource           # 0-1 Reference(Resource)
    attr_accessor :customization      # 0-* [ ActionDefinition::Customization ]
    attr_accessor :action             # 0-* [ ActionDefinition ]
  end
end