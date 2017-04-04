module FHIR
  class CommunicationRequest < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'occurrence' => ['dateTime', 'Period']
    }
    SEARCH_PARAMS = ['authored', 'based-on', 'category', 'context', 'encounter', 'group-identifier', 'identifier', 'medium', 'occurrence', 'patient', 'priority', 'recipient', 'replaces', 'requester', 'sender', 'status', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'CommunicationRequest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'CommunicationRequest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'CommunicationRequest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'CommunicationRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'CommunicationRequest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'CommunicationRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'CommunicationRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'CommunicationRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'CommunicationRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'CommunicationRequest.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'replaces' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CommunicationRequest'], 'type'=>'Reference', 'path'=>'CommunicationRequest.replaces', 'min'=>0, 'max'=>Float::INFINITY},
      'groupIdentifier' => {'type'=>'Identifier', 'path'=>'CommunicationRequest.groupIdentifier', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/request-status'=>['draft', 'active', 'suspended', 'cancelled', 'completed', 'entered-in-error', 'unknown', 'draft', 'active', 'suspended', 'cancelled', 'completed', 'entered-in-error', 'unknown']}, 'type'=>'code', 'path'=>'CommunicationRequest.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/request-status'}},
      'category' => {'valid_codes'=>{'http://hl7.org/fhir/communication-category'=>['alert', 'notification', 'reminder', 'instruction', 'alert', 'notification', 'reminder', 'instruction']}, 'type'=>'CodeableConcept', 'path'=>'CommunicationRequest.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/communication-category'}},
      'priority' => {'valid_codes'=>{'http://hl7.org/fhir/request-priority'=>['routine', 'urgent', 'asap', 'stat', 'routine', 'urgent', 'asap', 'stat']}, 'type'=>'code', 'path'=>'CommunicationRequest.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/request-priority'}},
      'medium' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ParticipationMode'=>['ELECTRONIC', 'PHYSICAL', 'REMOTE', 'VERBAL', 'DICTATE', 'FACE', 'PHONE', 'VIDEOCONF', 'WRITTEN', 'FAXWRIT', 'HANDWRIT', 'MAILWRIT', 'ONLINEWRIT', 'EMAILWRIT', 'TYPEWRIT']}, 'type'=>'CodeableConcept', 'path'=>'CommunicationRequest.medium', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ParticipationMode'}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'CommunicationRequest.subject', 'min'=>0, 'max'=>1},
      'recipient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'CommunicationRequest.recipient', 'min'=>0, 'max'=>Float::INFINITY},
      'topic' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'CommunicationRequest.topic', 'min'=>0, 'max'=>Float::INFINITY},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'CommunicationRequest.context', 'min'=>0, 'max'=>1},
      'payload' => {'type'=>'CommunicationRequest::Payload', 'path'=>'CommunicationRequest.payload', 'min'=>0, 'max'=>Float::INFINITY},
      'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'CommunicationRequest.occurrence[x]', 'min'=>0, 'max'=>1},
      'occurrencePeriod' => {'type'=>'Period', 'path'=>'CommunicationRequest.occurrence[x]', 'min'=>0, 'max'=>1},
      'authoredOn' => {'type'=>'dateTime', 'path'=>'CommunicationRequest.authoredOn', 'min'=>0, 'max'=>1},
      'sender' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'CommunicationRequest.sender', 'min'=>0, 'max'=>1},
      'requester' => {'type'=>'CommunicationRequest::Requester', 'path'=>'CommunicationRequest.requester', 'min'=>0, 'max'=>1},
      'reasonCode' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['ACCREQNA', 'FLRCNV', 'MEDNEC', 'PAT', 'COVSUS', 'DECSD', 'REGERR', 'AGE', 'CRIME', 'DIS', 'EMPLOY', 'FINAN', 'HEALTH', 'MULTI', 'PNC', 'STATUTORY', 'VEHIC', 'WORK', 'OVRER', 'OVRPJ', 'OVRPS', 'OVRTPS', 'PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH', 'MARKT', 'OPERAT', 'LEGAL', 'ACCRED', 'COMPL', 'ENADMIN', 'OUTCOMS', 'PRGRPT', 'QUALIMP', 'SYSADMN', 'PAYMT', 'RESCH', 'SRVC', '_ActInvalidReason', 'ADVSTORAGE', 'COLDCHNBRK', 'EXPLOT', 'OUTSIDESCHED', 'PRODRECALL', 'INCCOVPTY', 'INCINVOICE', 'INCPOLICY', 'INCPROV', 'IMMUNE', 'MEDPREC', 'OSTOCK', 'PATOBJ', 'PHILISOP', 'RELIG', 'VACEFF', 'VACSAF', 'FRR01', 'FRR02', 'FRR03', 'FRR04', 'FRR05', 'FRR06', 'RET', 'SCH', 'TRM', 'UNS', 'NPT', 'PPT', 'UPT', 'ALTCHOICE', 'CLARIF', 'DRUGHIGH', 'HOSPADM', 'LABINT', 'NON-AVAIL', 'PREG', 'SALG', 'SDDI', 'SDUPTHER', 'SINTOL', 'SURG', 'WASHOUT', '_ControlActNullificationReasonCode', 'ALTD', 'EIE', 'NORECMTCH', 'INRQSTATE', 'NOMATCH', 'NOPRODMTCH', 'NOSERMTCH', 'NOVERMTCH', 'NOPERM', 'NOUSERPERM', 'NOAGNTPERM', 'NOUSRPERM', 'WRNGVER', 'DISCONT', 'INEFFECT', 'MONIT', 'NOREQ', 'NOTCOVER', 'PREFUS', 'RECALL', 'REPLACE', 'DOSECHG', 'REPLACEFIX', 'UNABLE', 'HOLDDONE', 'HOLDINAP', 'ADMINERROR', 'CLINMOD', '_PharmacySupplyEventAbortReason', 'CONTRA', 'FOABORT', 'FOSUSP', 'NOPICK', 'PATDEC', 'QUANTCHG', 'FLRSTCK', 'LTC', 'OFFICE', 'PHARM', 'PROG', 'ALREADYRX', 'FAMPHYS', 'MODIFY', 'NEEDAPMT', 'NOTAVAIL', 'NOTPAT', 'ONHOLD', 'PRNA', 'STOPMED', 'TOOEARLY', 'IMPROV', 'INTOL', 'NEWSTR', 'NEWTHER', 'CHGDATA', 'FIXDATA', 'MDATA', 'NEWDATA', 'UMDATA', 'ADMREV', 'PATCAR', 'PATREQ', 'PRCREV', 'REGUL', 'RSRCH', 'VALIDATION', '_PharmacySupplyRequestFulfillerRevisionRefusalReasonCode', 'LOCKED', 'UNKWNTARGET', 'BLK', 'DEC', 'FIN', 'MED', 'MTG', 'PHY', '_StatusRevisionRefusalReasonCode', 'FILLED', '_SubstanceAdministrationPermissionRefusalReasonCode', 'PATINELIG', 'PROTUNMET', 'PROVUNAUTH', 'ALGINT', 'COMPCON', 'THERCHAR', 'TRIAL', 'CT', 'FP', 'OS', 'RR', 'ER', 'RQ', 'BONUS', 'CHD', 'DEP', 'ECH', 'EDU', 'EMP', 'ESP', 'FAM', 'IND', 'INVOICE', 'PROA', 'RECOV', 'RETRO', 'SPC', 'SPO', 'TRAN']}, 'type'=>'CodeableConcept', 'path'=>'CommunicationRequest.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ActReason'}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'CommunicationRequest.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'CommunicationRequest.note', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Payload < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'content' => ['string', 'Attachment', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Payload.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Payload.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Payload.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'contentString' => {'type'=>'string', 'path'=>'Payload.content[x]', 'min'=>1, 'max'=>1},
        'contentAttachment' => {'type'=>'Attachment', 'path'=>'Payload.content[x]', 'min'=>1, 'max'=>1},
        'contentReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Payload.content[x]', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :contentString     # 1-1 string
      attr_accessor :contentAttachment # 1-1 Attachment
      attr_accessor :contentReference  # 1-1 Reference(Resource)
    end

    class Requester < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Requester.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Requester.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Requester.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'agent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Requester.agent', 'min'=>1, 'max'=>1},
        'onBehalfOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Requester.onBehalfOf', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :agent             # 1-1 Reference(Practitioner|Organization|Patient|RelatedPerson|Device)
      attr_accessor :onBehalfOf        # 0-1 Reference(Organization)
    end

    attr_accessor :id                 # 0-1 id
    attr_accessor :meta               # 0-1 Meta
    attr_accessor :implicitRules      # 0-1 uri
    attr_accessor :language           # 0-1 code
    attr_accessor :text               # 0-1 Narrative
    attr_accessor :contained          # 0-* [ Resource ]
    attr_accessor :extension          # 0-* [ Extension ]
    attr_accessor :modifierExtension  # 0-* [ Extension ]
    attr_accessor :identifier         # 0-* [ Identifier ]
    attr_accessor :basedOn            # 0-* [ Reference(Resource) ]
    attr_accessor :replaces           # 0-* [ Reference(CommunicationRequest) ]
    attr_accessor :groupIdentifier    # 0-1 Identifier
    attr_accessor :status             # 1-1 code
    attr_accessor :category           # 0-* [ CodeableConcept ]
    attr_accessor :priority           # 0-1 code
    attr_accessor :medium             # 0-* [ CodeableConcept ]
    attr_accessor :subject            # 0-1 Reference(Patient|Group)
    attr_accessor :recipient          # 0-* [ Reference(Device|Organization|Patient|Practitioner|RelatedPerson|Group|CareTeam) ]
    attr_accessor :topic              # 0-* [ Reference(Resource) ]
    attr_accessor :context            # 0-1 Reference(Encounter|EpisodeOfCare)
    attr_accessor :payload            # 0-* [ CommunicationRequest::Payload ]
    attr_accessor :occurrenceDateTime # 0-1 dateTime
    attr_accessor :occurrencePeriod   # 0-1 Period
    attr_accessor :authoredOn         # 0-1 dateTime
    attr_accessor :sender             # 0-1 Reference(Device|Organization|Patient|Practitioner|RelatedPerson)
    attr_accessor :requester          # 0-1 CommunicationRequest::Requester
    attr_accessor :reasonCode         # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference    # 0-* [ Reference(Condition|Observation) ]
    attr_accessor :note               # 0-* [ Annotation ]

    def resourceType
      'CommunicationRequest'
    end
  end
end