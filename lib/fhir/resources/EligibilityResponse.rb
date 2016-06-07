module FHIR
  class EligibilityResponse < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'request' => ['Identifier', 'Reference'],
      'organization' => ['Identifier', 'Reference'],
      'requestProvider' => ['Identifier', 'Reference'],
      'requestOrganization' => ['Identifier', 'Reference']
    }
    SEARCH_PARAMS = ["created", "disposition", "identifier", "organizationidentifier", "organizationreference", "outcome", "requestidentifier", "requestorganizationidentifier", "requestorganizationreference", "requestprovideridentifier", "requestproviderreference", "requestreference"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'EligibilityResponse.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'EligibilityResponse.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'EligibilityResponse.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'EligibilityResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'EligibilityResponse.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'EligibilityResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'EligibilityResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'EligibilityResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'EligibilityResponse.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'requestIdentifier' => {'type'=>'Identifier', 'path'=>'EligibilityResponse.request[x]', 'min'=>0, 'max'=>1},
      'requestReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/EligibilityRequest'], 'type'=>'Reference', 'path'=>'EligibilityResponse.request[x]', 'min'=>0, 'max'=>1},
      'outcome' => {'valid_codes'=>{'http://hl7.org/fhir/remittance-outcome'=>['complete', 'error']}, 'type'=>'code', 'path'=>'EligibilityResponse.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/remittance-outcome'}},
      'disposition' => {'type'=>'string', 'path'=>'EligibilityResponse.disposition', 'min'=>0, 'max'=>1},
      'ruleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'EligibilityResponse.ruleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'originalRuleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'EligibilityResponse.originalRuleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'created' => {'type'=>'dateTime', 'path'=>'EligibilityResponse.created', 'min'=>0, 'max'=>1},
      'organizationIdentifier' => {'type'=>'Identifier', 'path'=>'EligibilityResponse.organization[x]', 'min'=>0, 'max'=>1},
      'organizationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'EligibilityResponse.organization[x]', 'min'=>0, 'max'=>1},
      'requestProviderIdentifier' => {'type'=>'Identifier', 'path'=>'EligibilityResponse.requestProvider[x]', 'min'=>0, 'max'=>1},
      'requestProviderReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'EligibilityResponse.requestProvider[x]', 'min'=>0, 'max'=>1},
      'requestOrganizationIdentifier' => {'type'=>'Identifier', 'path'=>'EligibilityResponse.requestOrganization[x]', 'min'=>0, 'max'=>1},
      'requestOrganizationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'EligibilityResponse.requestOrganization[x]', 'min'=>0, 'max'=>1},
      'inforce' => {'type'=>'boolean', 'path'=>'EligibilityResponse.inforce', 'min'=>0, 'max'=>1},
      'contract' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Contract'], 'type'=>'Reference', 'path'=>'EligibilityResponse.contract', 'min'=>0, 'max'=>1},
      'form' => {'valid_codes'=>{'http://hl7.org/fhir/forms-codes'=>['1', '2']}, 'type'=>'Coding', 'path'=>'EligibilityResponse.form', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/forms'}},
      'benefitBalance' => {'type'=>'EligibilityResponse::Benefitbalance', 'path'=>'EligibilityResponse.benefitBalance', 'min'=>0, 'max'=>Float::INFINITY},
      'error' => {'type'=>'EligibilityResponse::Error', 'path'=>'EligibilityResponse.error', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Benefitbalance < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Benefitbalance.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Benefitbalance.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Benefitbalance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'category' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-category'=>['oral', 'vision', 'medical', 'pharmacy']}, 'type'=>'Coding', 'path'=>'Benefitbalance.category', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-category'}},
        'subCategory' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-subcategory'=>['oral-basic', 'oral-major', 'oral-ortho', 'vision-exam', 'vision-glasses', 'vision-contacts', 'medical-primarycare', 'pharmacy-dispense']}, 'type'=>'Coding', 'path'=>'Benefitbalance.subCategory', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-subcategory'}},
        'network' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-network'=>['in', 'out']}, 'type'=>'Coding', 'path'=>'Benefitbalance.network', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-network'}},
        'unit' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-unit'=>['individual', 'family']}, 'type'=>'Coding', 'path'=>'Benefitbalance.unit', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-unit'}},
        'term' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-term'=>['annual', 'lifetime']}, 'type'=>'Coding', 'path'=>'Benefitbalance.term', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-term'}},
        'financial' => {'type'=>'EligibilityResponse::Benefitbalance::Financial', 'path'=>'Benefitbalance.financial', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Financial < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'benefit' => ['unsignedInt', 'Quantity'],
          'benefitUsed' => ['unsignedInt', 'Quantity']
        }
        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Financial.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Financial.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Financial.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-type'=>['deductable', 'visit', 'copay', 'vision-exam', 'vision-glasses', 'vision-contacts', 'medical-primarycare', 'pharmacy-dispense']}, 'type'=>'Coding', 'path'=>'Financial.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-type'}},
          'benefitUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Financial.benefit[x]', 'min'=>0, 'max'=>1},
          'benefitQuantity' => {'type'=>'Quantity', 'path'=>'Financial.benefit[x]', 'min'=>0, 'max'=>1},
          'benefitUsedUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Financial.benefitUsed[x]', 'min'=>0, 'max'=>1},
          'benefitUsedQuantity' => {'type'=>'Quantity', 'path'=>'Financial.benefitUsed[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                     # 0-1 id
        attr_accessor :extension              # 0-* [ Extension ]
        attr_accessor :modifierExtension      # 0-* [ Extension ]
        attr_accessor :type                   # 1-1 Coding
        attr_accessor :benefitUnsignedInt     # 0-1 unsignedInt
        attr_accessor :benefitQuantity        # 0-1 Quantity
        attr_accessor :benefitUsedUnsignedInt # 0-1 unsignedInt
        attr_accessor :benefitUsedQuantity    # 0-1 Quantity
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :category          # 1-1 Coding
      attr_accessor :subCategory       # 0-1 Coding
      attr_accessor :network           # 0-1 Coding
      attr_accessor :unit              # 0-1 Coding
      attr_accessor :term              # 0-1 Coding
      attr_accessor :financial         # 0-* [ EligibilityResponse::Benefitbalance::Financial ]
    end

    class Error < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Error.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Error.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Error.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'valid_codes'=>{'http://hl7.org/fhir/adjudication-error'=>['a001', 'a002']}, 'type'=>'Coding', 'path'=>'Error.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/adjudication-error'}}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 1-1 Coding
    end

    attr_accessor :id                            # 0-1 id
    attr_accessor :meta                          # 0-1 Meta
    attr_accessor :implicitRules                 # 0-1 uri
    attr_accessor :language                      # 0-1 code
    attr_accessor :text                          # 0-1 Narrative
    attr_accessor :contained                     # 0-* [ Resource ]
    attr_accessor :extension                     # 0-* [ Extension ]
    attr_accessor :modifierExtension             # 0-* [ Extension ]
    attr_accessor :identifier                    # 0-* [ Identifier ]
    attr_accessor :requestIdentifier             # 0-1 Identifier
    attr_accessor :requestReference              # 0-1 Reference(EligibilityRequest)
    attr_accessor :outcome                       # 0-1 code
    attr_accessor :disposition                   # 0-1 string
    attr_accessor :ruleset                       # 0-1 Coding
    attr_accessor :originalRuleset               # 0-1 Coding
    attr_accessor :created                       # 0-1 dateTime
    attr_accessor :organizationIdentifier        # 0-1 Identifier
    attr_accessor :organizationReference         # 0-1 Reference(Organization)
    attr_accessor :requestProviderIdentifier     # 0-1 Identifier
    attr_accessor :requestProviderReference      # 0-1 Reference(Practitioner)
    attr_accessor :requestOrganizationIdentifier # 0-1 Identifier
    attr_accessor :requestOrganizationReference  # 0-1 Reference(Organization)
    attr_accessor :inforce                       # 0-1 boolean
    attr_accessor :contract                      # 0-1 Reference(Contract)
    attr_accessor :form                          # 0-1 Coding
    attr_accessor :benefitBalance                # 0-* [ EligibilityResponse::Benefitbalance ]
    attr_accessor :error                         # 0-* [ EligibilityResponse::Error ]

    def resourceType
      'EligibilityResponse'
    end
  end
end