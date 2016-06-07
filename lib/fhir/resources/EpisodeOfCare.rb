module FHIR
  class EpisodeOfCare < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["care-manager", "condition", "date", "identifier", "incomingreferral", "organization", "patient", "status", "type"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'EpisodeOfCare.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'EpisodeOfCare.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'EpisodeOfCare.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'EpisodeOfCare.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'EpisodeOfCare.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'EpisodeOfCare.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'EpisodeOfCare.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'EpisodeOfCare.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'EpisodeOfCare.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/episode-of-care-status'=>['planned', 'waitlist', 'active', 'onhold', 'finished', 'cancelled']}, 'type'=>'code', 'path'=>'EpisodeOfCare.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/episode-of-care-status'}},
      'statusHistory' => {'type'=>'EpisodeOfCare::Statushistory', 'path'=>'EpisodeOfCare.statusHistory', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'type'=>'CodeableConcept', 'path'=>'EpisodeOfCare.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'condition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition'], 'type'=>'Reference', 'path'=>'EpisodeOfCare.condition', 'min'=>0, 'max'=>Float::INFINITY},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'EpisodeOfCare.patient', 'min'=>1, 'max'=>1},
      'managingOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'EpisodeOfCare.managingOrganization', 'min'=>0, 'max'=>1},
      'period' => {'type'=>'Period', 'path'=>'EpisodeOfCare.period', 'min'=>0, 'max'=>1},
      'referralRequest' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ReferralRequest'], 'type'=>'Reference', 'path'=>'EpisodeOfCare.referralRequest', 'min'=>0, 'max'=>Float::INFINITY},
      'careManager' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'EpisodeOfCare.careManager', 'min'=>0, 'max'=>1},
      'team' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'EpisodeOfCare.team', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Statushistory < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Statushistory.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Statushistory.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Statushistory.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/episode-of-care-status'=>['planned', 'waitlist', 'active', 'onhold', 'finished', 'cancelled']}, 'type'=>'code', 'path'=>'Statushistory.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/episode-of-care-status'}},
        'period' => {'type'=>'Period', 'path'=>'Statushistory.period', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :status            # 1-1 code
      attr_accessor :period            # 1-1 Period
    end

    attr_accessor :id                   # 0-1 id
    attr_accessor :meta                 # 0-1 Meta
    attr_accessor :implicitRules        # 0-1 uri
    attr_accessor :language             # 0-1 code
    attr_accessor :text                 # 0-1 Narrative
    attr_accessor :contained            # 0-* [ Resource ]
    attr_accessor :extension            # 0-* [ Extension ]
    attr_accessor :modifierExtension    # 0-* [ Extension ]
    attr_accessor :identifier           # 0-* [ Identifier ]
    attr_accessor :status               # 1-1 code
    attr_accessor :statusHistory        # 0-* [ EpisodeOfCare::Statushistory ]
    attr_accessor :type                 # 0-* [ CodeableConcept ]
    attr_accessor :condition            # 0-* [ Reference(Condition) ]
    attr_accessor :patient              # 1-1 Reference(Patient)
    attr_accessor :managingOrganization # 0-1 Reference(Organization)
    attr_accessor :period               # 0-1 Period
    attr_accessor :referralRequest      # 0-* [ Reference(ReferralRequest) ]
    attr_accessor :careManager          # 0-1 Reference(Practitioner)
    attr_accessor :team                 # 0-* [ Reference(CareTeam) ]

    def resourceType
      'EpisodeOfCare'
    end
  end
end