module FHIR
  class Claim < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'target' => ['Identifier', 'Reference'],
      'provider' => ['Identifier', 'Reference'],
      'organization' => ['Identifier', 'Reference'],
      'enterer' => ['Identifier', 'Reference'],
      'facility' => ['Identifier', 'Reference'],
      'prescription' => ['Identifier', 'Reference'],
      'originalPrescription' => ['Identifier', 'Reference'],
      'referral' => ['Identifier', 'Reference'],
      'patient' => ['Identifier', 'Reference'],
      'accidentLocation' => ['Address', 'Reference']
    }
    SEARCH_PARAMS = ["created", "facilityidentifier", "facilityreference", "identifier", "organizationidentifier", "organizationreference", "patientidentifier", "patientreference", "priority", "provideridentifier", "providerreference", "targetidentifier", "targetreference", "use"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Claim.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Claim.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Claim.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Claim.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'Claim.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Claim.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Claim.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Claim.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/claim-type-link'=>['institutional', 'oral', 'pharmacy', 'professional', 'vision']}, 'type'=>'code', 'path'=>'Claim.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-type-link'}},
      'subType' => {'valid_codes'=>{'http://hl7.org/fhir/ex-claimsubtype'=>['ortho', 'emergency']}, 'type'=>'Coding', 'path'=>'Claim.subType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-subtype'}},
      'identifier' => {'type'=>'Identifier', 'path'=>'Claim.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'ruleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'Claim.ruleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'originalRuleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'Claim.originalRuleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'created' => {'type'=>'dateTime', 'path'=>'Claim.created', 'min'=>0, 'max'=>1},
      'billablePeriod' => {'type'=>'Period', 'path'=>'Claim.billablePeriod', 'min'=>0, 'max'=>1},
      'targetIdentifier' => {'type'=>'Identifier', 'path'=>'Claim.target[x]', 'min'=>0, 'max'=>1},
      'targetReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Claim.target[x]', 'min'=>0, 'max'=>1},
      'providerIdentifier' => {'type'=>'Identifier', 'path'=>'Claim.provider[x]', 'min'=>0, 'max'=>1},
      'providerReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Claim.provider[x]', 'min'=>0, 'max'=>1},
      'organizationIdentifier' => {'type'=>'Identifier', 'path'=>'Claim.organization[x]', 'min'=>0, 'max'=>1},
      'organizationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Claim.organization[x]', 'min'=>0, 'max'=>1},
      'use' => {'valid_codes'=>{'http://hl7.org/fhir/claim-use-link'=>['complete', 'proposed', 'exploratory', 'other']}, 'type'=>'code', 'path'=>'Claim.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-use-link'}},
      'priority' => {'valid_codes'=>{'http://hl7.org/fhir/processpriority'=>['stat', 'normal', 'deferred']}, 'type'=>'Coding', 'path'=>'Claim.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/process-priority'}},
      'fundsReserve' => {'valid_codes'=>{'http://hl7.org/fhir/fundsreserve'=>['patient', 'provider', 'none']}, 'type'=>'Coding', 'path'=>'Claim.fundsReserve', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/fundsreserve'}},
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
      'occurrenceCode' => {'valid_codes'=>{'http://hl7.org/fhir/ex-claimoccurrance'=>['1001', '1002']}, 'type'=>'Coding', 'path'=>'Claim.occurrenceCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/occurrence-codes'}},
      'occurenceSpanCode' => {'valid_codes'=>{'http://hl7.org/fhir/ex-claimoccurrancespan'=>['1001', '1002']}, 'type'=>'Coding', 'path'=>'Claim.occurenceSpanCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/occurrence-span-codes'}},
      'valueCode' => {'valid_codes'=>{'http://hl7.org/fhir/ex-claimvalue'=>['1001', '1002']}, 'type'=>'Coding', 'path'=>'Claim.valueCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/value-codes'}},
      'diagnosis' => {'type'=>'Claim::Diagnosis', 'path'=>'Claim.diagnosis', 'min'=>0, 'max'=>Float::INFINITY},
      'procedure' => {'type'=>'Claim::Procedure', 'path'=>'Claim.procedure', 'min'=>0, 'max'=>Float::INFINITY},
      'specialCondition' => {'valid_codes'=>{'http://hl7.org/fhir/fm-conditions'=>['123987']}, 'type'=>'Coding', 'path'=>'Claim.specialCondition', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-conditions'}},
      'patientIdentifier' => {'type'=>'Identifier', 'path'=>'Claim.patient[x]', 'min'=>1, 'max'=>1},
      'patientReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Claim.patient[x]', 'min'=>1, 'max'=>1},
      'coverage' => {'type'=>'Claim::Coverage', 'path'=>'Claim.coverage', 'min'=>0, 'max'=>Float::INFINITY},
      'accidentDate' => {'type'=>'date', 'path'=>'Claim.accidentDate', 'min'=>0, 'max'=>1},
      'accidentType' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActCode'=>['MVA', 'SCHOOL', 'SPT', 'WPA']}, 'type'=>'Coding', 'path'=>'Claim.accidentType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ActIncidentCode'}},
      'accidentLocationAddress' => {'type'=>'Address', 'path'=>'Claim.accidentLocation[x]', 'min'=>0, 'max'=>1},
      'accidentLocationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Claim.accidentLocation[x]', 'min'=>0, 'max'=>1},
      'interventionException' => {'valid_codes'=>{'http://hl7.org/fhir/intervention'=>['unknown', 'other']}, 'type'=>'Coding', 'path'=>'Claim.interventionException', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/intervention'}},
      'onset' => {'type'=>'Claim::Onset', 'path'=>'Claim.onset', 'min'=>0, 'max'=>Float::INFINITY},
      'employmentImpacted' => {'type'=>'Period', 'path'=>'Claim.employmentImpacted', 'min'=>0, 'max'=>1},
      'hospitalization' => {'type'=>'Period', 'path'=>'Claim.hospitalization', 'min'=>0, 'max'=>1},
      'item' => {'type'=>'Claim::Item', 'path'=>'Claim.item', 'min'=>0, 'max'=>Float::INFINITY},
      'total' => {'type'=>'Quantity', 'path'=>'Claim.total', 'min'=>0, 'max'=>1},
      'additionalMaterial' => {'valid_codes'=>{'http://hl7.org/fhir/additionalmaterials'=>['xray', 'image', 'email', 'model', 'document', 'other']}, 'type'=>'Coding', 'path'=>'Claim.additionalMaterial', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/additionalmaterials'}},
      'missingTeeth' => {'type'=>'Claim::Missingteeth', 'path'=>'Claim.missingTeeth', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Related < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'claim' => ['Identifier', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Related.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Related.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Related.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'claimIdentifier' => {'type'=>'Identifier', 'path'=>'Related.claim[x]', 'min'=>0, 'max'=>1},
        'claimReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Claim'], 'type'=>'Reference', 'path'=>'Related.claim[x]', 'min'=>0, 'max'=>1},
        'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/ex-relatedclaimrelationship'=>['prior', 'associated']}, 'type'=>'Coding', 'path'=>'Related.relationship', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/related-claim-relationship'}},
        'reference' => {'type'=>'Identifier', 'path'=>'Related.reference', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
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
        'id' => {'type'=>'id', 'path'=>'Payee.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Payee.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Payee.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/payeetype'=>['subscriber', 'provider', 'other']}, 'type'=>'Coding', 'path'=>'Payee.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/payeetype'}},
        'partyIdentifier' => {'type'=>'Identifier', 'path'=>'Payee.party[x]', 'min'=>0, 'max'=>1},
        'partyReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Payee.party[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 Coding
      attr_accessor :partyIdentifier   # 0-1 Identifier
      attr_accessor :partyReference    # 0-1 Reference(Practitioner|Organization|Patient|RelatedPerson)
    end

    class Diagnosis < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Diagnosis.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Diagnosis.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Diagnosis.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Diagnosis.sequence', 'min'=>1, 'max'=>1},
        'diagnosis' => {'type'=>'Coding', 'path'=>'Diagnosis.diagnosis', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/icd-10'}}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :sequence          # 1-1 positiveInt
      attr_accessor :diagnosis         # 1-1 Coding
    end

    class Procedure < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'procedure' => ['Coding', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Procedure.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Procedure.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Procedure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Procedure.sequence', 'min'=>1, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'Procedure.date', 'min'=>0, 'max'=>1},
        'procedureCoding' => {'valid_codes'=>{'http://hl7.org/fhir/sid/ex-icd-10-procedures'=>['123001', '123002', '123003']}, 'type'=>'Coding', 'path'=>'Procedure.procedure[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/icd-10-procedures'}},
        'procedureReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Procedure'], 'type'=>'Reference', 'path'=>'Procedure.procedure[x]', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                 # 0-1 id
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
        'id' => {'type'=>'id', 'path'=>'Coverage.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Coverage.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Coverage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Coverage.sequence', 'min'=>1, 'max'=>1},
        'focal' => {'type'=>'boolean', 'path'=>'Coverage.focal', 'min'=>1, 'max'=>1},
        'coverageIdentifier' => {'type'=>'Identifier', 'path'=>'Coverage.coverage[x]', 'min'=>1, 'max'=>1},
        'coverageReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage'], 'type'=>'Reference', 'path'=>'Coverage.coverage[x]', 'min'=>1, 'max'=>1},
        'businessArrangement' => {'type'=>'string', 'path'=>'Coverage.businessArrangement', 'min'=>0, 'max'=>1},
        'preAuthRef' => {'type'=>'string', 'path'=>'Coverage.preAuthRef', 'min'=>0, 'max'=>Float::INFINITY},
        'claimResponse' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ClaimResponse'], 'type'=>'Reference', 'path'=>'Coverage.claimResponse', 'min'=>0, 'max'=>1},
        'originalRuleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'Coverage.originalRuleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}}
      }

      attr_accessor :id                  # 0-1 id
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

    class Onset < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'time' => ['date', 'Period']
      }
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Onset.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Onset.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Onset.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'timeDate' => {'type'=>'date', 'path'=>'Onset.time[x]', 'min'=>0, 'max'=>1},
        'timePeriod' => {'type'=>'Period', 'path'=>'Onset.time[x]', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/ex-onsettype'=>['LXM', 'SYM', 'LMN']}, 'type'=>'Coding', 'path'=>'Onset.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-onsettype'}}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :timeDate          # 0-1 date
      attr_accessor :timePeriod        # 0-1 Period
      attr_accessor :type              # 0-1 Coding
    end

    class Item < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'provider' => ['Identifier', 'Reference'],
        'supervisor' => ['Identifier', 'Reference'],
        'serviced' => ['date', 'Period']
      }
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Item.sequence', 'min'=>1, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/claim-exception'=>['student', 'disabled']}, 'type'=>'Coding', 'path'=>'Item.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-itemtype'}},
        'providerIdentifier' => {'type'=>'Identifier', 'path'=>'Item.provider[x]', 'min'=>0, 'max'=>1},
        'providerReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Item.provider[x]', 'min'=>0, 'max'=>1},
        'supervisorIdentifier' => {'type'=>'Identifier', 'path'=>'Item.supervisor[x]', 'min'=>0, 'max'=>1},
        'supervisorReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Item.supervisor[x]', 'min'=>0, 'max'=>1},
        'providerQualification' => {'valid_codes'=>{'http://hl7.org/fhir/ex-providerqualification'=>['311405', '604215', '604210']}, 'type'=>'Coding', 'path'=>'Item.providerQualification', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/provider-qualification'}},
        'diagnosisLinkId' => {'type'=>'positiveInt', 'path'=>'Item.diagnosisLinkId', 'min'=>0, 'max'=>Float::INFINITY},
        'service' => {'valid_codes'=>{'http://hl7.org/fhir/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555']}, 'type'=>'Coding', 'path'=>'Item.service', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
        'serviceModifier' => {'valid_codes'=>{'http://hl7.org/fhir/ex-servicemodifier'=>['SR', 'AH']}, 'type'=>'Coding', 'path'=>'Item.serviceModifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-modifiers'}},
        'modifier' => {'valid_codes'=>{'http://hl7.org/fhir/modifiers'=>['A', 'B', 'C', 'E', 'X']}, 'type'=>'Coding', 'path'=>'Item.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
        'programCode' => {'valid_codes'=>{'http://hl7.org/fhir/ex-programcode'=>['AS', 'HD', 'AUSCR']}, 'type'=>'Coding', 'path'=>'Item.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-program-code'}},
        'servicedDate' => {'type'=>'date', 'path'=>'Item.serviced[x]', 'min'=>0, 'max'=>1},
        'servicedPeriod' => {'type'=>'Period', 'path'=>'Item.serviced[x]', 'min'=>0, 'max'=>1},
        'place' => {'valid_codes'=>{'http://hl7.org/fhir/ex-serviceplace'=>['emergency', 'clinic']}, 'type'=>'Coding', 'path'=>'Item.place', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-place'}},
        'quantity' => {'type'=>'Quantity', 'path'=>'Item.quantity', 'min'=>0, 'max'=>1},
        'unitPrice' => {'type'=>'Quantity', 'path'=>'Item.unitPrice', 'min'=>0, 'max'=>1},
        'factor' => {'type'=>'decimal', 'path'=>'Item.factor', 'min'=>0, 'max'=>1},
        'points' => {'type'=>'decimal', 'path'=>'Item.points', 'min'=>0, 'max'=>1},
        'net' => {'type'=>'Quantity', 'path'=>'Item.net', 'min'=>0, 'max'=>1},
        'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Item.udi', 'min'=>0, 'max'=>Float::INFINITY},
        'bodySite' => {'valid_codes'=>{'http://hl7.org/fhir/ex-tooth'=>['0', '1', '2', '3', '4', '5', '6', '7', '8', '11', '12', '13', '14', '15', '16', '17', '18', '21', '22', '23', '24', '25', '26', '27', '28', '31', '32', '33', '34', '35', '36', '37', '38', '41', '42', '43', '44', '45', '46', '47', '48']}, 'type'=>'Coding', 'path'=>'Item.bodySite', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/tooth'}},
        'subSite' => {'valid_codes'=>{'http://hl7.org/fhir/FDI-surface'=>['M', 'O', 'I', 'D', 'B', 'V', 'L', 'MO', 'DO', 'DI', 'MOD']}, 'type'=>'Coding', 'path'=>'Item.subSite', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/surface'}},
        'detail' => {'type'=>'Claim::Item::Detail', 'path'=>'Item.detail', 'min'=>0, 'max'=>Float::INFINITY},
        'prosthesis' => {'type'=>'Claim::Item::Prosthesis', 'path'=>'Item.prosthesis', 'min'=>0, 'max'=>1}
      }

      class Detail < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequence' => {'type'=>'positiveInt', 'path'=>'Detail.sequence', 'min'=>1, 'max'=>1},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/claim-exception'=>['student', 'disabled']}, 'type'=>'Coding', 'path'=>'Detail.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-itemtype'}},
          'service' => {'valid_codes'=>{'http://hl7.org/fhir/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555']}, 'type'=>'Coding', 'path'=>'Detail.service', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
          'programCode' => {'valid_codes'=>{'http://hl7.org/fhir/ex-programcode'=>['AS', 'HD', 'AUSCR']}, 'type'=>'Coding', 'path'=>'Detail.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-program-code'}},
          'quantity' => {'type'=>'Quantity', 'path'=>'Detail.quantity', 'min'=>0, 'max'=>1},
          'unitPrice' => {'type'=>'Quantity', 'path'=>'Detail.unitPrice', 'min'=>0, 'max'=>1},
          'factor' => {'type'=>'decimal', 'path'=>'Detail.factor', 'min'=>0, 'max'=>1},
          'points' => {'type'=>'decimal', 'path'=>'Detail.points', 'min'=>0, 'max'=>1},
          'net' => {'type'=>'Quantity', 'path'=>'Detail.net', 'min'=>0, 'max'=>1},
          'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Detail.udi', 'min'=>0, 'max'=>Float::INFINITY},
          'subDetail' => {'type'=>'Claim::Item::Detail::Subdetail', 'path'=>'Detail.subDetail', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Subdetail < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Subdetail.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Subdetail.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Subdetail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'sequence' => {'type'=>'positiveInt', 'path'=>'Subdetail.sequence', 'min'=>1, 'max'=>1},
            'type' => {'valid_codes'=>{'http://hl7.org/fhir/claim-exception'=>['student', 'disabled']}, 'type'=>'Coding', 'path'=>'Subdetail.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-itemtype'}},
            'service' => {'valid_codes'=>{'http://hl7.org/fhir/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555']}, 'type'=>'Coding', 'path'=>'Subdetail.service', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
            'programCode' => {'valid_codes'=>{'http://hl7.org/fhir/ex-programcode'=>['AS', 'HD', 'AUSCR']}, 'type'=>'Coding', 'path'=>'Subdetail.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-program-code'}},
            'quantity' => {'type'=>'Quantity', 'path'=>'Subdetail.quantity', 'min'=>0, 'max'=>1},
            'unitPrice' => {'type'=>'Quantity', 'path'=>'Subdetail.unitPrice', 'min'=>0, 'max'=>1},
            'factor' => {'type'=>'decimal', 'path'=>'Subdetail.factor', 'min'=>0, 'max'=>1},
            'points' => {'type'=>'decimal', 'path'=>'Subdetail.points', 'min'=>0, 'max'=>1},
            'net' => {'type'=>'Quantity', 'path'=>'Subdetail.net', 'min'=>0, 'max'=>1},
            'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Subdetail.udi', 'min'=>0, 'max'=>Float::INFINITY}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :sequence          # 1-1 positiveInt
          attr_accessor :type              # 1-1 Coding
          attr_accessor :service           # 1-1 Coding
          attr_accessor :programCode       # 0-* [ Coding ]
          attr_accessor :quantity          # 0-1 Quantity
          attr_accessor :unitPrice         # 0-1 Quantity
          attr_accessor :factor            # 0-1 decimal
          attr_accessor :points            # 0-1 decimal
          attr_accessor :net               # 0-1 Quantity
          attr_accessor :udi               # 0-* [ Reference(Device) ]
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :sequence          # 1-1 positiveInt
        attr_accessor :type              # 1-1 Coding
        attr_accessor :service           # 1-1 Coding
        attr_accessor :programCode       # 0-* [ Coding ]
        attr_accessor :quantity          # 0-1 Quantity
        attr_accessor :unitPrice         # 0-1 Quantity
        attr_accessor :factor            # 0-1 decimal
        attr_accessor :points            # 0-1 decimal
        attr_accessor :net               # 0-1 Quantity
        attr_accessor :udi               # 0-* [ Reference(Device) ]
        attr_accessor :subDetail         # 0-* [ Claim::Item::Detail::Subdetail ]
      end

      class Prosthesis < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Prosthesis.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Prosthesis.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Prosthesis.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'initial' => {'type'=>'boolean', 'path'=>'Prosthesis.initial', 'min'=>0, 'max'=>1},
          'priorDate' => {'type'=>'date', 'path'=>'Prosthesis.priorDate', 'min'=>0, 'max'=>1},
          'priorMaterial' => {'valid_codes'=>{'http://hl7.org/fhir/ex-oralprostho'=>['1', '2', '3', '4']}, 'type'=>'Coding', 'path'=>'Prosthesis.priorMaterial', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/oral-prosthodontic-material'}}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :initial           # 0-1 boolean
        attr_accessor :priorDate         # 0-1 date
        attr_accessor :priorMaterial     # 0-1 Coding
      end

      attr_accessor :id                    # 0-1 id
      attr_accessor :extension             # 0-* [ Extension ]
      attr_accessor :modifierExtension     # 0-* [ Extension ]
      attr_accessor :sequence              # 1-1 positiveInt
      attr_accessor :type                  # 1-1 Coding
      attr_accessor :providerIdentifier    # 0-1 Identifier
      attr_accessor :providerReference     # 0-1 Reference(Practitioner)
      attr_accessor :supervisorIdentifier  # 0-1 Identifier
      attr_accessor :supervisorReference   # 0-1 Reference(Practitioner)
      attr_accessor :providerQualification # 0-1 Coding
      attr_accessor :diagnosisLinkId       # 0-* [ positiveInt ]
      attr_accessor :service               # 1-1 Coding
      attr_accessor :serviceModifier       # 0-* [ Coding ]
      attr_accessor :modifier              # 0-* [ Coding ]
      attr_accessor :programCode           # 0-* [ Coding ]
      attr_accessor :servicedDate          # 0-1 date
      attr_accessor :servicedPeriod        # 0-1 Period
      attr_accessor :place                 # 0-1 Coding
      attr_accessor :quantity              # 0-1 Quantity
      attr_accessor :unitPrice             # 0-1 Quantity
      attr_accessor :factor                # 0-1 decimal
      attr_accessor :points                # 0-1 decimal
      attr_accessor :net                   # 0-1 Quantity
      attr_accessor :udi                   # 0-* [ Reference(Device) ]
      attr_accessor :bodySite              # 0-1 Coding
      attr_accessor :subSite               # 0-* [ Coding ]
      attr_accessor :detail                # 0-* [ Claim::Item::Detail ]
      attr_accessor :prosthesis            # 0-1 Claim::Item::Prosthesis
    end

    class Missingteeth < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Missingteeth.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Missingteeth.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Missingteeth.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'tooth' => {'valid_codes'=>{'http://hl7.org/fhir/ex-fdi'=>['11', '12', '13', '14', '15', '16', '17', '18', '21', '22', '23', '24', '25', '26', '27', '28', '31', '32', '33', '34', '35', '36', '37', '38', '41', '42', '43', '44', '45', '46', '47', '48']}, 'type'=>'Coding', 'path'=>'Missingteeth.tooth', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/teeth'}},
        'reason' => {'valid_codes'=>{'http://hl7.org/fhir/missingtoothreason'=>['E', 'C', 'U', 'O']}, 'type'=>'Coding', 'path'=>'Missingteeth.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/missing-tooth-reason'}},
        'extractionDate' => {'type'=>'date', 'path'=>'Missingteeth.extractionDate', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
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
    attr_accessor :type                           # 1-1 code
    attr_accessor :subType                        # 0-* [ Coding ]
    attr_accessor :identifier                     # 0-* [ Identifier ]
    attr_accessor :ruleset                        # 0-1 Coding
    attr_accessor :originalRuleset                # 0-1 Coding
    attr_accessor :created                        # 0-1 dateTime
    attr_accessor :billablePeriod                 # 0-1 Period
    attr_accessor :targetIdentifier               # 0-1 Identifier
    attr_accessor :targetReference                # 0-1 Reference(Organization)
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
    attr_accessor :occurrenceCode                 # 0-* [ Coding ]
    attr_accessor :occurenceSpanCode              # 0-* [ Coding ]
    attr_accessor :valueCode                      # 0-* [ Coding ]
    attr_accessor :diagnosis                      # 0-* [ Claim::Diagnosis ]
    attr_accessor :procedure                      # 0-* [ Claim::Procedure ]
    attr_accessor :specialCondition               # 0-* [ Coding ]
    attr_accessor :patientIdentifier              # 1-1 Identifier
    attr_accessor :patientReference               # 1-1 Reference(Patient)
    attr_accessor :coverage                       # 0-* [ Claim::Coverage ]
    attr_accessor :accidentDate                   # 0-1 date
    attr_accessor :accidentType                   # 0-1 Coding
    attr_accessor :accidentLocationAddress        # 0-1 Address
    attr_accessor :accidentLocationReference      # 0-1 Reference(Location)
    attr_accessor :interventionException          # 0-* [ Coding ]
    attr_accessor :onset                          # 0-* [ Claim::Onset ]
    attr_accessor :employmentImpacted             # 0-1 Period
    attr_accessor :hospitalization                # 0-1 Period
    attr_accessor :item                           # 0-* [ Claim::Item ]
    attr_accessor :total                          # 0-1 Quantity
    attr_accessor :additionalMaterial             # 0-* [ Coding ]
    attr_accessor :missingTeeth                   # 0-* [ Claim::Missingteeth ]

    def resourceType
      'Claim'
    end
  end
end