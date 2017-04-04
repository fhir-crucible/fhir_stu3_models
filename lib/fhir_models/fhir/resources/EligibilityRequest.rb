module FHIR
  class EligibilityRequest < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'serviced' => ['date', 'Period']
    }
    SEARCH_PARAMS = ['created', 'enterer', 'facility', 'identifier', 'organization', 'patient', 'provider']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'EligibilityRequest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'EligibilityRequest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'EligibilityRequest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'EligibilityRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'EligibilityRequest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'EligibilityRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'EligibilityRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'EligibilityRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'EligibilityRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error', 'active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'EligibilityRequest.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
      'priority' => {'valid_codes'=>{'http://hl7.org/fhir/processpriority'=>['stat', 'normal', 'deferred', 'stat', 'normal', 'deferred']}, 'type'=>'CodeableConcept', 'path'=>'EligibilityRequest.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/process-priority'}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'EligibilityRequest.patient', 'min'=>0, 'max'=>1},
      'servicedDate' => {'type'=>'date', 'path'=>'EligibilityRequest.serviced[x]', 'min'=>0, 'max'=>1},
      'servicedPeriod' => {'type'=>'Period', 'path'=>'EligibilityRequest.serviced[x]', 'min'=>0, 'max'=>1},
      'created' => {'type'=>'dateTime', 'path'=>'EligibilityRequest.created', 'min'=>0, 'max'=>1},
      'enterer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'EligibilityRequest.enterer', 'min'=>0, 'max'=>1},
      'provider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'EligibilityRequest.provider', 'min'=>0, 'max'=>1},
      'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'EligibilityRequest.organization', 'min'=>0, 'max'=>1},
      'insurer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'EligibilityRequest.insurer', 'min'=>0, 'max'=>1},
      'facility' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'EligibilityRequest.facility', 'min'=>0, 'max'=>1},
      'coverage' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage'], 'type'=>'Reference', 'path'=>'EligibilityRequest.coverage', 'min'=>0, 'max'=>1},
      'businessArrangement' => {'type'=>'string', 'path'=>'EligibilityRequest.businessArrangement', 'min'=>0, 'max'=>1},
      'benefitCategory' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-category'=>['oral', 'vision', 'medical', 'pharmacy', 'oral', 'vision', 'medical', 'pharmacy']}, 'type'=>'CodeableConcept', 'path'=>'EligibilityRequest.benefitCategory', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-category'}},
      'benefitSubCategory' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-subcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6', '1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'CodeableConcept', 'path'=>'EligibilityRequest.benefitSubCategory', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-subcategory'}}
    }

    attr_accessor :id                  # 0-1 id
    attr_accessor :meta                # 0-1 Meta
    attr_accessor :implicitRules       # 0-1 uri
    attr_accessor :language            # 0-1 code
    attr_accessor :text                # 0-1 Narrative
    attr_accessor :contained           # 0-* [ Resource ]
    attr_accessor :extension           # 0-* [ Extension ]
    attr_accessor :modifierExtension   # 0-* [ Extension ]
    attr_accessor :identifier          # 0-* [ Identifier ]
    attr_accessor :status              # 0-1 code
    attr_accessor :priority            # 0-1 CodeableConcept
    attr_accessor :patient             # 0-1 Reference(Patient)
    attr_accessor :servicedDate        # 0-1 date
    attr_accessor :servicedPeriod      # 0-1 Period
    attr_accessor :created             # 0-1 dateTime
    attr_accessor :enterer             # 0-1 Reference(Practitioner)
    attr_accessor :provider            # 0-1 Reference(Practitioner)
    attr_accessor :organization        # 0-1 Reference(Organization)
    attr_accessor :insurer             # 0-1 Reference(Organization)
    attr_accessor :facility            # 0-1 Reference(Location)
    attr_accessor :coverage            # 0-1 Reference(Coverage)
    attr_accessor :businessArrangement # 0-1 string
    attr_accessor :benefitCategory     # 0-1 CodeableConcept
    attr_accessor :benefitSubCategory  # 0-1 CodeableConcept

    def resourceType
      'EligibilityRequest'
    end
  end
end