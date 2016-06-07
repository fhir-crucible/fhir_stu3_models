module FHIR
  class Coverage < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'issuer' => ['Identifier', 'Reference'],
      'planholder' => ['Identifier', 'Reference'],
      'beneficiary' => ['Identifier', 'Reference']
    }
    SEARCH_PARAMS = ["beneficiaryidentifier", "beneficiaryreference", "dependent", "group", "identifier", "issueridentifier", "issuerreference", "plan", "planholderidentifier", "planholderreference", "sequence", "subplan", "type"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Coverage.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Coverage.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Coverage.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Coverage.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'Coverage.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Coverage.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Coverage.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Coverage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'issuerIdentifier' => {'type'=>'Identifier', 'path'=>'Coverage.issuer[x]', 'min'=>1, 'max'=>1},
      'issuerReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Coverage.issuer[x]', 'min'=>1, 'max'=>1},
      'bin' => {'type'=>'string', 'path'=>'Coverage.bin', 'min'=>0, 'max'=>1},
      'period' => {'type'=>'Period', 'path'=>'Coverage.period', 'min'=>0, 'max'=>1},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActCode'=>['_ActCoverageTypeCode', '_ActInsurancePolicyCode', 'EHCPOL', 'HSAPOL', 'AUTOPOL', 'COL', 'UNINSMOT', 'PUBLICPOL', 'DENTPRG', 'DISEASEPRG', 'CANPRG', 'ENDRENAL', 'HIVAIDS', 'MANDPOL', 'MENTPRG', 'SAFNET', 'SUBPRG', 'SUBSIDIZ', 'SUBSIDMC', 'SUBSUPP', 'WCBPOL', '_ActInsuranceTypeCode', '_ActHealthInsuranceTypeCode', 'DENTAL', 'DISEASE', 'DRUGPOL', 'HIP', 'LTC', 'MCPOL', 'POS', 'HMO', 'PPO', 'MENTPOL', 'SUBPOL', 'VISPOL', 'DIS', 'EWB', 'FLEXP', 'LIFE', 'ANNU', 'TLIFE', 'ULIFE', 'PNC', 'REI', 'SURPL', 'UMBRL', '_ActProgramTypeCode', 'CHAR', 'CRIME', 'EAP', 'GOVEMP', 'HIRISK', 'IND', 'MILITARY', 'RETIRE', 'SOCIAL', 'VET']}, 'type'=>'Coding', 'path'=>'Coverage.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ActCoverageTypeCode'}},
      'planholderIdentifier' => {'type'=>'Identifier', 'path'=>'Coverage.planholder[x]', 'min'=>1, 'max'=>1},
      'planholderReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Coverage.planholder[x]', 'min'=>1, 'max'=>1},
      'beneficiaryIdentifier' => {'type'=>'Identifier', 'path'=>'Coverage.beneficiary[x]', 'min'=>1, 'max'=>1},
      'beneficiaryReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Coverage.beneficiary[x]', 'min'=>1, 'max'=>1},
      'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/relationship'=>['1', '2', '3', '4', '5']}, 'type'=>'Coding', 'path'=>'Coverage.relationship', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/relationship'}},
      'identifier' => {'type'=>'Identifier', 'path'=>'Coverage.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'group' => {'type'=>'string', 'path'=>'Coverage.group', 'min'=>0, 'max'=>1},
      'plan' => {'type'=>'string', 'path'=>'Coverage.plan', 'min'=>0, 'max'=>1},
      'subPlan' => {'type'=>'string', 'path'=>'Coverage.subPlan', 'min'=>0, 'max'=>1},
      'dependent' => {'type'=>'positiveInt', 'path'=>'Coverage.dependent', 'min'=>0, 'max'=>1},
      'sequence' => {'type'=>'positiveInt', 'path'=>'Coverage.sequence', 'min'=>0, 'max'=>1},
      'exception' => {'valid_codes'=>{'http://hl7.org/fhir/coverage-exception'=>['student', 'disabled']}, 'type'=>'Coding', 'path'=>'Coverage.exception', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/coverage-exception'}},
      'school' => {'type'=>'string', 'path'=>'Coverage.school', 'min'=>0, 'max'=>1},
      'network' => {'type'=>'string', 'path'=>'Coverage.network', 'min'=>0, 'max'=>1},
      'contract' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Contract'], 'type'=>'Reference', 'path'=>'Coverage.contract', 'min'=>0, 'max'=>Float::INFINITY}
    }

    attr_accessor :id                    # 0-1 id
    attr_accessor :meta                  # 0-1 Meta
    attr_accessor :implicitRules         # 0-1 uri
    attr_accessor :language              # 0-1 code
    attr_accessor :text                  # 0-1 Narrative
    attr_accessor :contained             # 0-* [ Resource ]
    attr_accessor :extension             # 0-* [ Extension ]
    attr_accessor :modifierExtension     # 0-* [ Extension ]
    attr_accessor :issuerIdentifier      # 1-1 Identifier
    attr_accessor :issuerReference       # 1-1 Reference(Organization)
    attr_accessor :bin                   # 0-1 string
    attr_accessor :period                # 0-1 Period
    attr_accessor :type                  # 0-1 Coding
    attr_accessor :planholderIdentifier  # 1-1 Identifier
    attr_accessor :planholderReference   # 1-1 Reference(Patient|Organization)
    attr_accessor :beneficiaryIdentifier # 1-1 Identifier
    attr_accessor :beneficiaryReference  # 1-1 Reference(Patient)
    attr_accessor :relationship          # 1-1 Coding
    attr_accessor :identifier            # 0-* [ Identifier ]
    attr_accessor :group                 # 0-1 string
    attr_accessor :plan                  # 0-1 string
    attr_accessor :subPlan               # 0-1 string
    attr_accessor :dependent             # 0-1 positiveInt
    attr_accessor :sequence              # 0-1 positiveInt
    attr_accessor :exception             # 0-* [ Coding ]
    attr_accessor :school                # 0-1 string
    attr_accessor :network               # 0-1 string
    attr_accessor :contract              # 0-* [ Reference(Contract) ]

    def resourceType
      'Coverage'
    end
  end
end