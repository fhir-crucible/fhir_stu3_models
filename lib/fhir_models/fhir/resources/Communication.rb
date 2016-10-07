module FHIR
  class Communication < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["based-on", "category", "context", "identifier", "medium", "patient", "received", "recipient", "sender", "sent", "status", "subject"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Communication.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Communication.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Communication.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Communication.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Communication.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Communication.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Communication.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Communication.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Communication.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Communication.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'parent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Communication.parent', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/communication-status'=>['in-progress', 'completed', 'suspended', 'rejected', 'failed', 'in-progress', 'completed', 'suspended', 'rejected', 'failed']}, 'type'=>'code', 'path'=>'Communication.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/communication-status'}},
      'category' => {'type'=>'CodeableConcept', 'path'=>'Communication.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'medium' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ParticipationMode'=>['ELECTRONIC', 'PHYSICAL', 'REMOTE', 'VERBAL', 'DICTATE', 'FACE', 'PHONE', 'VIDEOCONF', 'WRITTEN', 'FAXWRIT', 'HANDWRIT', 'MAILWRIT', 'ONLINEWRIT', 'EMAILWRIT', 'TYPEWRIT']}, 'type'=>'CodeableConcept', 'path'=>'Communication.medium', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ParticipationMode'}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Communication.subject', 'min'=>0, 'max'=>1},
      'topic' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Communication.topic', 'min'=>0, 'max'=>Float::INFINITY},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'Communication.context', 'min'=>0, 'max'=>1},
      'sent' => {'type'=>'dateTime', 'path'=>'Communication.sent', 'min'=>0, 'max'=>1},
      'received' => {'type'=>'dateTime', 'path'=>'Communication.received', 'min'=>0, 'max'=>1},
      'sender' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Communication.sender', 'min'=>0, 'max'=>1},
      'recipient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Communication.recipient', 'min'=>0, 'max'=>Float::INFINITY},
      'reason' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['_ActAccommodationReason', 'ACCREQNA', 'FLRCNV', 'MEDNEC', 'PAT', '_ActCoverageReason', '_EligibilityActReasonCode', '_ActIneligibilityReason', 'COVSUS', 'DECSD', 'REGERR', '_CoverageEligibilityReason', 'AGE', 'CRIME', 'DIS', 'EMPLOY', 'FINAN', 'HEALTH', 'MULTI', 'PNC', 'STATUTORY', 'VEHIC', 'WORK', '_ActInformationManagementReason', '_ActHealthInformationManagementReason', '_ActConsentInformationAccessOverrideReason', 'OVRER', 'OVRPJ', 'OVRPS', 'OVRTPS', 'PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH', '_ActInformationPrivacyReason', 'MARKT', 'OPERAT', 'LEGAL', 'ACCRED', 'COMPL', 'ENADMIN', 'OUTCOMS', 'PRGRPT', 'QUALIMP', 'SYSADMN', 'PAYMT', 'RESCH', 'SRVC', '_ActInvalidReason', 'ADVSTORAGE', 'COLDCHNBRK', 'EXPLOT', 'OUTSIDESCHED', 'PRODRECALL', '_ActInvoiceCancelReason', 'INCCOVPTY', 'INCINVOICE', 'INCPOLICY', 'INCPROV', '_ActNoImmunizationReason', 'IMMUNE', 'MEDPREC', 'OSTOCK', 'PATOBJ', 'PHILISOP', 'RELIG', 'VACEFF', 'VACSAF', '_ActSupplyFulfillmentRefusalReason', 'FRR01', 'FRR02', 'FRR03', 'FRR04', 'FRR05', 'FRR06', '_ClinicalResearchEventReason', 'RET', 'SCH', 'TRM', 'UNS', '_ClinicalResearchObservationReason', 'NPT', 'PPT', 'UPT', '_CombinedPharmacyOrderSuspendReasonCode', 'ALTCHOICE', 'CLARIF', 'DRUGHIGH', 'HOSPADM', 'LABINT', 'NON-AVAIL', 'PREG', 'SALG', 'SDDI', 'SDUPTHER', 'SINTOL', 'SURG', 'WASHOUT', '_ControlActNullificationReasonCode', 'ALTD', 'EIE', 'NORECMTCH', '_ControlActNullificationRefusalReasonType', 'INRQSTATE', 'NOMATCH', 'NOPRODMTCH', 'NOSERMTCH', 'NOVERMTCH', 'NOPERM', 'NOUSERPERM', 'NOAGNTPERM', 'NOUSRPERM', 'WRNGVER', '_ControlActReason', '_MedicationOrderAbortReasonCode', 'DISCONT', 'INEFFECT', 'MONIT', 'NOREQ', 'NOTCOVER', 'PREFUS', 'RECALL', 'REPLACE', 'DOSECHG', 'REPLACEFIX', 'UNABLE', '_MedicationOrderReleaseReasonCode', 'HOLDDONE', 'HOLDINAP', '_ModifyPrescriptionReasonType', 'ADMINERROR', 'CLINMOD', '_PharmacySupplyEventAbortReason', 'CONTRA', 'FOABORT', 'FOSUSP', 'NOPICK', 'PATDEC', 'QUANTCHG', '_PharmacySupplyEventStockReasonCode', 'FLRSTCK', 'LTC', 'OFFICE', 'PHARM', 'PROG', '_PharmacySupplyRequestRenewalRefusalReasonCode', 'ALREADYRX', 'FAMPHYS', 'MODIFY', 'NEEDAPMT', 'NOTAVAIL', 'NOTPAT', 'ONHOLD', 'PRNA', 'STOPMED', 'TOOEARLY', '_SupplyOrderAbortReasonCode', 'IMPROV', 'INTOL', 'NEWSTR', 'NEWTHER', '_GenericUpdateReasonCode', 'CHGDATA', 'FIXDATA', 'MDATA', 'NEWDATA', 'UMDATA', '_PatientProfileQueryReasonCode', 'ADMREV', 'PATCAR', 'PATREQ', 'PRCREV', 'REGUL', 'RSRCH', 'VALIDATION', '_PharmacySupplyRequestFulfillerRevisionRefusalReasonCode', 'LOCKED', 'UNKWNTARGET', '_RefusalReasonCode', '_SchedulingActReason', 'BLK', 'DEC', 'FIN', 'MED', 'MTG', 'PHY', '_StatusRevisionRefusalReasonCode', 'FILLED', '_SubstanceAdministrationPermissionRefusalReasonCode', 'PATINELIG', 'PROTUNMET', 'PROVUNAUTH', '_SubstanceAdminSubstitutionNotAllowedReason', 'ALGINT', 'COMPCON', 'THERCHAR', 'TRIAL', '_SubstanceAdminSubstitutionReason', 'CT', 'FP', 'OS', 'RR', '_TransferActReason', 'ER', 'RQ', '_ActBillableServiceReason', '_ActBillableClinicalServiceReason', 'BONUS', 'CHD', 'DEP', 'ECH', 'EDU', 'EMP', 'ESP', 'FAM', 'IND', 'INVOICE', 'PROA', 'RECOV', 'RETRO', 'SPC', 'SPO', 'TRAN']}, 'type'=>'CodeableConcept', 'path'=>'Communication.reason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ActReason'}},
      'payload' => {'type'=>'Communication::Payload', 'path'=>'Communication.payload', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'Communication.note', 'min'=>0, 'max'=>Float::INFINITY}
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

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :basedOn           # 0-* [ Reference(Resource) ]
    attr_accessor :parent            # 0-* [ Reference(Resource) ]
    attr_accessor :status            # 0-1 code
    attr_accessor :category          # 0-1 CodeableConcept
    attr_accessor :medium            # 0-* [ CodeableConcept ]
    attr_accessor :subject           # 0-1 Reference(Patient|Group)
    attr_accessor :topic             # 0-* [ Reference(Resource) ]
    attr_accessor :context           # 0-1 Reference(Encounter|EpisodeOfCare)
    attr_accessor :sent              # 0-1 dateTime
    attr_accessor :received          # 0-1 dateTime
    attr_accessor :sender            # 0-1 Reference(Device|Organization|Patient|Practitioner|RelatedPerson)
    attr_accessor :recipient         # 0-* [ Reference(Device|Organization|Patient|Practitioner|RelatedPerson|Group) ]
    attr_accessor :reason            # 0-* [ CodeableConcept ]
    attr_accessor :payload           # 0-* [ Communication::Payload ]
    attr_accessor :note              # 0-* [ Annotation ]

    def resourceType
      'Communication'
    end
  end
end