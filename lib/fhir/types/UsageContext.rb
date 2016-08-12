module FHIR
  class UsageContext < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = []
    METADATA = {
      'id' => {'type'=>'string', 'path'=>'UsageContext.id', 'min'=>0, 'max'=>1},
      'extension' => {'type'=>'Extension', 'path'=>'UsageContext.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'patientGender' => {'valid_codes'=>{'http://hl7.org/fhir/v3/AdministrativeGender'=>['F', 'M', 'UN']}, 'type'=>'CodeableConcept', 'path'=>'UsageContext.patientGender', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-AdministrativeGender'}},
      'patientAgeGroup' => {'type'=>'CodeableConcept', 'path'=>'UsageContext.patientAgeGroup', 'min'=>0, 'max'=>Float::INFINITY},
      'clinicalFocus' => {'type'=>'CodeableConcept', 'path'=>'UsageContext.clinicalFocus', 'min'=>0, 'max'=>Float::INFINITY},
      'targetUser' => {'type'=>'CodeableConcept', 'path'=>'UsageContext.targetUser', 'min'=>0, 'max'=>Float::INFINITY},
      'workflowSetting' => {'type'=>'CodeableConcept', 'path'=>'UsageContext.workflowSetting', 'min'=>0, 'max'=>Float::INFINITY},
      'workflowTask' => {'type'=>'CodeableConcept', 'path'=>'UsageContext.workflowTask', 'min'=>0, 'max'=>Float::INFINITY},
      'clinicalVenue' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActCode'=>['AMB', 'EMER', 'FLD', 'HH', 'IMP', 'ACUTE', 'NONAC', 'PRENC', 'SS', 'VR']}, 'type'=>'CodeableConcept', 'path'=>'UsageContext.clinicalVenue', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ActEncounterCode'}},
      'jurisdiction' => {'type'=>'CodeableConcept', 'path'=>'UsageContext.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY}
    }

    attr_accessor :id              # 0-1 string
    attr_accessor :extension       # 0-* [ Extension ]
    attr_accessor :patientGender   # 0-* [ CodeableConcept ]
    attr_accessor :patientAgeGroup # 0-* [ CodeableConcept ]
    attr_accessor :clinicalFocus   # 0-* [ CodeableConcept ]
    attr_accessor :targetUser      # 0-* [ CodeableConcept ]
    attr_accessor :workflowSetting # 0-* [ CodeableConcept ]
    attr_accessor :workflowTask    # 0-* [ CodeableConcept ]
    attr_accessor :clinicalVenue   # 0-* [ CodeableConcept ]
    attr_accessor :jurisdiction    # 0-* [ CodeableConcept ]
  end
end