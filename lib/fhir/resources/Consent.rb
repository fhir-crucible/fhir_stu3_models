module FHIR
  class Consent < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'source' => ['Attachment', 'Identifier', 'Reference']
    }
    SEARCH_PARAMS = ["action", "actor", "category", "consentor", "data", "date", "identifier", "organization", "patient", "period", "purpose", "recipient", "security", "source", "status"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Consent.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Consent.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Consent.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Consent.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Consent.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Consent.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Consent.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Consent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Consent.identifier', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/consent-status'=>['draft', 'proposed', 'active', 'rejected', 'inactive', 'entered-in-error', 'draft', 'proposed', 'active', 'rejected', 'inactive', 'entered-in-error']}, 'type'=>'code', 'path'=>'Consent.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-status'}},
      'category' => {'valid_codes'=>{'http://hl7.org/fhir/consentcategorycodes'=>['cat1', 'advance-directive', 'cat2', 'medical-consent', 'cat3', 'hipaa', 'SSA-827', 'cat4', 'DCH-3927', 'squaxin', 'cat5', 'nl-lsp', 'at-elga', 'cat6', 'nih-hipaa', 'nci', 'nih-grdr', 'va-10-10116', 'nih-527', 'ga4gh', 'cat1', 'cat2', 'cat3', 'cat4', 'cat5', 'cat6']}, 'type'=>'CodeableConcept', 'path'=>'Consent.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-category'}},
      'dateTime' => {'type'=>'dateTime', 'path'=>'Consent.dateTime', 'min'=>0, 'max'=>1},
      'period' => {'type'=>'Period', 'path'=>'Consent.period', 'min'=>0, 'max'=>1},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Consent.patient', 'min'=>1, 'max'=>1},
      'consentor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Consent.consentor', 'min'=>0, 'max'=>Float::INFINITY},
      'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Consent.organization', 'min'=>0, 'max'=>1},
      'sourceAttachment' => {'type'=>'Attachment', 'path'=>'Consent.source[x]', 'min'=>0, 'max'=>1},
      'sourceIdentifier' => {'type'=>'Identifier', 'path'=>'Consent.source[x]', 'min'=>0, 'max'=>1},
      'sourceReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Consent', 'http://hl7.org/fhir/StructureDefinition/DocumentReference', 'http://hl7.org/fhir/StructureDefinition/Contract', 'http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse'], 'type'=>'Reference', 'path'=>'Consent.source[x]', 'min'=>0, 'max'=>1},
      'policy' => {'type'=>'uri', 'path'=>'Consent.policy', 'min'=>1, 'max'=>1},
      'recipient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'Consent.recipient', 'min'=>0, 'max'=>Float::INFINITY},
      'purpose' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH']}, 'type'=>'Coding', 'path'=>'Consent.purpose', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-PurposeOfUse'}},
      'except' => {'type'=>'Consent::Except', 'path'=>'Consent.except', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Except < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Except.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Except.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Except.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/consent-except-type'=>['deny', 'permit', 'deny', 'permit']}, 'type'=>'code', 'path'=>'Except.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-except-type'}},
        'period' => {'type'=>'Period', 'path'=>'Except.period', 'min'=>0, 'max'=>1},
        'actor' => {'type'=>'Consent::Except::Actor', 'path'=>'Except.actor', 'min'=>0, 'max'=>Float::INFINITY},
        'action' => {'valid_codes'=>{'http://hl7.org/fhir/consentaction'=>['collect', 'access', 'use', 'disclose', 'correct', 'collect', 'access', 'use', 'disclose', 'correct']}, 'type'=>'CodeableConcept', 'path'=>'Except.action', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-action'}},
        'securityLabel' => {'valid_codes'=>{'http://hl7.org/fhir/v3/Confidentiality'=>['U', 'L', 'M', 'N', 'R', 'V'], 'http://hl7.org/fhir/v3/ActCode'=>['_InformationSensitivityPolicy', '_ActInformationSensitivityPolicy', 'ETH', 'GDIS', 'HIV', 'PSY', 'SOC', 'SCA', 'SDV', 'SEX', 'STD', 'TBOO', 'SICKLE', '_EntitySensitivityPolicyType', 'DEMO', 'DOB', 'GENDER', 'LIVARG', 'MARST', 'RACE', 'REL', '_RoleInformationSensitivityPolicy', 'B', 'EMPL', 'LOCIS', 'SSP', 'ADOL', 'CEL', 'DIA', 'DRGIS', 'EMP', 'PDS', 'PRS', 'COMPT', 'HRCOMPT', 'RESCOMPT', 'RMGTCOMPT', 'SecurityPolicy', 'ObligationPolicy', 'ANONY', 'AOD', 'AUDIT', 'AUDTR', 'CPLYCC', 'CPLYCD', 'CPLYJPP', 'CPLYOPP', 'CPLYOSP', 'CPLYPOL', 'DECLASSIFYLABEL', 'DEID', 'DELAU', 'DOWNGRDLABEL', 'DRIVLABEL', 'ENCRYPT', 'ENCRYPTR', 'ENCRYPTT', 'ENCRYPTU', 'HUAPRV', 'LABEL', 'MASK', 'MINEC', 'PERSISTLABEL', 'PRIVMARK', 'PSEUD', 'REDACT', 'UPGRDLABEL', 'RefrainPolicy', 'NOAUTH', 'NOCOLLECT', 'NODSCLCD', 'NODSCLCDS', 'NOINTEGRATE', 'NOLIST', 'NOMOU', 'NOORGPOL', 'NOPAT', 'NOPERSISTP', 'NORDSCLCD', 'NORDSCLCDS', 'NORDSCLW', 'NORELINK', 'NOREUSE', 'NOVIP', 'ORCON'], 'http://hl7.org/fhir/v3/ObservationValue'=>['_SECALTINTOBV', 'ABSTRED', 'AGGRED', 'ANONYED', 'MAPPED', 'MASKED', 'PSEUDED', 'REDACTED', 'SUBSETTED', 'SYNTAC', 'TRSLT', 'VERSIONED', '_SECDATINTOBV', 'CRYTOHASH', 'DIGSIG', '_SECINTCONOBV', 'HRELIABLE', 'RELIABLE', 'UNCERTREL', 'UNRELIABLE', '_SECINTPRVOBV', '_SECINTPRVABOBV', 'CLINAST', 'DEVAST', 'HCPAST', 'PACQAST', 'PATAST', 'PAYAST', 'PROAST', 'SDMAST', '_SECINTPRVRBOBV', 'CLINRPT', 'DEVRPT', 'HCPRPT', 'PACQRPT', 'PATRPT', 'PAYRPT', 'PRORPT', 'SDMRPT'], 'http://hl7.org/fhir/v3/ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH'], 'http://hl7.org/fhir/v3/ActUSPrivacyLaw'=>['_ActUSPrivacyLaw', '42CFRPart2', 'CommonRule', 'HIPAANOPP', 'HIPAAPsyNotes', 'HIPAASelfPay', 'Title38Section7332']}, 'type'=>'Coding', 'path'=>'Except.securityLabel', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/security-labels'}},
        'purpose' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH']}, 'type'=>'Coding', 'path'=>'Except.purpose', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-PurposeOfUse'}},
        'class' => {'local_name'=>'local_class', 'type'=>'Coding', 'path'=>'Except.class', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-content-class'}},
        'code' => {'valid_codes'=>{'http://loinc.org'=>[]}, 'type'=>'Coding', 'path'=>'Except.code', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-content-code'}},
        'data' => {'type'=>'Consent::Except::Data', 'path'=>'Except.data', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Actor < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Actor.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Actor.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Actor.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'role' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ParticipationType'=>['REF', 'AUT', 'INF', 'SBJ', 'PRCP', 'CST']}, 'type'=>'CodeableConcept', 'path'=>'Actor.role', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-actor-role'}},
          'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Actor.reference', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :role              # 1-1 CodeableConcept
        attr_accessor :reference         # 1-1 Reference(Device|Group|CareTeam|Organization|Patient|Practitioner|RelatedPerson)
      end

      class Data < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Data.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Data.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Data.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'meaning' => {'valid_codes'=>{'http://hl7.org/fhir/consent-data-meaning'=>['instance', 'related', 'dependents', 'instance', 'related', 'dependents']}, 'type'=>'code', 'path'=>'Data.meaning', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-data-meaning'}},
          'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Data.reference', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :meaning           # 1-1 code
        attr_accessor :reference         # 1-1 Reference(Resource)
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 code
      attr_accessor :period            # 0-1 Period
      attr_accessor :actor             # 0-* [ Consent::Except::Actor ]
      attr_accessor :action            # 0-* [ CodeableConcept ]
      attr_accessor :securityLabel     # 0-* [ Coding ]
      attr_accessor :purpose           # 0-* [ Coding ]
      attr_accessor :local_class       # 0-* [ Coding ]
      attr_accessor :code              # 0-* [ Coding ]
      attr_accessor :data              # 0-* [ Consent::Except::Data ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :identifier        # 0-1 Identifier
    attr_accessor :status            # 1-1 code
    attr_accessor :category          # 0-* [ CodeableConcept ]
    attr_accessor :dateTime          # 0-1 dateTime
    attr_accessor :period            # 0-1 Period
    attr_accessor :patient           # 1-1 Reference(Patient)
    attr_accessor :consentor         # 0-* [ Reference(Organization|Patient|Practitioner|RelatedPerson) ]
    attr_accessor :organization      # 0-1 Reference(Organization)
    attr_accessor :sourceAttachment  # 0-1 Attachment
    attr_accessor :sourceIdentifier  # 0-1 Identifier
    attr_accessor :sourceReference   # 0-1 Reference(Consent|DocumentReference|Contract|QuestionnaireResponse)
    attr_accessor :policy            # 1-1 uri
    attr_accessor :recipient         # 0-* [ Reference(Device|Group|Organization|Patient|Practitioner|RelatedPerson|CareTeam) ]
    attr_accessor :purpose           # 0-* [ Coding ]
    attr_accessor :except            # 0-* [ Consent::Except ]

    def resourceType
      'Consent'
    end
  end
end