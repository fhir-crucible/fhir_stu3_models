module FHIR
  class ClinicalImpression < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'effective' => ['dateTime', 'Period']
    }
    SEARCH_PARAMS = ["action", "assessor", "context", "date", "finding-code", "finding-ref", "investigation", "patient", "plan", "previous", "problem", "status", "subject"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ClinicalImpression.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ClinicalImpression.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ClinicalImpression.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ClinicalImpression.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'ClinicalImpression.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ClinicalImpression.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ClinicalImpression.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ClinicalImpression.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ClinicalImpression.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/clinical-impression-status'=>['draft', 'completed', 'entered-in-error', 'draft', 'completed', 'entered-in-error']}, 'type'=>'code', 'path'=>'ClinicalImpression.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/clinical-impression-status'}},
      'code' => {'type'=>'CodeableConcept', 'path'=>'ClinicalImpression.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'description' => {'type'=>'string', 'path'=>'ClinicalImpression.description', 'min'=>0, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'ClinicalImpression.subject', 'min'=>1, 'max'=>1},
      'assessor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'ClinicalImpression.assessor', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'ClinicalImpression.date', 'min'=>0, 'max'=>1},
      'effectiveDateTime' => {'type'=>'dateTime', 'path'=>'ClinicalImpression.effective[x]', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'ClinicalImpression.effective[x]', 'min'=>0, 'max'=>1},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'ClinicalImpression.context', 'min'=>0, 'max'=>1},
      'previous' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ClinicalImpression'], 'type'=>'Reference', 'path'=>'ClinicalImpression.previous', 'min'=>0, 'max'=>1},
      'problem' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/AllergyIntolerance'], 'type'=>'Reference', 'path'=>'ClinicalImpression.problem', 'min'=>0, 'max'=>Float::INFINITY},
      'investigations' => {'type'=>'ClinicalImpression::Investigations', 'path'=>'ClinicalImpression.investigations', 'min'=>0, 'max'=>Float::INFINITY},
      'protocol' => {'type'=>'uri', 'path'=>'ClinicalImpression.protocol', 'min'=>0, 'max'=>Float::INFINITY},
      'summary' => {'type'=>'string', 'path'=>'ClinicalImpression.summary', 'min'=>0, 'max'=>1},
      'finding' => {'type'=>'ClinicalImpression::Finding', 'path'=>'ClinicalImpression.finding', 'min'=>0, 'max'=>Float::INFINITY},
      'prognosisCodeableConcept' => {'valid_codes'=>{'http://snomed.info/sct'=>['60484009', '65872000', '67334001', '170968001', '170969009', '170970005']}, 'type'=>'CodeableConcept', 'path'=>'ClinicalImpression.prognosisCodeableConcept', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/clinicalimpression-prognosis'}},
      'prognosisReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/RiskAssessment'], 'type'=>'Reference', 'path'=>'ClinicalImpression.prognosisReference', 'min'=>0, 'max'=>Float::INFINITY},
      'plan' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/Appointment', 'http://hl7.org/fhir/StructureDefinition/CommunicationRequest', 'http://hl7.org/fhir/StructureDefinition/DeviceUseRequest', 'http://hl7.org/fhir/StructureDefinition/DiagnosticRequest', 'http://hl7.org/fhir/StructureDefinition/MedicationOrder', 'http://hl7.org/fhir/StructureDefinition/NutritionRequest', 'http://hl7.org/fhir/StructureDefinition/ProcedureRequest', 'http://hl7.org/fhir/StructureDefinition/ProcessRequest', 'http://hl7.org/fhir/StructureDefinition/ReferralRequest', 'http://hl7.org/fhir/StructureDefinition/SupplyRequest', 'http://hl7.org/fhir/StructureDefinition/VisionPrescription'], 'type'=>'Reference', 'path'=>'ClinicalImpression.plan', 'min'=>0, 'max'=>Float::INFINITY},
      'action' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ReferralRequest', 'http://hl7.org/fhir/StructureDefinition/ProcedureRequest', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/MedicationOrder', 'http://hl7.org/fhir/StructureDefinition/DiagnosticRequest', 'http://hl7.org/fhir/StructureDefinition/NutritionRequest', 'http://hl7.org/fhir/StructureDefinition/SupplyRequest', 'http://hl7.org/fhir/StructureDefinition/Appointment'], 'type'=>'Reference', 'path'=>'ClinicalImpression.action', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'ClinicalImpression.note', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Investigations < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Investigations.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Investigations.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Investigations.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'valid_codes'=>{'http://snomed.info/sct'=>['271336007', '160237006']}, 'type'=>'CodeableConcept', 'path'=>'Investigations.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/investigation-sets'}},
        'item' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse', 'http://hl7.org/fhir/StructureDefinition/FamilyMemberHistory', 'http://hl7.org/fhir/StructureDefinition/DiagnosticReport', 'http://hl7.org/fhir/StructureDefinition/RiskAssessment', 'http://hl7.org/fhir/StructureDefinition/ImagingStudy'], 'type'=>'Reference', 'path'=>'Investigations.item', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 1-1 CodeableConcept
      attr_accessor :item              # 0-* [ Reference(Observation|QuestionnaireResponse|FamilyMemberHistory|DiagnosticReport|RiskAssessment|ImagingStudy) ]
    end

    class Finding < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'item' => ['CodeableConcept', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Finding.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Finding.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Finding.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'itemCodeableConcept' => {'valid_codes'=>{'http://snomed.info/sct'=>[]}, 'type'=>'CodeableConcept', 'path'=>'Finding.item[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/condition-code'}},
        'itemReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'Finding.item[x]', 'min'=>1, 'max'=>1},
        'cause' => {'type'=>'string', 'path'=>'Finding.cause', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                  # 0-1 string
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :itemCodeableConcept # 1-1 CodeableConcept
      attr_accessor :itemReference       # 1-1 Reference(Condition|Observation)
      attr_accessor :cause               # 0-1 string
    end

    attr_accessor :id                       # 0-1 id
    attr_accessor :meta                     # 0-1 Meta
    attr_accessor :implicitRules            # 0-1 uri
    attr_accessor :language                 # 0-1 code
    attr_accessor :text                     # 0-1 Narrative
    attr_accessor :contained                # 0-* [ Resource ]
    attr_accessor :extension                # 0-* [ Extension ]
    attr_accessor :modifierExtension        # 0-* [ Extension ]
    attr_accessor :identifier               # 0-* [ Identifier ]
    attr_accessor :status                   # 1-1 code
    attr_accessor :code                     # 0-1 CodeableConcept
    attr_accessor :description              # 0-1 string
    attr_accessor :subject                  # 1-1 Reference(Patient|Group)
    attr_accessor :assessor                 # 0-1 Reference(Practitioner)
    attr_accessor :date                     # 0-1 dateTime
    attr_accessor :effectiveDateTime        # 0-1 dateTime
    attr_accessor :effectivePeriod          # 0-1 Period
    attr_accessor :context                  # 0-1 Reference(Encounter|EpisodeOfCare)
    attr_accessor :previous                 # 0-1 Reference(ClinicalImpression)
    attr_accessor :problem                  # 0-* [ Reference(Condition|AllergyIntolerance) ]
    attr_accessor :investigations           # 0-* [ ClinicalImpression::Investigations ]
    attr_accessor :protocol                 # 0-* [ uri ]
    attr_accessor :summary                  # 0-1 string
    attr_accessor :finding                  # 0-* [ ClinicalImpression::Finding ]
    attr_accessor :prognosisCodeableConcept # 0-* [ CodeableConcept ]
    attr_accessor :prognosisReference       # 0-* [ Reference(RiskAssessment) ]
    attr_accessor :plan                     # 0-* [ Reference(CarePlan|Appointment|CommunicationRequest|DeviceUseRequest|DiagnosticRequest|MedicationOrder|NutritionRequest|ProcedureRequest|ProcessRequest|ReferralRequest|SupplyRequest|VisionPrescription) ]
    attr_accessor :action                   # 0-* [ Reference(ReferralRequest|ProcedureRequest|Procedure|MedicationOrder|DiagnosticRequest|NutritionRequest|SupplyRequest|Appointment) ]
    attr_accessor :note                     # 0-* [ Annotation ]

    def resourceType
      'ClinicalImpression'
    end
  end
end