module FHIR
  class EligibilityRequest < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'target' => ['Identifier', 'Reference'],
      'provider' => ['Identifier', 'Reference'],
      'organization' => ['Identifier', 'Reference'],
      'enterer' => ['Identifier', 'Reference'],
      'facility' => ['Identifier', 'Reference'],
      'patient' => ['Identifier', 'Reference'],
      'coverage' => ['Identifier', 'Reference'],
      'serviced' => ['date', 'Period']
    }
    SEARCH_PARAMS = ["created", "facilityidentifier", "facilityreference", "identifier", "organizationidentifier", "organizationreference", "patientidentifier", "patientreference", "provideridentifier", "providerreference"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'EligibilityRequest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'EligibilityRequest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'EligibilityRequest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'EligibilityRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'EligibilityRequest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'EligibilityRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'EligibilityRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'EligibilityRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'EligibilityRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'ruleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'EligibilityRequest.ruleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'originalRuleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'EligibilityRequest.originalRuleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'created' => {'type'=>'dateTime', 'path'=>'EligibilityRequest.created', 'min'=>0, 'max'=>1},
      'targetIdentifier' => {'type'=>'Identifier', 'path'=>'EligibilityRequest.target[x]', 'min'=>0, 'max'=>1},
      'targetReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'EligibilityRequest.target[x]', 'min'=>0, 'max'=>1},
      'providerIdentifier' => {'type'=>'Identifier', 'path'=>'EligibilityRequest.provider[x]', 'min'=>0, 'max'=>1},
      'providerReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'EligibilityRequest.provider[x]', 'min'=>0, 'max'=>1},
      'organizationIdentifier' => {'type'=>'Identifier', 'path'=>'EligibilityRequest.organization[x]', 'min'=>0, 'max'=>1},
      'organizationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'EligibilityRequest.organization[x]', 'min'=>0, 'max'=>1},
      'priority' => {'valid_codes'=>{'http://hl7.org/fhir/processpriority'=>['stat', 'normal', 'deferred']}, 'type'=>'Coding', 'path'=>'EligibilityRequest.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/process-priority'}},
      'entererIdentifier' => {'type'=>'Identifier', 'path'=>'EligibilityRequest.enterer[x]', 'min'=>0, 'max'=>1},
      'entererReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'EligibilityRequest.enterer[x]', 'min'=>0, 'max'=>1},
      'facilityIdentifier' => {'type'=>'Identifier', 'path'=>'EligibilityRequest.facility[x]', 'min'=>0, 'max'=>1},
      'facilityReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'EligibilityRequest.facility[x]', 'min'=>0, 'max'=>1},
      'patientIdentifier' => {'type'=>'Identifier', 'path'=>'EligibilityRequest.patient[x]', 'min'=>0, 'max'=>1},
      'patientReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'EligibilityRequest.patient[x]', 'min'=>0, 'max'=>1},
      'coverageIdentifier' => {'type'=>'Identifier', 'path'=>'EligibilityRequest.coverage[x]', 'min'=>0, 'max'=>1},
      'coverageReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage'], 'type'=>'Reference', 'path'=>'EligibilityRequest.coverage[x]', 'min'=>0, 'max'=>1},
      'businessArrangement' => {'type'=>'string', 'path'=>'EligibilityRequest.businessArrangement', 'min'=>0, 'max'=>1},
      'servicedDate' => {'type'=>'date', 'path'=>'EligibilityRequest.serviced[x]', 'min'=>0, 'max'=>1},
      'servicedPeriod' => {'type'=>'Period', 'path'=>'EligibilityRequest.serviced[x]', 'min'=>0, 'max'=>1},
      'benefitCategory' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-category'=>['oral', 'vision', 'medical', 'pharmacy']}, 'type'=>'Coding', 'path'=>'EligibilityRequest.benefitCategory', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-category'}},
      'benefitSubCategory' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-subcategory'=>['oral-basic', 'oral-major', 'oral-ortho', 'vision-exam', 'vision-glasses', 'vision-contacts', 'medical-primarycare', 'pharmacy-dispense']}, 'type'=>'Coding', 'path'=>'EligibilityRequest.benefitSubCategory', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-subcategory'}}
    }

    attr_accessor :id                     # 0-1 id
    attr_accessor :meta                   # 0-1 Meta
    attr_accessor :implicitRules          # 0-1 uri
    attr_accessor :language               # 0-1 code
    attr_accessor :text                   # 0-1 Narrative
    attr_accessor :contained              # 0-* [ Resource ]
    attr_accessor :extension              # 0-* [ Extension ]
    attr_accessor :modifierExtension      # 0-* [ Extension ]
    attr_accessor :identifier             # 0-* [ Identifier ]
    attr_accessor :ruleset                # 0-1 Coding
    attr_accessor :originalRuleset        # 0-1 Coding
    attr_accessor :created                # 0-1 dateTime
    attr_accessor :targetIdentifier       # 0-1 Identifier
    attr_accessor :targetReference        # 0-1 Reference(Organization)
    attr_accessor :providerIdentifier     # 0-1 Identifier
    attr_accessor :providerReference      # 0-1 Reference(Practitioner)
    attr_accessor :organizationIdentifier # 0-1 Identifier
    attr_accessor :organizationReference  # 0-1 Reference(Organization)
    attr_accessor :priority               # 0-1 Coding
    attr_accessor :entererIdentifier      # 0-1 Identifier
    attr_accessor :entererReference       # 0-1 Reference(Practitioner)
    attr_accessor :facilityIdentifier     # 0-1 Identifier
    attr_accessor :facilityReference      # 0-1 Reference(Location)
    attr_accessor :patientIdentifier      # 0-1 Identifier
    attr_accessor :patientReference       # 0-1 Reference(Patient)
    attr_accessor :coverageIdentifier     # 0-1 Identifier
    attr_accessor :coverageReference      # 0-1 Reference(Coverage)
    attr_accessor :businessArrangement    # 0-1 string
    attr_accessor :servicedDate           # 0-1 date
    attr_accessor :servicedPeriod         # 0-1 Period
    attr_accessor :benefitCategory        # 0-1 Coding
    attr_accessor :benefitSubCategory     # 0-1 Coding

    def resourceType
      'EligibilityRequest'
    end
  end
end