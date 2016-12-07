module FHIR
  class Provenance < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = []
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Provenance.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Provenance.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Provenance.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Provenance.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Provenance.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Provenance.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Provenance.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Provenance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'target' => {'type'=>'Reference', 'path'=>'Provenance.target', 'min'=>1, 'max'=>Float::INFINITY},
      'period' => {'type'=>'Period', 'path'=>'Provenance.period', 'min'=>0, 'max'=>1},
      'recorded' => {'type'=>'instant', 'path'=>'Provenance.recorded', 'min'=>1, 'max'=>1},
      'reason' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH']}, 'type'=>'Coding', 'path'=>'Provenance.reason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-PurposeOfUse'}},
      'activity' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActStatus'=>['aborted', 'cancelled', 'completed', 'new', 'nullified', 'obsolete'], 'http://hl7.org/fhir/v3/DocumentCompletion'=>['AU', 'DI', 'DO', 'LA', 'UC'], nil=>[]}, 'type'=>'Coding', 'path'=>'Provenance.activity', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ProvenanceEventCurrentState'}},
      'location' => {'type'=>'Reference', 'path'=>'Provenance.location', 'min'=>0, 'max'=>1},
      'policy' => {'type'=>'uri', 'path'=>'Provenance.policy', 'min'=>0, 'max'=>Float::INFINITY},
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
        'role' => {'valid_codes'=>{'http://hl7.org/fhir/provenance-participant-role'=>['enterer', 'performer', 'author', 'verifier', 'legal', 'attester', 'informant', 'custodian', 'assembler', 'composer', 'enterer', 'performer', 'author', 'verifier', 'attester', 'informant', 'custodian', 'assembler', 'composer']}, 'type'=>'Coding', 'path'=>'Agent.role', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/provenance-agent-role'}},
        'whoUri' => {'type'=>'uri', 'path'=>'Agent.who[x]', 'min'=>1, 'max'=>1},
        'whoReference' => {'type'=>'Reference', 'path'=>'Agent.who[x]', 'min'=>1, 'max'=>1},
        'onBehalfOfUri' => {'type'=>'uri', 'path'=>'Agent.onBehalfOf[x]', 'min'=>0, 'max'=>1},
        'onBehalfOfReference' => {'type'=>'Reference', 'path'=>'Agent.onBehalfOf[x]', 'min'=>0, 'max'=>1},
        'relatedAgentType' => {'valid_codes'=>{'http://hl7.org/fhir/v3/RoleLinkType'=>['REL', 'BACKUP', 'CONT', 'DIRAUTH', 'IDENT', 'INDAUTH', 'PART', 'REPL']}, 'type'=>'CodeableConcept', 'path'=>'Agent.relatedAgentType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-RoleLinkType'}}
      }

      attr_accessor :id                  # 0-1 string
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :role                # 1-1 Coding
      attr_accessor :whoUri              # 1-1 uri
      attr_accessor :whoReference        # 1-1 Reference()
      attr_accessor :onBehalfOfUri       # 0-1 uri
      attr_accessor :onBehalfOfReference # 0-1 Reference()
      attr_accessor :relatedAgentType    # 0-1 CodeableConcept
    end

    class Entity < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Entity.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Entity.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Entity.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'role' => {'valid_codes'=>{'http://hl7.org/fhir/provenance-entity-role'=>['derivation', 'revision', 'quotation', 'source', 'removal', 'derivation']}, 'type'=>'code', 'path'=>'Entity.role', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/provenance-entity-role'}},
        'reference' => {'type'=>'Reference', 'path'=>'Entity.reference', 'min'=>1, 'max'=>1},
        'agent' => {'type'=>'Provenance::Agent', 'path'=>'Entity.agent', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :role              # 1-1 code
      attr_accessor :reference         # 1-1 Reference()
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
    attr_accessor :target            # 1-* [ Reference() ]
    attr_accessor :period            # 0-1 Period
    attr_accessor :recorded          # 1-1 instant
    attr_accessor :reason            # 0-* [ Coding ]
    attr_accessor :activity          # 0-1 Coding
    attr_accessor :location          # 0-1 Reference()
    attr_accessor :policy            # 0-* [ uri ]
    attr_accessor :agent             # 1-* [ Provenance::Agent ]
    attr_accessor :entity            # 0-* [ Provenance::Entity ]
    attr_accessor :signature         # 0-* [ Signature ]

    def resourceType
      'Provenance'
    end
  end
end