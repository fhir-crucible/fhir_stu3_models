module FHIR
  class PractitionerRole < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["email", "identifier", "location", "organization", "phone", "practitioner", "role", "specialty", "telecom"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'PractitionerRole.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'PractitionerRole.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'PractitionerRole.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'PractitionerRole.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'PractitionerRole.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'PractitionerRole.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'PractitionerRole.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'PractitionerRole.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'PractitionerRole.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'active' => {'type'=>'boolean', 'path'=>'PractitionerRole.active', 'min'=>0, 'max'=>1},
      'practitioner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'PractitionerRole.practitioner', 'min'=>0, 'max'=>1},
      'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PractitionerRole.organization', 'min'=>0, 'max'=>1},
      'role' => {'valid_codes'=>{'http://hl7.org/fhir/practitioner-role'=>['doctor', 'nurse', 'pharmacist', 'researcher', 'teacher', 'ict']}, 'type'=>'CodeableConcept', 'path'=>'PractitionerRole.role', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/practitioner-role'}},
      'specialty' => {'valid_codes'=>{'http://snomed.info/sct'=>['408467006', '394577000', '394578005', '421661004', '408462000', '394579002', '394804000', '394580004', '394803006', '408480009', '408454008', '394809005', '394592004', '394600006', '394601005', '394581000', '408478003', '394812008', '408444009', '394582007', '408475000', '410005002', '394583002', '419772000', '394584008', '408443003', '394802001', '394915009', '394814009', '394808002', '394811001', '408446006', '394586005', '394916005', '408472002', '394597005', '394598000', '394807007', '419192003', '408468001', '394593009', '394813003', '410001006', '394589003', '394591006', '394599008', '394649004', '408470005', '394585009', '394821009', '422191005', '394594003', '416304004', '418960008', '394882004', '394806003', '394588006', '408459003', '394607009', '419610006', '418058008', '420208008', '418652005', '418535003', '418862001', '419365004', '418002000', '419983000', '419170002', '419472004', '394539006', '420112009', '409968004', '394587001', '394913002', '408440000', '418112009', '419815003', '394914008', '408455009', '394602003', '408447002', '394810000', '408450004', '408476004', '408469009', '408466002', '408471009', '408464004', '408441001', '408465003', '394605001', '394608004', '408461007', '408460008', '394606000', '408449004', '418018006', '394604002', '394609007', '408474001', '394610002', '394611003', '408477008', '394801008', '408463005', '419321007', '394576009', '394590007', '409967009', '408448007', '419043006', '394612005', '394733009', '394732004']}, 'type'=>'CodeableConcept', 'path'=>'PractitionerRole.specialty', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/c80-practice-codes'}},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'PractitionerRole.location', 'min'=>0, 'max'=>Float::INFINITY},
      'healthcareService' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/HealthcareService'], 'type'=>'Reference', 'path'=>'PractitionerRole.healthcareService', 'min'=>0, 'max'=>Float::INFINITY},
      'telecom' => {'type'=>'ContactPoint', 'path'=>'PractitionerRole.telecom', 'min'=>0, 'max'=>Float::INFINITY},
      'period' => {'type'=>'Period', 'path'=>'PractitionerRole.period', 'min'=>0, 'max'=>1},
      'availableTime' => {'type'=>'PractitionerRole::Availabletime', 'path'=>'PractitionerRole.availableTime', 'min'=>0, 'max'=>Float::INFINITY},
      'notAvailable' => {'type'=>'PractitionerRole::Notavailable', 'path'=>'PractitionerRole.notAvailable', 'min'=>0, 'max'=>Float::INFINITY},
      'availabilityExceptions' => {'type'=>'string', 'path'=>'PractitionerRole.availabilityExceptions', 'min'=>0, 'max'=>1}
    }

    class Availabletime < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Availabletime.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Availabletime.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Availabletime.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'daysOfWeek' => {'valid_codes'=>{'http://hl7.org/fhir/days-of-week'=>['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun']}, 'type'=>'code', 'path'=>'Availabletime.daysOfWeek', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/days-of-week'}},
        'allDay' => {'type'=>'boolean', 'path'=>'Availabletime.allDay', 'min'=>0, 'max'=>1},
        'availableStartTime' => {'type'=>'time', 'path'=>'Availabletime.availableStartTime', 'min'=>0, 'max'=>1},
        'availableEndTime' => {'type'=>'time', 'path'=>'Availabletime.availableEndTime', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                 # 0-1 id
      attr_accessor :extension          # 0-* [ Extension ]
      attr_accessor :modifierExtension  # 0-* [ Extension ]
      attr_accessor :daysOfWeek         # 0-* [ code ]
      attr_accessor :allDay             # 0-1 boolean
      attr_accessor :availableStartTime # 0-1 time
      attr_accessor :availableEndTime   # 0-1 time
    end

    class Notavailable < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Notavailable.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Notavailable.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Notavailable.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'string', 'path'=>'Notavailable.description', 'min'=>1, 'max'=>1},
        'during' => {'type'=>'Period', 'path'=>'Notavailable.during', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :description       # 1-1 string
      attr_accessor :during            # 0-1 Period
    end

    attr_accessor :id                     # 0-1 id
    attr_accessor :meta                   # 0-1 Meta
    attr_accessor :implicitRules          # 0-1 uri
    attr_accessor :language               # 0-1 code
    attr_accessor :text                   # 0-1 Narrative
    attr_accessor :contained              # 0-* [ Resource ]
    attr_accessor :extension              # 0-* [ Extension ]
    attr_accessor :modifierExtension      # 0-* [ Extension ]
    attr_accessor :identifier             # 0-* [ Identifier ]
    attr_accessor :active                 # 0-1 boolean
    attr_accessor :practitioner           # 0-1 Reference(Practitioner)
    attr_accessor :organization           # 0-1 Reference(Organization)
    attr_accessor :role                   # 0-* [ CodeableConcept ]
    attr_accessor :specialty              # 0-* [ CodeableConcept ]
    attr_accessor :location               # 0-* [ Reference(Location) ]
    attr_accessor :healthcareService      # 0-* [ Reference(HealthcareService) ]
    attr_accessor :telecom                # 0-* [ ContactPoint ]
    attr_accessor :period                 # 0-1 Period
    attr_accessor :availableTime          # 0-* [ PractitionerRole::Availabletime ]
    attr_accessor :notAvailable           # 0-* [ PractitionerRole::Notavailable ]
    attr_accessor :availabilityExceptions # 0-1 string

    def resourceType
      'PractitionerRole'
    end
  end
end