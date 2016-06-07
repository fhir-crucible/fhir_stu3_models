module FHIR
  class ModuleDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = []
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ModuleDefinition.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ModuleDefinition.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ModuleDefinition.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ModuleDefinition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'ModuleDefinition.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ModuleDefinition.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ModuleDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ModuleDefinition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ModuleDefinition.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'ModuleDefinition.version', 'min'=>0, 'max'=>1},
      'model' => {'type'=>'ModuleDefinition::Model', 'path'=>'ModuleDefinition.model', 'min'=>0, 'max'=>Float::INFINITY},
      'library' => {'type'=>'ModuleDefinition::Library', 'path'=>'ModuleDefinition.library', 'min'=>0, 'max'=>Float::INFINITY},
      'codeSystem' => {'type'=>'ModuleDefinition::Codesystem', 'path'=>'ModuleDefinition.codeSystem', 'min'=>0, 'max'=>Float::INFINITY},
      'valueSet' => {'type'=>'ModuleDefinition::Valueset', 'path'=>'ModuleDefinition.valueSet', 'min'=>0, 'max'=>Float::INFINITY},
      'parameter' => {'type'=>'ModuleDefinition::Parameter', 'path'=>'ModuleDefinition.parameter', 'min'=>0, 'max'=>Float::INFINITY},
      'data' => {'type'=>'ModuleDefinition::Data', 'path'=>'ModuleDefinition.data', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Model < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Model.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Model.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Model.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Model.name', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'string', 'path'=>'Model.identifier', 'min'=>1, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'Model.version', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 0-1 string
      attr_accessor :identifier        # 1-1 string
      attr_accessor :version           # 0-1 string
    end

    class Library < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'document' => ['Attachment', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Library.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Library.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Library.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Library.name', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'string', 'path'=>'Library.identifier', 'min'=>0, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'Library.version', 'min'=>0, 'max'=>1},
        'documentAttachment' => {'type'=>'Attachment', 'path'=>'Library.document[x]', 'min'=>0, 'max'=>1},
        'documentReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ModuleDefinition'], 'type'=>'Reference', 'path'=>'Library.document[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                 # 0-1 id
      attr_accessor :extension          # 0-* [ Extension ]
      attr_accessor :modifierExtension  # 0-* [ Extension ]
      attr_accessor :name               # 0-1 string
      attr_accessor :identifier         # 0-1 string
      attr_accessor :version            # 0-1 string
      attr_accessor :documentAttachment # 0-1 Attachment
      attr_accessor :documentReference  # 0-1 Reference(ModuleDefinition)
    end

    class Codesystem < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Codesystem.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Codesystem.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Codesystem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Codesystem.name', 'min'=>1, 'max'=>1},
        'identifier' => {'type'=>'string', 'path'=>'Codesystem.identifier', 'min'=>1, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'Codesystem.version', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 1-1 string
      attr_accessor :identifier        # 1-1 string
      attr_accessor :version           # 0-1 string
    end

    class Valueset < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Valueset.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Valueset.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Valueset.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Valueset.name', 'min'=>1, 'max'=>1},
        'identifier' => {'type'=>'string', 'path'=>'Valueset.identifier', 'min'=>1, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'Valueset.version', 'min'=>0, 'max'=>1},
        'codeSystem' => {'type'=>'string', 'path'=>'Valueset.codeSystem', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 1-1 string
      attr_accessor :identifier        # 1-1 string
      attr_accessor :version           # 0-1 string
      attr_accessor :codeSystem        # 0-* [ string ]
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
        'documentation' => {'type'=>'string', 'path'=>'Parameter.documentation', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/data-types'=>['ActionDefinition', 'Address', 'Age', 'Annotation', 'Attachment', 'BackboneElement', 'CodeableConcept', 'Coding', 'ContactPoint', 'Count', 'DataRequirement', 'Distance', 'Duration', 'Element', 'ElementDefinition', 'Extension', 'HumanName', 'Identifier', 'Meta', 'ModuleMetadata', 'Money', 'Narrative', 'ParameterDefinition', 'Period', 'Quantity', 'Range', 'Ratio', 'Reference', 'SampledData', 'Signature', 'SimpleQuantity', 'Timing', 'TriggerDefinition', 'base64Binary', 'boolean', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'uuid', 'xhtml'], 'http://hl7.org/fhir/resource-types'=>['Account', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportRule', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticOrder', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingExcerpt', 'ImagingObjectSelection', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'ModuleDefinition', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Order', 'OrderResponse', 'OrderSet', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Protocol', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription']}, 'type'=>'code', 'path'=>'Parameter.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/defined-types'}},
        'profile' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'Parameter.profile', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 1-1 code
      attr_accessor :use               # 1-1 code
      attr_accessor :documentation     # 0-1 string
      attr_accessor :type              # 1-1 code
      attr_accessor :profile           # 0-1 Reference(StructureDefinition)
    end

    class Data < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Data.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Data.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Data.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/data-types'=>['ActionDefinition', 'Address', 'Age', 'Annotation', 'Attachment', 'BackboneElement', 'CodeableConcept', 'Coding', 'ContactPoint', 'Count', 'DataRequirement', 'Distance', 'Duration', 'Element', 'ElementDefinition', 'Extension', 'HumanName', 'Identifier', 'Meta', 'ModuleMetadata', 'Money', 'Narrative', 'ParameterDefinition', 'Period', 'Quantity', 'Range', 'Ratio', 'Reference', 'SampledData', 'Signature', 'SimpleQuantity', 'Timing', 'TriggerDefinition', 'base64Binary', 'boolean', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'uuid', 'xhtml'], 'http://hl7.org/fhir/resource-types'=>['Account', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportRule', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticOrder', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingExcerpt', 'ImagingObjectSelection', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'ModuleDefinition', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Order', 'OrderResponse', 'OrderSet', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Protocol', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription']}, 'type'=>'code', 'path'=>'Data.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/defined-types'}},
        'profile' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'Data.profile', 'min'=>0, 'max'=>1},
        'mustSupport' => {'type'=>'string', 'path'=>'Data.mustSupport', 'min'=>0, 'max'=>Float::INFINITY},
        'codeFilter' => {'type'=>'ModuleDefinition::Data::Codefilter', 'path'=>'Data.codeFilter', 'min'=>0, 'max'=>Float::INFINITY},
        'dateFilter' => {'type'=>'ModuleDefinition::Data::Datefilter', 'path'=>'Data.dateFilter', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Codefilter < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'valueSet' => ['string', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Codefilter.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Codefilter.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Codefilter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'path' => {'type'=>'string', 'path'=>'Codefilter.path', 'min'=>1, 'max'=>1},
          'valueSetString' => {'type'=>'string', 'path'=>'Codefilter.valueSet[x]', 'min'=>0, 'max'=>1},
          'valueSetReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ValueSet'], 'type'=>'Reference', 'path'=>'Codefilter.valueSet[x]', 'min'=>0, 'max'=>1},
          'codeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Codefilter.codeableConcept', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :path              # 1-1 string
        attr_accessor :valueSetString    # 0-1 string
        attr_accessor :valueSetReference # 0-1 Reference(ValueSet)
        attr_accessor :codeableConcept   # 0-* [ CodeableConcept ]
      end

      class Datefilter < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['dateTime', 'Period']
        }
        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Datefilter.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Datefilter.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Datefilter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'path' => {'type'=>'string', 'path'=>'Datefilter.path', 'min'=>1, 'max'=>1},
          'valueDateTime' => {'type'=>'dateTime', 'path'=>'Datefilter.value[x]', 'min'=>0, 'max'=>1},
          'valuePeriod' => {'type'=>'Period', 'path'=>'Datefilter.value[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :path              # 1-1 string
        attr_accessor :valueDateTime     # 0-1 dateTime
        attr_accessor :valuePeriod       # 0-1 Period
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 code
      attr_accessor :profile           # 0-1 Reference(StructureDefinition)
      attr_accessor :mustSupport       # 0-* [ string ]
      attr_accessor :codeFilter        # 0-* [ ModuleDefinition::Data::Codefilter ]
      attr_accessor :dateFilter        # 0-* [ ModuleDefinition::Data::Datefilter ]
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
    attr_accessor :version           # 0-1 string
    attr_accessor :model             # 0-* [ ModuleDefinition::Model ]
    attr_accessor :library           # 0-* [ ModuleDefinition::Library ]
    attr_accessor :codeSystem        # 0-* [ ModuleDefinition::Codesystem ]
    attr_accessor :valueSet          # 0-* [ ModuleDefinition::Valueset ]
    attr_accessor :parameter         # 0-* [ ModuleDefinition::Parameter ]
    attr_accessor :data              # 0-* [ ModuleDefinition::Data ]

    def resourceType
      'ModuleDefinition'
    end
  end
end