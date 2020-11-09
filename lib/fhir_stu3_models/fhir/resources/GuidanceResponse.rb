module FHIR
  module STU3
    class GuidanceResponse < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      SEARCH_PARAMS = 
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'GuidanceResponse.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'GuidanceResponse.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'GuidanceResponse.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'GuidanceResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
        'text' => {'type'=>'Narrative', 'path'=>'GuidanceResponse.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'GuidanceResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'GuidanceResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'GuidanceResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'requestId' => {'type'=>'string', 'path'=>'GuidanceResponse.requestId', 'min'=>0, 'max'=>1},
        'module' => {'type'=>'Reference', 'path'=>'GuidanceResponse.module', 'min'=>1, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/guidance-response-status'=>['success', 'data-requested', 'data-required', 'in-progress', 'failure']}, 'type'=>'code', 'path'=>'GuidanceResponse.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/guidance-response-status'}},
        'evaluationMessage' => {'type'=>'Reference', 'path'=>'GuidanceResponse.evaluationMessage', 'min'=>0, 'max'=>Float::INFINITY},
        'outputParameters' => {'type'=>'Reference', 'path'=>'GuidanceResponse.outputParameters', 'min'=>0, 'max'=>1},
        'action' => {'type'=>'GuidanceResponse::Action', 'path'=>'GuidanceResponse.action', 'min'=>0, 'max'=>Float::INFINITY},
        'dataRequirement' => {'type'=>'DataRequirement', 'path'=>'GuidanceResponse.dataRequirement', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Action < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Action.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Action.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Action.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'actionIdentifier' => {'type'=>'Identifier', 'path'=>'Action.actionIdentifier', 'min'=>0, 'max'=>1},
          'label' => {'type'=>'string', 'path'=>'Action.label', 'min'=>0, 'max'=>1},
          'title' => {'type'=>'string', 'path'=>'Action.title', 'min'=>0, 'max'=>1},
          'description' => {'type'=>'string', 'path'=>'Action.description', 'min'=>0, 'max'=>1},
          'textEquivalent' => {'type'=>'string', 'path'=>'Action.textEquivalent', 'min'=>0, 'max'=>1},
          'concept' => {'type'=>'CodeableConcept', 'path'=>'Action.concept', 'min'=>0, 'max'=>Float::INFINITY},
          'supportingEvidence' => {'type'=>'Attachment', 'path'=>'Action.supportingEvidence', 'min'=>0, 'max'=>Float::INFINITY},
          'relatedAction' => {'type'=>'GuidanceResponse::Action::RelatedAction', 'path'=>'Action.relatedAction', 'min'=>0, 'max'=>1},
          'documentation' => {'type'=>'Attachment', 'path'=>'Action.documentation', 'min'=>0, 'max'=>Float::INFINITY},
          'participant' => {'type'=>'Reference', 'path'=>'Action.participant', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/action-type'=>['create', 'update', 'remove', 'fire-event']}, 'type'=>'code', 'path'=>'Action.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/action-type'}},
          'behavior' => {'type'=>'GuidanceResponse::Action::Behavior', 'path'=>'Action.behavior', 'min'=>0, 'max'=>Float::INFINITY},
          'resource' => {'type'=>'Reference', 'path'=>'Action.resource', 'min'=>0, 'max'=>1},
          'action' => {'type'=>'Action', 'path'=>'Action.action', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class RelatedAction < FHIR::STU3::Model
          include FHIR::STU3::Hashable
          include FHIR::STU3::Json
          include FHIR::STU3::Xml

          MULTIPLE_TYPES = {
            'offset' => ['Quantity', 'Range']
          }
          METADATA = {
            'id' => {'type'=>'id', 'path'=>'RelatedAction.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'RelatedAction.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'RelatedAction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'actionIdentifier' => {'type'=>'Identifier', 'path'=>'RelatedAction.actionIdentifier', 'min'=>1, 'max'=>1},
            'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/action-relationship-type'=>['before', 'after']}, 'type'=>'code', 'path'=>'RelatedAction.relationship', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/action-relationship-type'}},
            'offsetQuantity' => {'type'=>'Quantity', 'path'=>'RelatedAction.offset[x]', 'min'=>0, 'max'=>1},
            'offsetRange' => {'type'=>'Range', 'path'=>'RelatedAction.offset[x]', 'min'=>0, 'max'=>1},
            'anchor' => {'valid_codes'=>{'http://hl7.org/fhir/action-relationship-anchor'=>['start', 'end']}, 'type'=>'code', 'path'=>'RelatedAction.anchor', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/action-relationship-anchor'}}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :actionIdentifier  # 1-1 Identifier
          attr_accessor :relationship      # 1-1 code
          attr_accessor :offsetQuantity    # 0-1 Quantity
          attr_accessor :offsetRange       # 0-1 Range
          attr_accessor :anchor            # 0-1 code
        end

        class Behavior < FHIR::STU3::Model
          include FHIR::STU3::Hashable
          include FHIR::STU3::Json
          include FHIR::STU3::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Behavior.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Behavior.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Behavior.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'type' => {'valid_codes'=>{'http://hl7.org/fhir/action-behavior-type'=>['grouping', 'selection', 'required', 'precheck', 'cardinality']}, 'type'=>'Coding', 'path'=>'Behavior.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/action-behavior-type'}},
            'value' => {'type'=>'Coding', 'path'=>'Behavior.value', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :type              # 1-1 Coding
          attr_accessor :value             # 1-1 Coding
        end

        attr_accessor :id                 # 0-1 id
        attr_accessor :extension          # 0-* [ Extension ]
        attr_accessor :modifierExtension  # 0-* [ Extension ]
        attr_accessor :actionIdentifier   # 0-1 Identifier
        attr_accessor :label              # 0-1 string
        attr_accessor :title              # 0-1 string
        attr_accessor :description        # 0-1 string
        attr_accessor :textEquivalent     # 0-1 string
        attr_accessor :concept            # 0-* [ CodeableConcept ]
        attr_accessor :supportingEvidence # 0-* [ Attachment ]
        attr_accessor :relatedAction      # 0-1 GuidanceResponse::Action::RelatedAction
        attr_accessor :documentation      # 0-* [ Attachment ]
        attr_accessor :participant        # 0-* [ Reference() ]
        attr_accessor :type               # 0-1 code
        attr_accessor :behavior           # 0-* [ GuidanceResponse::Action::Behavior ]
        attr_accessor :resource           # 0-1 Reference()
        attr_accessor :action             # 0-* [ Action ]
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :requestId         # 0-1 string
      attr_accessor :module            # 1-1 Reference()
      attr_accessor :status            # 1-1 code
      attr_accessor :evaluationMessage # 0-* [ Reference() ]
      attr_accessor :outputParameters  # 0-1 Reference()
      attr_accessor :action            # 0-* [ GuidanceResponse::Action ]
      attr_accessor :dataRequirement   # 0-* [ DataRequirement ]

      def resourceType
        'GuidanceResponse'
      end
    end
  end
end