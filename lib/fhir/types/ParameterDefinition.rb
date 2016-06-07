module FHIR
  class ParameterDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = []
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ParameterDefinition.id', 'min'=>0, 'max'=>1},
      'extension' => {'type'=>'Extension', 'path'=>'ParameterDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'name' => {'type'=>'code', 'path'=>'ParameterDefinition.name', 'min'=>0, 'max'=>1},
      'use' => {'valid_codes'=>{'http://hl7.org/fhir/operation-parameter-use'=>['in', 'out']}, 'type'=>'code', 'path'=>'ParameterDefinition.use', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/operation-parameter-use'}},
      'min' => {'type'=>'integer', 'path'=>'ParameterDefinition.min', 'min'=>0, 'max'=>1},
      'max' => {'type'=>'string', 'path'=>'ParameterDefinition.max', 'min'=>0, 'max'=>1},
      'documentation' => {'type'=>'string', 'path'=>'ParameterDefinition.documentation', 'min'=>0, 'max'=>1},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/data-types'=>['ActionDefinition', 'Address', 'Age', 'Annotation', 'Attachment', 'BackboneElement', 'CodeableConcept', 'Coding', 'ContactPoint', 'Count', 'DataRequirement', 'Distance', 'Duration', 'Element', 'ElementDefinition', 'Extension', 'HumanName', 'Identifier', 'Meta', 'ModuleMetadata', 'Money', 'Narrative', 'ParameterDefinition', 'Period', 'Quantity', 'Range', 'Ratio', 'Reference', 'SampledData', 'Signature', 'SimpleQuantity', 'Timing', 'TriggerDefinition', 'base64Binary', 'boolean', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'uuid', 'xhtml'], 'http://hl7.org/fhir/resource-types'=>['Account', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportRule', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticOrder', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingExcerpt', 'ImagingObjectSelection', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'ModuleDefinition', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Order', 'OrderResponse', 'OrderSet', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Protocol', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription'], 'http://hl7.org/fhir/abstract-types'=>['Type', 'Any']}, 'type'=>'code', 'path'=>'ParameterDefinition.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/all-types'}},
      'profile' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'ParameterDefinition.profile', 'min'=>0, 'max'=>1}
    }

    attr_accessor :id            # 0-1 id
    attr_accessor :extension     # 0-* [ Extension ]
    attr_accessor :name          # 0-1 code
    attr_accessor :use           # 1-1 code
    attr_accessor :min           # 0-1 integer
    attr_accessor :max           # 0-1 string
    attr_accessor :documentation # 0-1 string
    attr_accessor :type          # 1-1 code
    attr_accessor :profile       # 0-1 Reference(StructureDefinition)
  end
end