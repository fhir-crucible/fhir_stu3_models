module FHIR
  class AuditEvent < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["action", "address", "agent", "agent-name", "altid", "date", "entity", "entity-id", "entity-name", "entity-type", "patient", "policy", "site", "source", "subtype", "type", "user"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'AuditEvent.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'AuditEvent.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'AuditEvent.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'AuditEvent.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'AuditEvent.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'AuditEvent.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'AuditEvent.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'AuditEvent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'valid_codes'=>{'http://nema.org/dicom/dicm'=>['110100', '110101', '110102', '110103', '110104', '110105', '110106', '110107', '110108', '110109', '110110', '110111', '110112', '110113', '110114'], 'http://hl7.org/fhir/audit-event-type'=>['rest']}, 'type'=>'Coding', 'path'=>'AuditEvent.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/audit-event-type'}},
      'subtype' => {'valid_codes'=>{'http://nema.org/dicom/dicm'=>['110120', '110121', '110122', '110123', '110124', '110125', '110126', '110127', '110128', '110129', '110130', '110131', '110132', '110133', '110134', '110135', '110136', '110137', '110138', '110139', '110140', '110141', '110142'], 'http://hl7.org/fhir/restful-interaction'=>['read', 'vread', 'update', 'delete', 'history', 'history-instance', 'history-type', 'history-system', 'create', 'search', 'search-type', 'search-system', 'conformance', 'transaction', 'batch', 'operation']}, 'type'=>'Coding', 'path'=>'AuditEvent.subtype', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/audit-event-sub-type'}},
      'action' => {'valid_codes'=>{'http://hl7.org/fhir/audit-event-action'=>['C', 'R', 'U', 'D', 'E']}, 'type'=>'code', 'path'=>'AuditEvent.action', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/audit-event-action'}},
      'recorded' => {'type'=>'instant', 'path'=>'AuditEvent.recorded', 'min'=>1, 'max'=>1},
      'outcome' => {'valid_codes'=>{'http://hl7.org/fhir/audit-event-outcome'=>['0', '4', '8', '12']}, 'type'=>'code', 'path'=>'AuditEvent.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/audit-event-outcome'}},
      'outcomeDesc' => {'type'=>'string', 'path'=>'AuditEvent.outcomeDesc', 'min'=>0, 'max'=>1},
      'purposeOfEvent' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH']}, 'type'=>'Coding', 'path'=>'AuditEvent.purposeOfEvent', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-PurposeOfUse'}},
      'agent' => {'type'=>'AuditEvent::Agent', 'path'=>'AuditEvent.agent', 'min'=>1, 'max'=>Float::INFINITY},
      'source' => {'type'=>'AuditEvent::Source', 'path'=>'AuditEvent.source', 'min'=>1, 'max'=>1},
      'entity' => {'type'=>'AuditEvent::Entity', 'path'=>'AuditEvent.entity', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Agent < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Agent.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Agent.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Agent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'role' => {'valid_codes'=>{'http://nema.org/dicom/dicm'=>['110150', '110151', '110152', '110153', '110154', '110155']}, 'type'=>'CodeableConcept', 'path'=>'Agent.role', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/dicm-402-roleid'}},
        'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Agent.reference', 'min'=>0, 'max'=>1},
        'userId' => {'type'=>'Identifier', 'path'=>'Agent.userId', 'min'=>0, 'max'=>1},
        'altId' => {'type'=>'string', 'path'=>'Agent.altId', 'min'=>0, 'max'=>1},
        'name' => {'type'=>'string', 'path'=>'Agent.name', 'min'=>0, 'max'=>1},
        'requestor' => {'type'=>'boolean', 'path'=>'Agent.requestor', 'min'=>1, 'max'=>1},
        'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Agent.location', 'min'=>0, 'max'=>1},
        'policy' => {'type'=>'uri', 'path'=>'Agent.policy', 'min'=>0, 'max'=>Float::INFINITY},
        'media' => {'valid_codes'=>{'http://nema.org/dicom/dicm'=>['110030', '110031', '110032', '110033', '110034', '110035', '110036', '110037', '110010', '110038']}, 'type'=>'Coding', 'path'=>'Agent.media', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/dicm-405-mediatype'}},
        'network' => {'type'=>'AuditEvent::Agent::Network', 'path'=>'Agent.network', 'min'=>0, 'max'=>1},
        'purposeOfUse' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH']}, 'type'=>'Coding', 'path'=>'Agent.purposeOfUse', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-PurposeOfUse'}}
      }

      class Network < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Network.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Network.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Network.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'address' => {'type'=>'string', 'path'=>'Network.address', 'min'=>0, 'max'=>1},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/network-type'=>['1', '2', '3', '4', '5']}, 'type'=>'code', 'path'=>'Network.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/network-type'}}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :address           # 0-1 string
        attr_accessor :type              # 0-1 code
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :role              # 0-* [ CodeableConcept ]
      attr_accessor :reference         # 0-1 Reference(Practitioner|Organization|Device|Patient|RelatedPerson)
      attr_accessor :userId            # 0-1 Identifier
      attr_accessor :altId             # 0-1 string
      attr_accessor :name              # 0-1 string
      attr_accessor :requestor         # 1-1 boolean
      attr_accessor :location          # 0-1 Reference(Location)
      attr_accessor :policy            # 0-* [ uri ]
      attr_accessor :media             # 0-1 Coding
      attr_accessor :network           # 0-1 AuditEvent::Agent::Network
      attr_accessor :purposeOfUse      # 0-* [ Coding ]
    end

    class Source < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Source.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Source.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Source.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'site' => {'type'=>'string', 'path'=>'Source.site', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'Source.identifier', 'min'=>1, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/security-source-type'=>['1', '2', '3', '4', '5', '6', '7', '8', '9']}, 'type'=>'Coding', 'path'=>'Source.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/audit-source-type'}}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :site              # 0-1 string
      attr_accessor :identifier        # 1-1 Identifier
      attr_accessor :type              # 0-* [ Coding ]
    end

    class Entity < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Entity.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Entity.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Entity.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Entity.identifier', 'min'=>0, 'max'=>1},
        'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Entity.reference', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/object-type'=>['1', '2', '3', '4']}, 'type'=>'Coding', 'path'=>'Entity.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/object-type'}},
        'role' => {'valid_codes'=>{'http://hl7.org/fhir/object-role'=>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24']}, 'type'=>'Coding', 'path'=>'Entity.role', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/object-role'}},
        'lifecycle' => {'valid_codes'=>{'http://hl7.org/fhir/object-lifecycle'=>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15']}, 'type'=>'Coding', 'path'=>'Entity.lifecycle', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/object-lifecycle'}},
        'securityLabel' => {'valid_codes'=>{'http://hl7.org/fhir/v3/Confidentiality'=>['_Confidentiality', 'L', 'M', 'N', 'R', 'U', 'V', 'B', 'D', 'I', 'ETH', 'HIV', 'PSY', 'SDV', 'C', 'S', 'T'], 'http://hl7.org/fhir/v3/ActCode'=>['_InformationSensitivityPolicy', '_ActInformationSensitivityPolicy', 'ETH', 'GDIS', 'HIV', 'PSY', 'SCA', 'SDV', 'SEX', 'STD', 'TBOO', 'SICKLE', '_EntitySensitivityPolicyType', 'DEMO', 'DOB', 'GENDER', 'LIVARG', 'MARST', 'RACE', 'REL', '_RoleInformationSensitivityPolicy', 'B', 'EMPL', 'LOCIS', 'SSP', 'ADOL', 'CEL', 'DIA', 'DRGIS', 'EMP', 'PDS', 'PRS', 'COMPT', 'HRCOMPT', 'RESCOMPT', 'RMGTCOMPT', 'SecurityPolicy', 'ObligationPolicy', 'ANONY', 'AOD', 'AUDIT', 'AUDTR', 'CPLYCC', 'CPLYCD', 'CPLYJPP', 'CPLYOPP', 'CPLYOSP', 'CPLYPOL', 'DEID', 'DELAU', 'ENCRYPT', 'ENCRYPTR', 'ENCRYPTT', 'ENCRYPTU', 'HUAPRV', 'MASK', 'MINEC', 'PRIVMARK', 'PSEUD', 'REDACT', 'RefrainPolicy', 'NOAUTH', 'NOCOLLECT', 'NODSCLCD', 'NODSCLCDS', 'NOINTEGRATE', 'NOLIST', 'NOMOU', 'NOORGPOL', 'NOPAT', 'NOPERSISTP', 'NORDSCLCD', 'NORDSCLCDS', 'NORDSCLW', 'NORELINK', 'NOREUSE', 'NOVIP', 'ORCON'], 'http://hl7.org/fhir/v3/ObservationValue'=>['_SECALTINTOBV', 'ABSTRED', 'AGGRED', 'ANONYED', 'MAPPED', 'MASKED', 'PSEUDED', 'REDACTED', 'SUBSETTED', 'SYNTAC', 'TRSLT', 'VERSIONED', '_SECDATINTOBV', 'CRYTOHASH', 'DIGSIG', '_SECINTCONOBV', 'HRELIABLE', 'RELIABLE', 'UNCERTREL', 'UNRELIABLE', '_SECINTPRVOBV', '_SECINTPRVABOBV', 'CLINAST', 'DEVAST', 'HCPAST', 'PACQAST', 'PATAST', 'PAYAST', 'PROAST', 'SDMAST', '_SECINTPRVRBOBV', 'CLINRPT', 'DEVRPT', 'HCPRPT', 'PACQRPT', 'PATRPT', 'PAYRPT', 'PRORPT', 'SDMRPT'], 'http://hl7.org/fhir/v3/ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH'], 'http://hl7.org/fhir/v3/ActUSPrivacyLaw'=>['_ActUSPrivacyLaw', '42CFRPart2', 'CommonRule', 'HIPAANOPP', 'HIPAAPsyNotes', 'HIPAASelfPay', 'Title38Section7332']}, 'type'=>'Coding', 'path'=>'Entity.securityLabel', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/security-labels'}},
        'name' => {'type'=>'string', 'path'=>'Entity.name', 'min'=>0, 'max'=>1},
        'description' => {'type'=>'string', 'path'=>'Entity.description', 'min'=>0, 'max'=>1},
        'query' => {'type'=>'base64Binary', 'path'=>'Entity.query', 'min'=>0, 'max'=>1},
        'detail' => {'type'=>'AuditEvent::Entity::Detail', 'path'=>'Entity.detail', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Detail < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'type'=>'string', 'path'=>'Detail.type', 'min'=>1, 'max'=>1},
          'value' => {'type'=>'base64Binary', 'path'=>'Detail.value', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 string
        attr_accessor :value             # 1-1 base64Binary
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 0-1 Identifier
      attr_accessor :reference         # 0-1 Reference(Resource)
      attr_accessor :type              # 0-1 Coding
      attr_accessor :role              # 0-1 Coding
      attr_accessor :lifecycle         # 0-1 Coding
      attr_accessor :securityLabel     # 0-* [ Coding ]
      attr_accessor :name              # 0-1 string
      attr_accessor :description       # 0-1 string
      attr_accessor :query             # 0-1 base64Binary
      attr_accessor :detail            # 0-* [ AuditEvent::Entity::Detail ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :type              # 1-1 Coding
    attr_accessor :subtype           # 0-* [ Coding ]
    attr_accessor :action            # 0-1 code
    attr_accessor :recorded          # 1-1 instant
    attr_accessor :outcome           # 0-1 code
    attr_accessor :outcomeDesc       # 0-1 string
    attr_accessor :purposeOfEvent    # 0-* [ Coding ]
    attr_accessor :agent             # 1-* [ AuditEvent::Agent ]
    attr_accessor :source            # 1-1 AuditEvent::Source
    attr_accessor :entity            # 0-* [ AuditEvent::Entity ]

    def resourceType
      'AuditEvent'
    end
  end
end