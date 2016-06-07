module FHIR
  class CompartmentDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["code", "date", "name", "resource", "status", "url"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'CompartmentDefinition.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'CompartmentDefinition.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'CompartmentDefinition.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'CompartmentDefinition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'CompartmentDefinition.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'CompartmentDefinition.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'CompartmentDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'CompartmentDefinition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'CompartmentDefinition.url', 'min'=>1, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'CompartmentDefinition.name', 'min'=>1, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/conformance-resource-status'=>['draft', 'active', 'retired']}, 'type'=>'code', 'path'=>'CompartmentDefinition.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conformance-resource-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'CompartmentDefinition.experimental', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'CompartmentDefinition.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'CompartmentDefinition::Contact', 'path'=>'CompartmentDefinition.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'date' => {'type'=>'dateTime', 'path'=>'CompartmentDefinition.date', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'CompartmentDefinition.description', 'min'=>0, 'max'=>1},
      'requirements' => {'type'=>'string', 'path'=>'CompartmentDefinition.requirements', 'min'=>0, 'max'=>1},
      'code' => {'valid_codes'=>{'http://hl7.org/fhir/compartment-type'=>['Patient', 'Encounter', 'RelatedPerson', 'Practitioner', 'Device']}, 'type'=>'code', 'path'=>'CompartmentDefinition.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/compartment-type'}},
      'search' => {'type'=>'boolean', 'path'=>'CompartmentDefinition.search', 'min'=>1, 'max'=>1},
      'resource' => {'type'=>'CompartmentDefinition::Resource', 'path'=>'CompartmentDefinition.resource', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Contact < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Contact.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Contact.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Contact.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Contact.name', 'min'=>0, 'max'=>1},
        'telecom' => {'type'=>'ContactPoint', 'path'=>'Contact.telecom', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 0-1 string
      attr_accessor :telecom           # 0-* [ ContactPoint ]
    end

    class Resource < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Resource.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Resource.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Resource.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'valid_codes'=>{'http://hl7.org/fhir/resource-types'=>['Account', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportRule', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticOrder', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingExcerpt', 'ImagingObjectSelection', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'ModuleDefinition', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Order', 'OrderResponse', 'OrderSet', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Protocol', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription']}, 'type'=>'code', 'path'=>'Resource.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/resource-types'}},
        'param' => {'type'=>'string', 'path'=>'Resource.param', 'min'=>0, 'max'=>Float::INFINITY},
        'documentation' => {'type'=>'string', 'path'=>'Resource.documentation', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 1-1 code
      attr_accessor :param             # 0-* [ string ]
      attr_accessor :documentation     # 0-1 string
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :url               # 1-1 uri
    attr_accessor :name              # 1-1 string
    attr_accessor :status            # 0-1 code
    attr_accessor :experimental      # 0-1 boolean
    attr_accessor :publisher         # 0-1 string
    attr_accessor :contact           # 0-* [ CompartmentDefinition::Contact ]
    attr_accessor :date              # 0-1 dateTime
    attr_accessor :description       # 0-1 string
    attr_accessor :requirements      # 0-1 string
    attr_accessor :code              # 1-1 code
    attr_accessor :search            # 1-1 boolean
    attr_accessor :resource          # 0-* [ CompartmentDefinition::Resource ]

    def resourceType
      'CompartmentDefinition'
    end
  end
end