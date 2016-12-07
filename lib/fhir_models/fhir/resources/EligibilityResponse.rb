module FHIR
  class EligibilityResponse < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = []
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'EligibilityResponse.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'EligibilityResponse.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'EligibilityResponse.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'EligibilityResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'EligibilityResponse.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'EligibilityResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'EligibilityResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'EligibilityResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'EligibilityResponse.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error', 'active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'EligibilityResponse.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
      'created' => {'type'=>'dateTime', 'path'=>'EligibilityResponse.created', 'min'=>0, 'max'=>1},
      'requestProvider' => {'type'=>'Reference', 'path'=>'EligibilityResponse.requestProvider', 'min'=>0, 'max'=>1},
      'requestOrganization' => {'type'=>'Reference', 'path'=>'EligibilityResponse.requestOrganization', 'min'=>0, 'max'=>1},
      'request' => {'type'=>'Reference', 'path'=>'EligibilityResponse.request', 'min'=>0, 'max'=>1},
      'outcome' => {'valid_codes'=>{'http://hl7.org/fhir/remittance-outcome'=>['complete', 'error', 'partial', 'complete', 'error', 'partial']}, 'type'=>'CodeableConcept', 'path'=>'EligibilityResponse.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/remittance-outcome'}},
      'disposition' => {'type'=>'string', 'path'=>'EligibilityResponse.disposition', 'min'=>0, 'max'=>1},
      'insurer' => {'type'=>'Reference', 'path'=>'EligibilityResponse.insurer', 'min'=>0, 'max'=>1},
      'inforce' => {'type'=>'boolean', 'path'=>'EligibilityResponse.inforce', 'min'=>0, 'max'=>1},
      'insurance' => {'type'=>'EligibilityResponse::Insurance', 'path'=>'EligibilityResponse.insurance', 'min'=>0, 'max'=>Float::INFINITY},
      'form' => {'valid_codes'=>{'http://hl7.org/fhir/forms-codes'=>['1', '2', '1', '2']}, 'type'=>'CodeableConcept', 'path'=>'EligibilityResponse.form', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/forms'}},
      'error' => {'type'=>'EligibilityResponse::Error', 'path'=>'EligibilityResponse.error', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Insurance < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Insurance.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Insurance.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Insurance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'coverage' => {'type'=>'Reference', 'path'=>'Insurance.coverage', 'min'=>0, 'max'=>1},
        'contract' => {'type'=>'Reference', 'path'=>'Insurance.contract', 'min'=>0, 'max'=>1},
        'benefitBalance' => {'type'=>'EligibilityResponse::Insurance::BenefitBalance', 'path'=>'Insurance.benefitBalance', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class BenefitBalance < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'BenefitBalance.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'BenefitBalance.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'BenefitBalance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'category' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-category'=>['oral', 'vision', 'medical', 'pharmacy', 'oral', 'vision', 'medical', 'pharmacy']}, 'type'=>'CodeableConcept', 'path'=>'BenefitBalance.category', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-category'}},
          'subCategory' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-subcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6', '1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'CodeableConcept', 'path'=>'BenefitBalance.subCategory', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-subcategory'}},
          'excluded' => {'type'=>'boolean', 'path'=>'BenefitBalance.excluded', 'min'=>0, 'max'=>1},
          'name' => {'type'=>'string', 'path'=>'BenefitBalance.name', 'min'=>0, 'max'=>1},
          'description' => {'type'=>'string', 'path'=>'BenefitBalance.description', 'min'=>0, 'max'=>1},
          'network' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-network'=>['in', 'out', 'in', 'out']}, 'type'=>'CodeableConcept', 'path'=>'BenefitBalance.network', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-network'}},
          'unit' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-unit'=>['individual', 'family', 'individual', 'family']}, 'type'=>'CodeableConcept', 'path'=>'BenefitBalance.unit', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-unit'}},
          'term' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-term'=>['annual', 'day', 'lifetime', 'annual', 'day', 'lifetime']}, 'type'=>'CodeableConcept', 'path'=>'BenefitBalance.term', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-term'}},
          'financial' => {'type'=>'EligibilityResponse::Insurance::BenefitBalance::Financial', 'path'=>'BenefitBalance.financial', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Financial < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          MULTIPLE_TYPES = {
            'benefit' => ['unsignedInt', 'string', 'Money'],
            'benefitUsed' => ['unsignedInt', 'Money']
          }
          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Financial.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Financial.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Financial.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'type' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-type'=>['benefit', 'deductable', 'visit', 'room', 'copay', 'copay-percent', 'copay-maximum', 'vision-exam', 'vision-glasses', 'vision-contacts', 'medical-primarycare', 'pharmacy-dispense', 'benefit', 'deductable', 'visit', 'room', 'copay', 'copay-percent', 'copay-maximum', 'vision-exam', 'vision-glasses', 'vision-contacts', 'medical-primarycare', 'pharmacy-dispense']}, 'type'=>'CodeableConcept', 'path'=>'Financial.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-type'}},
            'benefitUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Financial.benefit[x]', 'min'=>0, 'max'=>1},
            'benefitString' => {'type'=>'string', 'path'=>'Financial.benefit[x]', 'min'=>0, 'max'=>1},
            'benefitMoney' => {'type'=>'Money', 'path'=>'Financial.benefit[x]', 'min'=>0, 'max'=>1},
            'benefitUsedUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Financial.benefitUsed[x]', 'min'=>0, 'max'=>1},
            'benefitUsedMoney' => {'type'=>'Money', 'path'=>'Financial.benefitUsed[x]', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                     # 0-1 string
          attr_accessor :extension              # 0-* [ Extension ]
          attr_accessor :modifierExtension      # 0-* [ Extension ]
          attr_accessor :type                   # 1-1 CodeableConcept
          attr_accessor :benefitUnsignedInt     # 0-1 unsignedInt
          attr_accessor :benefitString          # 0-1 string
          attr_accessor :benefitMoney           # 0-1 Money
          attr_accessor :benefitUsedUnsignedInt # 0-1 unsignedInt
          attr_accessor :benefitUsedMoney       # 0-1 Money
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :category          # 1-1 CodeableConcept
        attr_accessor :subCategory       # 0-1 CodeableConcept
        attr_accessor :excluded          # 0-1 boolean
        attr_accessor :name              # 0-1 string
        attr_accessor :description       # 0-1 string
        attr_accessor :network           # 0-1 CodeableConcept
        attr_accessor :unit              # 0-1 CodeableConcept
        attr_accessor :term              # 0-1 CodeableConcept
        attr_accessor :financial         # 0-* [ EligibilityResponse::Insurance::BenefitBalance::Financial ]
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :coverage          # 0-1 Reference()
      attr_accessor :contract          # 0-1 Reference()
      attr_accessor :benefitBalance    # 0-* [ EligibilityResponse::Insurance::BenefitBalance ]
    end

    class Error < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Error.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Error.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Error.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'valid_codes'=>{'http://hl7.org/fhir/adjudication-error'=>['a001', 'a002', 'a001', 'a002']}, 'type'=>'CodeableConcept', 'path'=>'Error.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/adjudication-error'}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 1-1 CodeableConcept
    end

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
    attr_accessor :created             # 0-1 dateTime
    attr_accessor :requestProvider     # 0-1 Reference()
    attr_accessor :requestOrganization # 0-1 Reference()
    attr_accessor :request             # 0-1 Reference()
    attr_accessor :outcome             # 0-1 CodeableConcept
    attr_accessor :disposition         # 0-1 string
    attr_accessor :insurer             # 0-1 Reference()
    attr_accessor :inforce             # 0-1 boolean
    attr_accessor :insurance           # 0-* [ EligibilityResponse::Insurance ]
    attr_accessor :form                # 0-1 CodeableConcept
    attr_accessor :error               # 0-* [ EligibilityResponse::Error ]

    def resourceType
      'EligibilityResponse'
    end
  end
end