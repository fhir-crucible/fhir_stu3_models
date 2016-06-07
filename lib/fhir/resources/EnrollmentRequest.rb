module FHIR
  class EnrollmentRequest < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["identifier", "patient", "subject"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'EnrollmentRequest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'EnrollmentRequest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'EnrollmentRequest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'EnrollmentRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'EnrollmentRequest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'EnrollmentRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'EnrollmentRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'EnrollmentRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'EnrollmentRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'ruleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'EnrollmentRequest.ruleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'originalRuleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'EnrollmentRequest.originalRuleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'created' => {'type'=>'dateTime', 'path'=>'EnrollmentRequest.created', 'min'=>0, 'max'=>1},
      'target' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'EnrollmentRequest.target', 'min'=>0, 'max'=>1},
      'provider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'EnrollmentRequest.provider', 'min'=>0, 'max'=>1},
      'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'EnrollmentRequest.organization', 'min'=>0, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'EnrollmentRequest.subject', 'min'=>1, 'max'=>1},
      'coverage' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage'], 'type'=>'Reference', 'path'=>'EnrollmentRequest.coverage', 'min'=>1, 'max'=>1},
      'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/relationship'=>['1', '2', '3', '4', '5']}, 'type'=>'Coding', 'path'=>'EnrollmentRequest.relationship', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/relationship'}}
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
    attr_accessor :ruleset           # 0-1 Coding
    attr_accessor :originalRuleset   # 0-1 Coding
    attr_accessor :created           # 0-1 dateTime
    attr_accessor :target            # 0-1 Reference(Organization)
    attr_accessor :provider          # 0-1 Reference(Practitioner)
    attr_accessor :organization      # 0-1 Reference(Organization)
    attr_accessor :subject           # 1-1 Reference(Patient)
    attr_accessor :coverage          # 1-1 Reference(Coverage)
    attr_accessor :relationship      # 1-1 Coding

    def resourceType
      'EnrollmentRequest'
    end
  end
end