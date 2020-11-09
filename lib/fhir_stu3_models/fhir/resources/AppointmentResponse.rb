module FHIR
  module STU3
    class AppointmentResponse < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      SEARCH_PARAMS = ['actor', 'appointment', 'identifier', 'location', 'part-status', 'patient', 'practitioner']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'AppointmentResponse.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'AppointmentResponse.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'AppointmentResponse.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'AppointmentResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
        'text' => {'type'=>'Narrative', 'path'=>'AppointmentResponse.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'AppointmentResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'AppointmentResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'AppointmentResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'AppointmentResponse.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'appointment' => {'type'=>'Reference', 'path'=>'AppointmentResponse.appointment', 'min'=>1, 'max'=>1},
        'start' => {'type'=>'instant', 'path'=>'AppointmentResponse.start', 'min'=>0, 'max'=>1},
        'end' => {'type'=>'instant', 'path'=>'AppointmentResponse.end', 'min'=>0, 'max'=>1},
        'participantType' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ParticipationType'=>['ADM', 'ATND', 'CALLBCK', 'CON', 'DIS', 'ESC', 'REF', 'SPRF', 'PPRF', 'PART'], 'http://hl7.org/fhir/participant-type'=>['translator', 'emergency']}, 'type'=>'CodeableConcept', 'path'=>'AppointmentResponse.participantType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-participant-type'}},
        'actor' => {'type'=>'Reference', 'path'=>'AppointmentResponse.actor', 'min'=>0, 'max'=>1},
        'participantStatus' => {'valid_codes'=>{'http://hl7.org/fhir/participationstatus'=>['accepted', 'declined', 'tentative', 'needs-action']}, 'type'=>'code', 'path'=>'AppointmentResponse.participantStatus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/participationstatus'}},
        'comment' => {'type'=>'string', 'path'=>'AppointmentResponse.comment', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 0-* [ Identifier ]
      attr_accessor :appointment       # 1-1 Reference()
      attr_accessor :start             # 0-1 instant
      attr_accessor :end               # 0-1 instant
      attr_accessor :participantType   # 0-* [ CodeableConcept ]
      attr_accessor :actor             # 0-1 Reference()
      attr_accessor :participantStatus # 1-1 code
      attr_accessor :comment           # 0-1 string

      def resourceType
        'AppointmentResponse'
      end
    end
  end
end