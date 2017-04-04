module FHIR
  class Provenance < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['agent', 'agent-role', 'end', 'entity-id', 'entity-ref', 'location', 'patient', 'recorded', 'signature-type', 'start', 'target']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Provenance.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Provenance.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Provenance.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Provenance.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Provenance.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Provenance.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Provenance.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Provenance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'target' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Provenance.target', 'min'=>1, 'max'=>Float::INFINITY},
      'period' => {'type'=>'Period', 'path'=>'Provenance.period', 'min'=>0, 'max'=>1},
      'recorded' => {'type'=>'instant', 'path'=>'Provenance.recorded', 'min'=>1, 'max'=>1},
      'policy' => {'type'=>'uri', 'path'=>'Provenance.policy', 'min'=>0, 'max'=>Float::INFINITY},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Provenance.location', 'min'=>0, 'max'=>1},
      'reason' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH']}, 'type'=>'Coding', 'path'=>'Provenance.reason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-PurposeOfUse'}},
      'activity' => {'valid_codes'=>{'http://hl7.org/fhir/v3/DocumentCompletion'=>['AU', 'DI', 'DO', 'IN', 'IP', 'LA', 'NU', 'PA', 'UC'], 'http://hl7.org/fhir/v3/ActStatus'=>['normal', 'aborted', 'active', 'cancelled', 'completed', 'held', 'new', 'suspended', 'nullified', 'obsolete'], 'http://hl7.org/fhir/v3/DataOperation'=>['OPERATE', 'CREATE', 'DELETE', 'EXECUTE', 'READ', 'UPDATE', 'APPEND', 'MODIFYSTATUS', 'ABORT', 'ACTIVATE', 'CANCEL', 'COMPLETE', 'HOLD', 'JUMP', 'NULLIFY', 'OBSOLETE', 'REACTIVATE', 'RELEASE', 'RESUME', 'SUSPEND'], 'http://hl7.org/fhir/v3/ActCode'=>['ObligationPolicy', 'ANONY', 'AOD', 'AUDIT', 'AUDTR', 'CPLYCC', 'CPLYCD', 'CPLYJPP', 'CPLYOPP', 'CPLYOSP', 'CPLYPOL', 'DECLASSIFYLABEL', 'DEID', 'DELAU', 'DOWNGRDLABEL', 'DRIVLABEL', 'ENCRYPT', 'ENCRYPTR', 'ENCRYPTT', 'ENCRYPTU', 'HUAPRV', 'LABEL', 'MASK', 'MINEC', 'PERSISTLABEL', 'PRIVMARK', 'PSEUD', 'REDACT', 'UPGRDLABEL'], 'http://hl7.org/fhir/w3c-provenance-activity-type'=>['Generation', 'Usage', 'Communication', 'Start', 'End', 'Invalidation', 'Derivation', 'Revision', 'Quotation', 'Primary-Source', 'Attribution', 'Collection', 'Generation', 'Usage', 'Communication', 'Start', 'End', 'Invalidation', 'Derivation', 'Revision', 'Quotation', 'Primary-Source', 'Attribution', 'Collection'], 'http://hl7.org/fhir/extra-activity-type'=>['aggregate', 'compose', 'label', 'aggregate', 'compose', 'label'], nil=>[]}, 'type'=>'Coding', 'path'=>'Provenance.activity', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/provenance-activity-type'}},
      'agent' => {'type'=>'Provenance::Agent', 'path'=>'Provenance.agent', 'min'=>1, 'max'=>Float::INFINITY},
      'entity' => {'type'=>'Provenance::Entity', 'path'=>'Provenance.entity', 'min'=>0, 'max'=>Float::INFINITY},
      'signature' => {'type'=>'Signature', 'path'=>'Provenance.signature', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Agent < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'who' => ['uri', 'Reference'],
        'onBehalfOf' => ['uri', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Agent.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Agent.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Agent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'role' => {'type'=>'CodeableConcept', 'path'=>'Agent.role', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/security-role-type'}},
        'whoUri' => {'type'=>'uri', 'path'=>'Agent.who[x]', 'min'=>1, 'max'=>1},
        'whoReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Agent.who[x]', 'min'=>1, 'max'=>1},
        'onBehalfOfUri' => {'type'=>'uri', 'path'=>'Agent.onBehalfOf[x]', 'min'=>0, 'max'=>1},
        'onBehalfOfReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Agent.onBehalfOf[x]', 'min'=>0, 'max'=>1},
        'relatedAgentType' => {'valid_codes'=>{'http://hl7.org/fhir/v3/RoleLinkType'=>['REL', 'BACKUP', 'CONT', 'DIRAUTH', 'IDENT', 'INDAUTH', 'PART', 'REPL']}, 'type'=>'CodeableConcept', 'path'=>'Agent.relatedAgentType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-RoleLinkType'}}
      }

      attr_accessor :id                  # 0-1 string
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :role                # 0-* [ CodeableConcept ]
      attr_accessor :whoUri              # 1-1 uri
      attr_accessor :whoReference        # 1-1 Reference(Practitioner|RelatedPerson|Patient|Device|Organization)
      attr_accessor :onBehalfOfUri       # 0-1 uri
      attr_accessor :onBehalfOfReference # 0-1 Reference(Practitioner|RelatedPerson|Patient|Device|Organization)
      attr_accessor :relatedAgentType    # 0-1 CodeableConcept
    end

    class Entity < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'what' => ['uri', 'Reference', 'Identifier']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Entity.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Entity.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Entity.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'role' => {'valid_codes'=>{'http://hl7.org/fhir/provenance-entity-role'=>['derivation', 'revision', 'quotation', 'source', 'removal', 'derivation']}, 'type'=>'code', 'path'=>'Entity.role', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/provenance-entity-role'}},
        'whatUri' => {'type'=>'uri', 'path'=>'Entity.what[x]', 'min'=>1, 'max'=>1},
        'whatReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Entity.what[x]', 'min'=>1, 'max'=>1},
        'whatIdentifier' => {'type'=>'Identifier', 'path'=>'Entity.what[x]', 'min'=>1, 'max'=>1},
        'agent' => {'type'=>'Provenance::Agent', 'path'=>'Entity.agent', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :role              # 1-1 code
      attr_accessor :whatUri           # 1-1 uri
      attr_accessor :whatReference     # 1-1 Reference(Resource)
      attr_accessor :whatIdentifier    # 1-1 Identifier
      attr_accessor :agent             # 0-* [ Provenance::Agent ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :target            # 1-* [ Reference(Resource) ]
    attr_accessor :period            # 0-1 Period
    attr_accessor :recorded          # 1-1 instant
    attr_accessor :policy            # 0-* [ uri ]
    attr_accessor :location          # 0-1 Reference(Location)
    attr_accessor :reason            # 0-* [ Coding ]
    attr_accessor :activity          # 0-1 Coding
    attr_accessor :agent             # 1-* [ Provenance::Agent ]
    attr_accessor :entity            # 0-* [ Provenance::Entity ]
    attr_accessor :signature         # 0-* [ Signature ]

    def resourceType
      'Provenance'
    end
  end
end