module FHIR
  class OperationDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["base", "code", "context", "date", "instance", "kind", "name", "paramprofile", "publisher", "status", "system", "type", "url", "version"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'OperationDefinition.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'OperationDefinition.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'OperationDefinition.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'OperationDefinition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'OperationDefinition.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'OperationDefinition.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'OperationDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'OperationDefinition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'OperationDefinition.url', 'min'=>0, 'max'=>1},
      'version' => {'type'=>'string', 'path'=>'OperationDefinition.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'OperationDefinition.name', 'min'=>1, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/conformance-resource-status'=>['draft', 'active', 'retired']}, 'type'=>'code', 'path'=>'OperationDefinition.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conformance-resource-status'}},
      'kind' => {'valid_codes'=>{'http://hl7.org/fhir/operation-kind'=>['operation', 'query']}, 'type'=>'code', 'path'=>'OperationDefinition.kind', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/operation-kind'}},
      'experimental' => {'type'=>'boolean', 'path'=>'OperationDefinition.experimental', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'OperationDefinition.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'OperationDefinition.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'OperationDefinition::Contact', 'path'=>'OperationDefinition.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'string', 'path'=>'OperationDefinition.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'CodeableConcept', 'path'=>'OperationDefinition.useContext', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/use-context'}},
      'requirements' => {'type'=>'string', 'path'=>'OperationDefinition.requirements', 'min'=>0, 'max'=>1},
      'idempotent' => {'type'=>'boolean', 'path'=>'OperationDefinition.idempotent', 'min'=>0, 'max'=>1},
      'code' => {'type'=>'code', 'path'=>'OperationDefinition.code', 'min'=>1, 'max'=>1},
      'comment' => {'type'=>'string', 'path'=>'OperationDefinition.comment', 'min'=>0, 'max'=>1},
      'base' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/OperationDefinition'], 'type'=>'Reference', 'path'=>'OperationDefinition.base', 'min'=>0, 'max'=>1},
      'system' => {'type'=>'boolean', 'path'=>'OperationDefinition.system', 'min'=>1, 'max'=>1},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/resource-types'=>['Account', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportRule', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticOrder', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingExcerpt', 'ImagingObjectSelection', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'ModuleDefinition', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Order', 'OrderResponse', 'OrderSet', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Protocol', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription']}, 'type'=>'code', 'path'=>'OperationDefinition.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/resource-types'}},
      'instance' => {'type'=>'boolean', 'path'=>'OperationDefinition.instance', 'min'=>1, 'max'=>1},
      'parameter' => {'type'=>'OperationDefinition::Parameter', 'path'=>'OperationDefinition.parameter', 'min'=>0, 'max'=>Float::INFINITY}
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

    class Parameter < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Parameter.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Parameter.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Parameter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'code', 'path'=>'Parameter.name', 'min'=>1, 'max'=>1},
        'use' => {'valid_codes'=>{'http://hl7.org/fhir/operation-parameter-use'=>['in', 'out']}, 'type'=>'code', 'path'=>'Parameter.use', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/operation-parameter-use'}},
        'min' => {'type'=>'integer', 'path'=>'Parameter.min', 'min'=>1, 'max'=>1},
        'max' => {'type'=>'string', 'path'=>'Parameter.max', 'min'=>1, 'max'=>1},
        'documentation' => {'type'=>'string', 'path'=>'Parameter.documentation', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/data-types'=>['ActionDefinition', 'Address', 'Age', 'Annotation', 'Attachment', 'BackboneElement', 'CodeableConcept', 'Coding', 'ContactPoint', 'Count', 'DataRequirement', 'Distance', 'Duration', 'Element', 'ElementDefinition', 'Extension', 'HumanName', 'Identifier', 'Meta', 'ModuleMetadata', 'Money', 'Narrative', 'ParameterDefinition', 'Period', 'Quantity', 'Range', 'Ratio', 'Reference', 'SampledData', 'Signature', 'SimpleQuantity', 'Timing', 'TriggerDefinition', 'base64Binary', 'boolean', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'uuid', 'xhtml'], 'http://hl7.org/fhir/resource-types'=>['Account', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportRule', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticOrder', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingExcerpt', 'ImagingObjectSelection', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'ModuleDefinition', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Order', 'OrderResponse', 'OrderSet', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Protocol', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription'], 'http://hl7.org/fhir/abstract-types'=>['Type', 'Any']}, 'type'=>'code', 'path'=>'Parameter.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/all-types'}},
        'searchType' => {'valid_codes'=>{'http://hl7.org/fhir/search-param-type'=>['number', 'date', 'string', 'token', 'reference', 'composite', 'quantity', 'uri']}, 'type'=>'code', 'path'=>'Parameter.searchType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/search-param-type'}},
        'profile' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'Parameter.profile', 'min'=>0, 'max'=>1},
        'binding' => {'type'=>'OperationDefinition::Parameter::Binding', 'path'=>'Parameter.binding', 'min'=>0, 'max'=>1},
        'part' => {'type'=>'OperationDefinition::Parameter', 'path'=>'Parameter.part', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Binding < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'valueSet' => ['uri', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Binding.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Binding.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Binding.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'strength' => {'valid_codes'=>{'http://hl7.org/fhir/binding-strength'=>['required', 'extensible', 'preferred', 'example']}, 'type'=>'code', 'path'=>'Binding.strength', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/binding-strength'}},
          'valueSetUri' => {'type'=>'uri', 'path'=>'Binding.valueSet[x]', 'min'=>1, 'max'=>1},
          'valueSetReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ValueSet'], 'type'=>'Reference', 'path'=>'Binding.valueSet[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :strength          # 1-1 code
        attr_accessor :valueSetUri       # 1-1 uri
        attr_accessor :valueSetReference # 1-1 Reference(ValueSet)
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 1-1 code
      attr_accessor :use               # 1-1 code
      attr_accessor :min               # 1-1 integer
      attr_accessor :max               # 1-1 string
      attr_accessor :documentation     # 0-1 string
      attr_accessor :type              # 0-1 code
      attr_accessor :searchType        # 0-1 code
      attr_accessor :profile           # 0-1 Reference(StructureDefinition)
      attr_accessor :binding           # 0-1 OperationDefinition::Parameter::Binding
      attr_accessor :part              # 0-* [ OperationDefinition::Parameter ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :url               # 0-1 uri
    attr_accessor :version           # 0-1 string
    attr_accessor :name              # 1-1 string
    attr_accessor :status            # 1-1 code
    attr_accessor :kind              # 1-1 code
    attr_accessor :experimental      # 0-1 boolean
    attr_accessor :date              # 0-1 dateTime
    attr_accessor :publisher         # 0-1 string
    attr_accessor :contact           # 0-* [ OperationDefinition::Contact ]
    attr_accessor :description       # 0-1 string
    attr_accessor :useContext        # 0-* [ CodeableConcept ]
    attr_accessor :requirements      # 0-1 string
    attr_accessor :idempotent        # 0-1 boolean
    attr_accessor :code              # 1-1 code
    attr_accessor :comment           # 0-1 string
    attr_accessor :base              # 0-1 Reference(OperationDefinition)
    attr_accessor :system            # 1-1 boolean
    attr_accessor :type              # 0-* [ code ]
    attr_accessor :instance          # 1-1 boolean
    attr_accessor :parameter         # 0-* [ OperationDefinition::Parameter ]

    def resourceType
      'OperationDefinition'
    end
  end
end