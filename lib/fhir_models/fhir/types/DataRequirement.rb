module FHIR
  class DataRequirement < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = 
    METADATA = {
      'id' => {'type'=>'string', 'path'=>'DataRequirement.id', 'min'=>0, 'max'=>1},
      'extension' => {'type'=>'Extension', 'path'=>'DataRequirement.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/data-types'=>['Address', 'Age', 'Annotation', 'Attachment', 'BackboneElement', 'CodeableConcept', 'Coding', 'ContactDetail', 'ContactPoint', 'Contributor', 'Count', 'DataRequirement', 'Distance', 'Dosage', 'Duration', 'Element', 'ElementDefinition', 'Extension', 'HumanName', 'Identifier', 'Meta', 'Money', 'Narrative', 'ParameterDefinition', 'Period', 'Quantity', 'Range', 'Ratio', 'Reference', 'RelatedArtifact', 'SampledData', 'Signature', 'SimpleQuantity', 'Timing', 'TriggerDefinition', 'UsageContext', 'base64Binary', 'boolean', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'uuid', 'xhtml', 'Address', 'Age', 'Annotation', 'Attachment', 'BackboneElement', 'CodeableConcept', 'Coding', 'ContactDetail', 'ContactPoint', 'Contributor', 'Count', 'DataRequirement', 'Distance', 'Dosage', 'Duration', 'Element', 'ElementDefinition', 'Extension', 'HumanName', 'Identifier', 'Meta', 'Money', 'Narrative', 'ParameterDefinition', 'Period', 'Quantity', 'Range', 'Ratio', 'Reference', 'RelatedArtifact', 'SampledData', 'Signature', 'SimpleQuantity', 'Timing', 'TriggerDefinition', 'UsageContext', 'base64Binary', 'boolean', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'uuid', 'xhtml'], 'http://hl7.org/fhir/resource-types'=>['Account', 'ActivityDefinition', 'AdverseEvent', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CapabilityStatement', 'CarePlan', 'CareTeam', 'ChargeItem', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Consent', 'Contract', 'Coverage', 'DataElement', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceRequest', 'DeviceUseStatement', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'GraphDefinition', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingManifest', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationRequest', 'MedicationStatement', 'MessageDefinition', 'MessageHeader', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'RequestGroup', 'ResearchStudy', 'ResearchSubject', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'ServiceDefinition', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestReport', 'TestScript', 'ValueSet', 'VisionPrescription', 'Account', 'ActivityDefinition', 'AdverseEvent', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CapabilityStatement', 'CarePlan', 'CareTeam', 'ChargeItem', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Consent', 'Contract', 'Coverage', 'DataElement', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceRequest', 'DeviceUseStatement', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'GraphDefinition', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingManifest', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationRequest', 'MedicationStatement', 'MessageDefinition', 'MessageHeader', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'RequestGroup', 'ResearchStudy', 'ResearchSubject', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'ServiceDefinition', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestReport', 'TestScript', 'ValueSet', 'VisionPrescription'], 'http://hl7.org/fhir/abstract-types'=>['Type', 'Any', 'Type', 'Any']}, 'type'=>'code', 'path'=>'DataRequirement.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/all-types'}},
      'profile' => {'type'=>'uri', 'path'=>'DataRequirement.profile', 'min'=>0, 'max'=>Float::INFINITY},
      'mustSupport' => {'type'=>'string', 'path'=>'DataRequirement.mustSupport', 'min'=>0, 'max'=>Float::INFINITY},
      'codeFilter' => {'type'=>'DataRequirement::CodeFilter', 'path'=>'DataRequirement.codeFilter', 'min'=>0, 'max'=>Float::INFINITY},
      'dateFilter' => {'type'=>'DataRequirement::DateFilter', 'path'=>'DataRequirement.dateFilter', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class CodeFilter < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'valueSet' => ['string', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'CodeFilter.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'CodeFilter.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'path' => {'type'=>'string', 'path'=>'CodeFilter.path', 'min'=>1, 'max'=>1},
        'valueSetString' => {'type'=>'string', 'path'=>'CodeFilter.valueSet[x]', 'min'=>0, 'max'=>1},
        'valueSetReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ValueSet'], 'type'=>'Reference', 'path'=>'CodeFilter.valueSet[x]', 'min'=>0, 'max'=>1},
        'valueCode' => {'type'=>'code', 'path'=>'CodeFilter.valueCode', 'min'=>0, 'max'=>Float::INFINITY},
        'valueCoding' => {'type'=>'Coding', 'path'=>'CodeFilter.valueCoding', 'min'=>0, 'max'=>Float::INFINITY},
        'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'CodeFilter.valueCodeableConcept', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                   # 0-1 string
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :path                 # 1-1 string
      attr_accessor :valueSetString       # 0-1 string
      attr_accessor :valueSetReference    # 0-1 Reference(ValueSet)
      attr_accessor :valueCode            # 0-* [ code ]
      attr_accessor :valueCoding          # 0-* [ Coding ]
      attr_accessor :valueCodeableConcept # 0-* [ CodeableConcept ]
    end

    class DateFilter < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'value' => ['dateTime', 'Period', 'Duration']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'DateFilter.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'DateFilter.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'path' => {'type'=>'string', 'path'=>'DateFilter.path', 'min'=>1, 'max'=>1},
        'valueDateTime' => {'type'=>'dateTime', 'path'=>'DateFilter.value[x]', 'min'=>0, 'max'=>1},
        'valuePeriod' => {'type'=>'Period', 'path'=>'DateFilter.value[x]', 'min'=>0, 'max'=>1},
        'valueDuration' => {'type'=>'Duration', 'path'=>'DateFilter.value[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id            # 0-1 string
      attr_accessor :extension     # 0-* [ Extension ]
      attr_accessor :path          # 1-1 string
      attr_accessor :valueDateTime # 0-1 dateTime
      attr_accessor :valuePeriod   # 0-1 Period
      attr_accessor :valueDuration # 0-1 Duration
    end

    attr_accessor :id          # 0-1 string
    attr_accessor :extension   # 0-* [ Extension ]
    attr_accessor :type        # 1-1 code
    attr_accessor :profile     # 0-* [ uri ]
    attr_accessor :mustSupport # 0-* [ string ]
    attr_accessor :codeFilter  # 0-* [ DataRequirement::CodeFilter ]
    attr_accessor :dateFilter  # 0-* [ DataRequirement::DateFilter ]
  end
end