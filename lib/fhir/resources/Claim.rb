module FHIR
  class Claim < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'insurer' => ['Identifier', 'Reference'],
      'provider' => ['Identifier', 'Reference'],
      'organization' => ['Identifier', 'Reference'],
      'enterer' => ['Identifier', 'Reference'],
      'facility' => ['Identifier', 'Reference'],
      'prescription' => ['Identifier', 'Reference'],
      'originalPrescription' => ['Identifier', 'Reference'],
      'referral' => ['Identifier', 'Reference'],
      'patient' => ['Identifier', 'Reference']
    }
    SEARCH_PARAMS = ["created", "facility-identifier", "facility-reference", "identifier", "insurer-identifier", "insurer-reference", "organization-identifier", "organization-reference", "patient-identifier", "patient-reference", "priority", "provider-identifier", "provider-reference", "use"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Claim.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Claim.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Claim.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Claim.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Claim.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Claim.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Claim.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Claim.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Claim.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/claim-status'=>['active', 'cancelled', 'draft', 'entered-in-error', 'active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'Claim.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-status'}},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/ex-claimtype'=>['institutional', 'oral', 'pharmacy', 'professional', 'vision', 'institutional', 'oral', 'pharmacy', 'professional', 'vision']}, 'type'=>'Coding', 'path'=>'Claim.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-type'}},
      'subType' => {'valid_codes'=>{'http://hl7.org/fhir/ex-claimsubtype'=>['ortho', 'emergency', 'ortho', 'emergency']}, 'type'=>'Coding', 'path'=>'Claim.subType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-subtype'}},
      'ruleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3', 'x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'Claim.ruleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'originalRuleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3', 'x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'Claim.originalRuleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'created' => {'type'=>'dateTime', 'path'=>'Claim.created', 'min'=>0, 'max'=>1},
      'billablePeriod' => {'type'=>'Period', 'path'=>'Claim.billablePeriod', 'min'=>0, 'max'=>1},
      'insurerIdentifier' => {'type'=>'Identifier', 'path'=>'Claim.insurer[x]', 'min'=>0, 'max'=>1},
      'insurerReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Claim.insurer[x]', 'min'=>0, 'max'=>1},
      'providerIdentifier' => {'type'=>'Identifier', 'path'=>'Claim.provider[x]', 'min'=>0, 'max'=>1},
      'providerReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Claim.provider[x]', 'min'=>0, 'max'=>1},
      'organizationIdentifier' => {'type'=>'Identifier', 'path'=>'Claim.organization[x]', 'min'=>0, 'max'=>1},
      'organizationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Claim.organization[x]', 'min'=>0, 'max'=>1},
      'use' => {'valid_codes'=>{'http://hl7.org/fhir/claim-use'=>['complete', 'proposed', 'exploratory', 'other', 'complete', 'proposed', 'exploratory', 'other']}, 'type'=>'code', 'path'=>'Claim.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-use'}},
      'priority' => {'valid_codes'=>{'http://hl7.org/fhir/processpriority'=>['stat', 'normal', 'deferred', 'stat', 'normal', 'deferred']}, 'type'=>'Coding', 'path'=>'Claim.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/process-priority'}},
      'fundsReserve' => {'valid_codes'=>{'http://hl7.org/fhir/fundsreserve'=>['patient', 'provider', 'none', 'patient', 'provider', 'none']}, 'type'=>'Coding', 'path'=>'Claim.fundsReserve', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/fundsreserve'}},
      'entererIdentifier' => {'type'=>'Identifier', 'path'=>'Claim.enterer[x]', 'min'=>0, 'max'=>1},
      'entererReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Claim.enterer[x]', 'min'=>0, 'max'=>1},
      'facilityIdentifier' => {'type'=>'Identifier', 'path'=>'Claim.facility[x]', 'min'=>0, 'max'=>1},
      'facilityReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Claim.facility[x]', 'min'=>0, 'max'=>1},
      'related' => {'type'=>'Claim::Related', 'path'=>'Claim.related', 'min'=>0, 'max'=>Float::INFINITY},
      'prescriptionIdentifier' => {'type'=>'Identifier', 'path'=>'Claim.prescription[x]', 'min'=>0, 'max'=>1},
      'prescriptionReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationOrder', 'http://hl7.org/fhir/StructureDefinition/VisionPrescription'], 'type'=>'Reference', 'path'=>'Claim.prescription[x]', 'min'=>0, 'max'=>1},
      'originalPrescriptionIdentifier' => {'type'=>'Identifier', 'path'=>'Claim.originalPrescription[x]', 'min'=>0, 'max'=>1},
      'originalPrescriptionReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationOrder'], 'type'=>'Reference', 'path'=>'Claim.originalPrescription[x]', 'min'=>0, 'max'=>1},
      'payee' => {'type'=>'Claim::Payee', 'path'=>'Claim.payee', 'min'=>0, 'max'=>1},
      'referralIdentifier' => {'type'=>'Identifier', 'path'=>'Claim.referral[x]', 'min'=>0, 'max'=>1},
      'referralReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ReferralRequest'], 'type'=>'Reference', 'path'=>'Claim.referral[x]', 'min'=>0, 'max'=>1},
      'information' => {'type'=>'Claim::Information', 'path'=>'Claim.information', 'min'=>0, 'max'=>Float::INFINITY},
      'diagnosis' => {'type'=>'Claim::Diagnosis', 'path'=>'Claim.diagnosis', 'min'=>0, 'max'=>Float::INFINITY},
      'procedure' => {'type'=>'Claim::Procedure', 'path'=>'Claim.procedure', 'min'=>0, 'max'=>Float::INFINITY},
      'patientIdentifier' => {'type'=>'Identifier', 'path'=>'Claim.patient[x]', 'min'=>1, 'max'=>1},
      'patientReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Claim.patient[x]', 'min'=>1, 'max'=>1},
      'coverage' => {'type'=>'Claim::Coverage', 'path'=>'Claim.coverage', 'min'=>0, 'max'=>Float::INFINITY},
      'accident' => {'type'=>'Claim::Accident', 'path'=>'Claim.accident', 'min'=>0, 'max'=>1},
      'employmentImpacted' => {'type'=>'Period', 'path'=>'Claim.employmentImpacted', 'min'=>0, 'max'=>1},
      'hospitalization' => {'type'=>'Period', 'path'=>'Claim.hospitalization', 'min'=>0, 'max'=>1},
      'item' => {'type'=>'Claim::Item', 'path'=>'Claim.item', 'min'=>0, 'max'=>Float::INFINITY},
      'total' => {'type'=>'Money', 'path'=>'Claim.total', 'min'=>0, 'max'=>1},
      'missingTeeth' => {'type'=>'Claim::MissingTeeth', 'path'=>'Claim.missingTeeth', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Related < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'claim' => ['Identifier', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Related.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Related.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Related.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'claimIdentifier' => {'type'=>'Identifier', 'path'=>'Related.claim[x]', 'min'=>0, 'max'=>1},
        'claimReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Claim'], 'type'=>'Reference', 'path'=>'Related.claim[x]', 'min'=>0, 'max'=>1},
        'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/ex-relatedclaimrelationship'=>['prior', 'associated', 'prior', 'associated']}, 'type'=>'Coding', 'path'=>'Related.relationship', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/related-claim-relationship'}},
        'reference' => {'type'=>'Identifier', 'path'=>'Related.reference', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :claimIdentifier   # 0-1 Identifier
      attr_accessor :claimReference    # 0-1 Reference(Claim)
      attr_accessor :relationship      # 0-1 Coding
      attr_accessor :reference         # 0-1 Identifier
    end

    class Payee < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'party' => ['Identifier', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Payee.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Payee.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Payee.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/payeetype'=>['subscriber', 'provider', 'other', 'subscriber', 'provider', 'other']}, 'type'=>'Coding', 'path'=>'Payee.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/payeetype'}},
        'resourceType' => {'local_name'=>'local_resourceType', 'valid_codes'=>{'http://hl7.org/fhir/ex-payee-resource-type'=>['organization', 'patient', 'practitioner', 'relatedperson', 'organization', 'patient', 'practitioner', 'relatedperson']}, 'type'=>'Coding', 'path'=>'Payee.resourceType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-payee-resource-type'}},
        'partyIdentifier' => {'type'=>'Identifier', 'path'=>'Payee.party[x]', 'min'=>0, 'max'=>1},
        'partyReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Payee.party[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                 # 0-1 string
      attr_accessor :extension          # 0-* [ Extension ]
      attr_accessor :modifierExtension  # 0-* [ Extension ]
      attr_accessor :type               # 1-1 Coding
      attr_accessor :local_resourceType # 0-1 Coding
      attr_accessor :partyIdentifier    # 0-1 Identifier
      attr_accessor :partyReference     # 0-1 Reference(Practitioner|Organization|Patient|RelatedPerson)
    end

    class Information < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'timing' => ['date', 'Period'],
        'value' => ['string', 'Quantity']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Information.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Information.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Information.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'category' => {'valid_codes'=>{'http://hl7.org/fhir/claiminformationcategory'=>['info', 'discharge', 'onset', 'related', 'exceptions', 'material', 'other', 'info', 'discharge', 'onset', 'related', 'exceptions', 'material', 'other']}, 'type'=>'Coding', 'path'=>'Information.category', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-informationcategory'}},
        'code' => {'valid_codes'=>{'http://hl7.org/fhir/claim-exception'=>['student', 'disabled', 'student', 'disabled']}, 'type'=>'Coding', 'path'=>'Information.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-exception'}},
        'timingDate' => {'type'=>'date', 'path'=>'Information.timing[x]', 'min'=>0, 'max'=>1},
        'timingPeriod' => {'type'=>'Period', 'path'=>'Information.timing[x]', 'min'=>0, 'max'=>1},
        'valueString' => {'type'=>'string', 'path'=>'Information.value[x]', 'min'=>0, 'max'=>1},
        'valueQuantity' => {'type'=>'Quantity', 'path'=>'Information.value[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :category          # 1-1 Coding
      attr_accessor :code              # 0-1 Coding
      attr_accessor :timingDate        # 0-1 date
      attr_accessor :timingPeriod      # 0-1 Period
      attr_accessor :valueString       # 0-1 string
      attr_accessor :valueQuantity     # 0-1 Quantity
    end

    class Diagnosis < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Diagnosis.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Diagnosis.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Diagnosis.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Diagnosis.sequence', 'min'=>1, 'max'=>1},
        'diagnosis' => {'type'=>'Coding', 'path'=>'Diagnosis.diagnosis', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/icd-10'}},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/ex-diagnosistype'=>['admitting', 'clinical', 'differential', 'discharge', 'laboratory', 'nursing', 'prenatal', 'principal', 'radiology', 'remote', 'retrospective', 'self', 'admitting', 'clinical', 'differential', 'discharge', 'laboratory', 'nursing', 'prenatal', 'principal', 'radiology', 'remote', 'retrospective', 'self']}, 'type'=>'Coding', 'path'=>'Diagnosis.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-diagnosistype'}},
        'drg' => {'valid_codes'=>{'http://hl7.org/fhir/ex-diagnosisrelatedgroup'=>['100', '101', '300', '100', '101', '300']}, 'type'=>'Coding', 'path'=>'Diagnosis.drg', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-diagnosisrelatedgroup'}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :sequence          # 1-1 positiveInt
      attr_accessor :diagnosis         # 1-1 Coding
      attr_accessor :type              # 0-* [ Coding ]
      attr_accessor :drg               # 0-1 Coding
    end

    class Procedure < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'procedure' => ['Coding', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Procedure.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Procedure.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Procedure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Procedure.sequence', 'min'=>1, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'Procedure.date', 'min'=>0, 'max'=>1},
        'procedureCoding' => {'valid_codes'=>{'http://hl7.org/fhir/sid/ex-icd-10-procedures'=>['123001', '123002', '123003', '123001', '123002', '123003']}, 'type'=>'Coding', 'path'=>'Procedure.procedure[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/icd-10-procedures'}},
        'procedureReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Procedure'], 'type'=>'Reference', 'path'=>'Procedure.procedure[x]', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                 # 0-1 string
      attr_accessor :extension          # 0-* [ Extension ]
      attr_accessor :modifierExtension  # 0-* [ Extension ]
      attr_accessor :sequence           # 1-1 positiveInt
      attr_accessor :date               # 0-1 dateTime
      attr_accessor :procedureCoding    # 1-1 Coding
      attr_accessor :procedureReference # 1-1 Reference(Procedure)
    end

    class Coverage < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'coverage' => ['Identifier', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Coverage.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Coverage.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Coverage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Coverage.sequence', 'min'=>1, 'max'=>1},
        'focal' => {'type'=>'boolean', 'path'=>'Coverage.focal', 'min'=>1, 'max'=>1},
        'coverageIdentifier' => {'type'=>'Identifier', 'path'=>'Coverage.coverage[x]', 'min'=>1, 'max'=>1},
        'coverageReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage'], 'type'=>'Reference', 'path'=>'Coverage.coverage[x]', 'min'=>1, 'max'=>1},
        'businessArrangement' => {'type'=>'string', 'path'=>'Coverage.businessArrangement', 'min'=>0, 'max'=>1},
        'preAuthRef' => {'type'=>'string', 'path'=>'Coverage.preAuthRef', 'min'=>0, 'max'=>Float::INFINITY},
        'claimResponse' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ClaimResponse'], 'type'=>'Reference', 'path'=>'Coverage.claimResponse', 'min'=>0, 'max'=>1},
        'originalRuleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3', 'x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'Coverage.originalRuleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}}
      }

      attr_accessor :id                  # 0-1 string
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :sequence            # 1-1 positiveInt
      attr_accessor :focal               # 1-1 boolean
      attr_accessor :coverageIdentifier  # 1-1 Identifier
      attr_accessor :coverageReference   # 1-1 Reference(Coverage)
      attr_accessor :businessArrangement # 0-1 string
      attr_accessor :preAuthRef          # 0-* [ string ]
      attr_accessor :claimResponse       # 0-1 Reference(ClaimResponse)
      attr_accessor :originalRuleset     # 0-1 Coding
    end

    class Accident < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'location' => ['Address', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Accident.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Accident.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Accident.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'date' => {'type'=>'date', 'path'=>'Accident.date', 'min'=>1, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActCode'=>['MVA', 'SCHOOL', 'SPT', 'WPA']}, 'type'=>'Coding', 'path'=>'Accident.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ActIncidentCode'}},
        'locationAddress' => {'type'=>'Address', 'path'=>'Accident.location[x]', 'min'=>0, 'max'=>1},
        'locationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Accident.location[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :date              # 1-1 date
      attr_accessor :type              # 0-1 Coding
      attr_accessor :locationAddress   # 0-1 Address
      attr_accessor :locationReference # 0-1 Reference(Location)
    end

    class Item < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'serviced' => ['date', 'Period'],
        'location' => ['Coding', 'Address', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Item.sequence', 'min'=>1, 'max'=>1},
        'careTeam' => {'type'=>'Claim::Item::CareTeam', 'path'=>'Item.careTeam', 'min'=>0, 'max'=>Float::INFINITY},
        'diagnosisLinkId' => {'type'=>'positiveInt', 'path'=>'Item.diagnosisLinkId', 'min'=>0, 'max'=>Float::INFINITY},
        'revenue' => {'valid_codes'=>{'http://hl7.org/fhir/ex-revenue-center'=>['0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452', '0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452']}, 'type'=>'Coding', 'path'=>'Item.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center'}},
        'category' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-subcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6', '1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'Coding', 'path'=>'Item.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-subcategory'}},
        'service' => {'valid_codes'=>{'http://hl7.org/fhir/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555', '1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555']}, 'type'=>'Coding', 'path'=>'Item.service', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
        'modifier' => {'valid_codes'=>{'http://hl7.org/fhir/modifiers'=>['a', 'b', 'c', 'e', 'x', 'a', 'b', 'c', 'e', 'x']}, 'type'=>'Coding', 'path'=>'Item.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
        'programCode' => {'valid_codes'=>{'http://hl7.org/fhir/ex-programcode'=>['as', 'hd', 'auscr', 'as', 'hd', 'auscr']}, 'type'=>'Coding', 'path'=>'Item.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-program-code'}},
        'servicedDate' => {'type'=>'date', 'path'=>'Item.serviced[x]', 'min'=>0, 'max'=>1},
        'servicedPeriod' => {'type'=>'Period', 'path'=>'Item.serviced[x]', 'min'=>0, 'max'=>1},
        'locationCoding' => {'valid_codes'=>{'http://hl7.org/fhir/ex-serviceplace'=>['01', '03', '04', '05', '06', '07', '08', '09', '11', '12', '13', '14', '15', '19', '20', '21', '41', '01', '03', '04', '05', '06', '07', '08', '09', '11', '12', '13', '14', '15', '19', '20', '21', '41']}, 'type'=>'Coding', 'path'=>'Item.location[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-place'}},
        'locationAddress' => {'type'=>'Address', 'path'=>'Item.location[x]', 'min'=>0, 'max'=>1},
        'locationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Item.location[x]', 'min'=>0, 'max'=>1},
        'quantity' => {'type'=>'Quantity', 'path'=>'Item.quantity', 'min'=>0, 'max'=>1},
        'unitPrice' => {'type'=>'Money', 'path'=>'Item.unitPrice', 'min'=>0, 'max'=>1},
        'factor' => {'type'=>'decimal', 'path'=>'Item.factor', 'min'=>0, 'max'=>1},
        'points' => {'type'=>'decimal', 'path'=>'Item.points', 'min'=>0, 'max'=>1},
        'net' => {'type'=>'Money', 'path'=>'Item.net', 'min'=>0, 'max'=>1},
        'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Item.udi', 'min'=>0, 'max'=>Float::INFINITY},
        'bodySite' => {'valid_codes'=>{'http://hl7.org/fhir/ex-tooth'=>['0', '1', '2', '3', '4', '5', '6', '7', '8', '11', '12', '13', '14', '15', '16', '17', '18', '21', '22', '23', '24', '25', '26', '27', '28', '31', '32', '33', '34', '35', '36', '37', '38', '41', '42', '43', '44', '45', '46', '47', '48', '0', '1', '2', '3', '4', '5', '6', '7', '8', '11', '12', '13', '14', '15', '16', '17', '18', '21', '22', '23', '24', '25', '26', '27', '28', '31', '32', '33', '34', '35', '36', '37', '38', '41', '42', '43', '44', '45', '46', '47', '48']}, 'type'=>'Coding', 'path'=>'Item.bodySite', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/tooth'}},
        'subSite' => {'valid_codes'=>{'http://hl7.org/fhir/FDI-surface'=>['M', 'O', 'I', 'D', 'B', 'V', 'L', 'MO', 'DO', 'DI', 'MOD', 'M', 'O', 'I', 'D', 'B', 'V', 'L', 'MO', 'DO', 'DI', 'MOD']}, 'type'=>'Coding', 'path'=>'Item.subSite', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/surface'}},
        'detail' => {'type'=>'Claim::Item::Detail', 'path'=>'Item.detail', 'min'=>0, 'max'=>Float::INFINITY},
        'prosthesis' => {'type'=>'Claim::Item::Prosthesis', 'path'=>'Item.prosthesis', 'min'=>0, 'max'=>1}
      }

      class CareTeam < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'provider' => ['Identifier', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'CareTeam.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'CareTeam.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'CareTeam.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'providerIdentifier' => {'type'=>'Identifier', 'path'=>'CareTeam.provider[x]', 'min'=>1, 'max'=>1},
          'providerReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'CareTeam.provider[x]', 'min'=>1, 'max'=>1},
          'responsible' => {'type'=>'boolean', 'path'=>'CareTeam.responsible', 'min'=>0, 'max'=>1},
          'role' => {'valid_codes'=>{'http://hl7.org/fhir/claimcareteamrole'=>['primary', 'assist', 'supervisor', 'other', 'primary', 'assist', 'supervisor', 'other']}, 'type'=>'Coding', 'path'=>'CareTeam.role', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-careteamrole'}},
          'qualification' => {'valid_codes'=>{'http://hl7.org/fhir/ex-providerqualification'=>['311405', '604215', '604210', '311405', '604215', '604210']}, 'type'=>'Coding', 'path'=>'CareTeam.qualification', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/provider-qualification'}}
        }

        attr_accessor :id                 # 0-1 string
        attr_accessor :extension          # 0-* [ Extension ]
        attr_accessor :modifierExtension  # 0-* [ Extension ]
        attr_accessor :providerIdentifier # 1-1 Identifier
        attr_accessor :providerReference  # 1-1 Reference(Practitioner|Organization)
        attr_accessor :responsible        # 0-1 boolean
        attr_accessor :role               # 0-1 Coding
        attr_accessor :qualification      # 0-1 Coding
      end

      class Detail < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequence' => {'type'=>'positiveInt', 'path'=>'Detail.sequence', 'min'=>1, 'max'=>1},
          'revenue' => {'valid_codes'=>{'http://hl7.org/fhir/ex-revenue-center'=>['0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452', '0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452']}, 'type'=>'Coding', 'path'=>'Detail.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center'}},
          'category' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-subcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6', '1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'Coding', 'path'=>'Detail.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-subcategory'}},
          'service' => {'valid_codes'=>{'http://hl7.org/fhir/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555', '1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555']}, 'type'=>'Coding', 'path'=>'Detail.service', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
          'modifier' => {'valid_codes'=>{'http://hl7.org/fhir/modifiers'=>['a', 'b', 'c', 'e', 'x', 'a', 'b', 'c', 'e', 'x']}, 'type'=>'Coding', 'path'=>'Detail.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
          'programCode' => {'valid_codes'=>{'http://hl7.org/fhir/ex-programcode'=>['as', 'hd', 'auscr', 'as', 'hd', 'auscr']}, 'type'=>'Coding', 'path'=>'Detail.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-program-code'}},
          'quantity' => {'type'=>'Quantity', 'path'=>'Detail.quantity', 'min'=>0, 'max'=>1},
          'unitPrice' => {'type'=>'Money', 'path'=>'Detail.unitPrice', 'min'=>0, 'max'=>1},
          'factor' => {'type'=>'decimal', 'path'=>'Detail.factor', 'min'=>0, 'max'=>1},
          'points' => {'type'=>'decimal', 'path'=>'Detail.points', 'min'=>0, 'max'=>1},
          'net' => {'type'=>'Money', 'path'=>'Detail.net', 'min'=>0, 'max'=>1},
          'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Detail.udi', 'min'=>0, 'max'=>Float::INFINITY},
          'subDetail' => {'type'=>'Claim::Item::Detail::SubDetail', 'path'=>'Detail.subDetail', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class SubDetail < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'SubDetail.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'SubDetail.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'SubDetail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'sequence' => {'type'=>'positiveInt', 'path'=>'SubDetail.sequence', 'min'=>1, 'max'=>1},
            'revenue' => {'valid_codes'=>{'http://hl7.org/fhir/ex-revenue-center'=>['0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452', '0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452']}, 'type'=>'Coding', 'path'=>'SubDetail.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center'}},
            'category' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-subcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6', '1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'Coding', 'path'=>'SubDetail.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-subcategory'}},
            'service' => {'valid_codes'=>{'http://hl7.org/fhir/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555', '1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555']}, 'type'=>'Coding', 'path'=>'SubDetail.service', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
            'modifier' => {'valid_codes'=>{'http://hl7.org/fhir/modifiers'=>['a', 'b', 'c', 'e', 'x', 'a', 'b', 'c', 'e', 'x']}, 'type'=>'Coding', 'path'=>'SubDetail.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
            'programCode' => {'valid_codes'=>{'http://hl7.org/fhir/ex-programcode'=>['as', 'hd', 'auscr', 'as', 'hd', 'auscr']}, 'type'=>'Coding', 'path'=>'SubDetail.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-program-code'}},
            'quantity' => {'type'=>'Quantity', 'path'=>'SubDetail.quantity', 'min'=>0, 'max'=>1},
            'unitPrice' => {'type'=>'Money', 'path'=>'SubDetail.unitPrice', 'min'=>0, 'max'=>1},
            'factor' => {'type'=>'decimal', 'path'=>'SubDetail.factor', 'min'=>0, 'max'=>1},
            'points' => {'type'=>'decimal', 'path'=>'SubDetail.points', 'min'=>0, 'max'=>1},
            'net' => {'type'=>'Money', 'path'=>'SubDetail.net', 'min'=>0, 'max'=>1},
            'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'SubDetail.udi', 'min'=>0, 'max'=>Float::INFINITY}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :sequence          # 1-1 positiveInt
          attr_accessor :revenue           # 0-1 Coding
          attr_accessor :category          # 0-1 Coding
          attr_accessor :service           # 0-1 Coding
          attr_accessor :modifier          # 0-* [ Coding ]
          attr_accessor :programCode       # 0-* [ Coding ]
          attr_accessor :quantity          # 0-1 Quantity
          attr_accessor :unitPrice         # 0-1 Money
          attr_accessor :factor            # 0-1 decimal
          attr_accessor :points            # 0-1 decimal
          attr_accessor :net               # 0-1 Money
          attr_accessor :udi               # 0-* [ Reference(Device) ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :sequence          # 1-1 positiveInt
        attr_accessor :revenue           # 0-1 Coding
        attr_accessor :category          # 0-1 Coding
        attr_accessor :service           # 0-1 Coding
        attr_accessor :modifier          # 0-* [ Coding ]
        attr_accessor :programCode       # 0-* [ Coding ]
        attr_accessor :quantity          # 0-1 Quantity
        attr_accessor :unitPrice         # 0-1 Money
        attr_accessor :factor            # 0-1 decimal
        attr_accessor :points            # 0-1 decimal
        attr_accessor :net               # 0-1 Money
        attr_accessor :udi               # 0-* [ Reference(Device) ]
        attr_accessor :subDetail         # 0-* [ Claim::Item::Detail::SubDetail ]
      end

      class Prosthesis < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Prosthesis.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Prosthesis.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Prosthesis.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'initial' => {'type'=>'boolean', 'path'=>'Prosthesis.initial', 'min'=>0, 'max'=>1},
          'priorDate' => {'type'=>'date', 'path'=>'Prosthesis.priorDate', 'min'=>0, 'max'=>1},
          'priorMaterial' => {'valid_codes'=>{'http://hl7.org/fhir/ex-oralprostho'=>['1', '2', '3', '4', '1', '2', '3', '4']}, 'type'=>'Coding', 'path'=>'Prosthesis.priorMaterial', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/oral-prosthodontic-material'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :initial           # 0-1 boolean
        attr_accessor :priorDate         # 0-1 date
        attr_accessor :priorMaterial     # 0-1 Coding
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :sequence          # 1-1 positiveInt
      attr_accessor :careTeam          # 0-* [ Claim::Item::CareTeam ]
      attr_accessor :diagnosisLinkId   # 0-* [ positiveInt ]
      attr_accessor :revenue           # 0-1 Coding
      attr_accessor :category          # 0-1 Coding
      attr_accessor :service           # 0-1 Coding
      attr_accessor :modifier          # 0-* [ Coding ]
      attr_accessor :programCode       # 0-* [ Coding ]
      attr_accessor :servicedDate      # 0-1 date
      attr_accessor :servicedPeriod    # 0-1 Period
      attr_accessor :locationCoding    # 0-1 Coding
      attr_accessor :locationAddress   # 0-1 Address
      attr_accessor :locationReference # 0-1 Reference(Location)
      attr_accessor :quantity          # 0-1 Quantity
      attr_accessor :unitPrice         # 0-1 Money
      attr_accessor :factor            # 0-1 decimal
      attr_accessor :points            # 0-1 decimal
      attr_accessor :net               # 0-1 Money
      attr_accessor :udi               # 0-* [ Reference(Device) ]
      attr_accessor :bodySite          # 0-1 Coding
      attr_accessor :subSite           # 0-* [ Coding ]
      attr_accessor :detail            # 0-* [ Claim::Item::Detail ]
      attr_accessor :prosthesis        # 0-1 Claim::Item::Prosthesis
    end

    class MissingTeeth < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'MissingTeeth.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'MissingTeeth.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'MissingTeeth.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'tooth' => {'valid_codes'=>{'http://hl7.org/fhir/ex-fdi'=>['11', '12', '13', '14', '15', '16', '17', '18', '21', '22', '23', '24', '25', '26', '27', '28', '31', '32', '33', '34', '35', '36', '37', '38', '41', '42', '43', '44', '45', '46', '47', '48', '11', '12', '13', '14', '15', '16', '17', '18', '21', '22', '23', '24', '25', '26', '27', '28', '31', '32', '33', '34', '35', '36', '37', '38', '41', '42', '43', '44', '45', '46', '47', '48']}, 'type'=>'Coding', 'path'=>'MissingTeeth.tooth', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/teeth'}},
        'reason' => {'valid_codes'=>{'http://hl7.org/fhir/missingtoothreason'=>['e', 'c', 'u', 'o', 'e', 'c', 'u', 'o']}, 'type'=>'Coding', 'path'=>'MissingTeeth.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/missing-tooth-reason'}},
        'extractionDate' => {'type'=>'date', 'path'=>'MissingTeeth.extractionDate', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :tooth             # 1-1 Coding
      attr_accessor :reason            # 0-1 Coding
      attr_accessor :extractionDate    # 0-1 date
    end

    attr_accessor :id                             # 0-1 id
    attr_accessor :meta                           # 0-1 Meta
    attr_accessor :implicitRules                  # 0-1 uri
    attr_accessor :language                       # 0-1 code
    attr_accessor :text                           # 0-1 Narrative
    attr_accessor :contained                      # 0-* [ Resource ]
    attr_accessor :extension                      # 0-* [ Extension ]
    attr_accessor :modifierExtension              # 0-* [ Extension ]
    attr_accessor :identifier                     # 0-* [ Identifier ]
    attr_accessor :status                         # 1-1 code
    attr_accessor :type                           # 1-1 Coding
    attr_accessor :subType                        # 0-* [ Coding ]
    attr_accessor :ruleset                        # 0-1 Coding
    attr_accessor :originalRuleset                # 0-1 Coding
    attr_accessor :created                        # 0-1 dateTime
    attr_accessor :billablePeriod                 # 0-1 Period
    attr_accessor :insurerIdentifier              # 0-1 Identifier
    attr_accessor :insurerReference               # 0-1 Reference(Organization)
    attr_accessor :providerIdentifier             # 0-1 Identifier
    attr_accessor :providerReference              # 0-1 Reference(Practitioner)
    attr_accessor :organizationIdentifier         # 0-1 Identifier
    attr_accessor :organizationReference          # 0-1 Reference(Organization)
    attr_accessor :use                            # 0-1 code
    attr_accessor :priority                       # 0-1 Coding
    attr_accessor :fundsReserve                   # 0-1 Coding
    attr_accessor :entererIdentifier              # 0-1 Identifier
    attr_accessor :entererReference               # 0-1 Reference(Practitioner)
    attr_accessor :facilityIdentifier             # 0-1 Identifier
    attr_accessor :facilityReference              # 0-1 Reference(Location)
    attr_accessor :related                        # 0-* [ Claim::Related ]
    attr_accessor :prescriptionIdentifier         # 0-1 Identifier
    attr_accessor :prescriptionReference          # 0-1 Reference(MedicationOrder|VisionPrescription)
    attr_accessor :originalPrescriptionIdentifier # 0-1 Identifier
    attr_accessor :originalPrescriptionReference  # 0-1 Reference(MedicationOrder)
    attr_accessor :payee                          # 0-1 Claim::Payee
    attr_accessor :referralIdentifier             # 0-1 Identifier
    attr_accessor :referralReference              # 0-1 Reference(ReferralRequest)
    attr_accessor :information                    # 0-* [ Claim::Information ]
    attr_accessor :diagnosis                      # 0-* [ Claim::Diagnosis ]
    attr_accessor :procedure                      # 0-* [ Claim::Procedure ]
    attr_accessor :patientIdentifier              # 1-1 Identifier
    attr_accessor :patientReference               # 1-1 Reference(Patient)
    attr_accessor :coverage                       # 0-* [ Claim::Coverage ]
    attr_accessor :accident                       # 0-1 Claim::Accident
    attr_accessor :employmentImpacted             # 0-1 Period
    attr_accessor :hospitalization                # 0-1 Period
    attr_accessor :item                           # 0-* [ Claim::Item ]
    attr_accessor :total                          # 0-1 Money
    attr_accessor :missingTeeth                   # 0-* [ Claim::MissingTeeth ]

    def resourceType
      'Claim'
    end
  end
end