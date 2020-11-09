module FHIR
  module STU3
    class DataRequirement < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      SEARCH_PARAMS = 
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'DataRequirement.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'DataRequirement.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/data-types'=>['ActionDefinition', 'Address', 'Age', 'Annotation', 'Attachment', 'BackboneElement', 'CodeableConcept', 'Coding', 'ContactPoint', 'Count', 'DataRequirement', 'Distance', 'Duration', 'Element', 'ElementDefinition', 'Extension', 'HumanName', 'Identifier', 'Meta', 'ModuleMetadata', 'Money', 'Narrative', 'ParameterDefinition', 'Period', 'Quantity', 'Range', 'Ratio', 'Reference', 'SampledData', 'Signature', 'SimpleQuantity', 'Timing', 'TriggerDefinition', 'base64Binary', 'boolean', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'uuid', 'xhtml'], 'http://hl7.org/fhir/resource-types'=>['Account', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportRule', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticOrder', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingExcerpt', 'ImagingObjectSelection', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'ModuleDefinition', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Order', 'OrderResponse', 'OrderSet', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Protocol', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription'], 'http://hl7.org/fhir/abstract-types'=>['Type', 'Any']}, 'type'=>'code', 'path'=>'DataRequirement.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/all-types'}},
        'profile' => {'type'=>'Reference', 'path'=>'DataRequirement.profile', 'min'=>0, 'max'=>1},
        'mustSupport' => {'type'=>'string', 'path'=>'DataRequirement.mustSupport', 'min'=>0, 'max'=>Float::INFINITY},
        'codeFilter' => {'type'=>'DataRequirement::CodeFilter', 'path'=>'DataRequirement.codeFilter', 'min'=>0, 'max'=>Float::INFINITY},
        'dateFilter' => {'type'=>'DataRequirement::DateFilter', 'path'=>'DataRequirement.dateFilter', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class CodeFilter < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        MULTIPLE_TYPES = {
          'valueSet' => ['string', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'id', 'path'=>'CodeFilter.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'CodeFilter.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'path' => {'type'=>'string', 'path'=>'CodeFilter.path', 'min'=>1, 'max'=>1},
          'valueSetString' => {'type'=>'string', 'path'=>'CodeFilter.valueSet[x]', 'min'=>0, 'max'=>1},
          'valueSetReference' => {'type'=>'Reference', 'path'=>'CodeFilter.valueSet[x]', 'min'=>0, 'max'=>1},
          'valueCode' => {'type'=>'code', 'path'=>'CodeFilter.valueCode', 'min'=>0, 'max'=>Float::INFINITY},
          'valueCoding' => {'type'=>'Coding', 'path'=>'CodeFilter.valueCoding', 'min'=>0, 'max'=>Float::INFINITY},
          'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'CodeFilter.valueCodeableConcept', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                   # 0-1 id
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :path                 # 1-1 string
        attr_accessor :valueSetString       # 0-1 string
        attr_accessor :valueSetReference    # 0-1 Reference()
        attr_accessor :valueCode            # 0-* [ code ]
        attr_accessor :valueCoding          # 0-* [ Coding ]
        attr_accessor :valueCodeableConcept # 0-* [ CodeableConcept ]
      end

      class DateFilter < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        MULTIPLE_TYPES = {
          'value' => ['dateTime', 'Period']
        }
        METADATA = {
          'id' => {'type'=>'id', 'path'=>'DateFilter.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'DateFilter.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'path' => {'type'=>'string', 'path'=>'DateFilter.path', 'min'=>1, 'max'=>1},
          'valueDateTime' => {'type'=>'dateTime', 'path'=>'DateFilter.value[x]', 'min'=>0, 'max'=>1},
          'valuePeriod' => {'type'=>'Period', 'path'=>'DateFilter.value[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id            # 0-1 id
        attr_accessor :extension     # 0-* [ Extension ]
        attr_accessor :path          # 1-1 string
        attr_accessor :valueDateTime # 0-1 dateTime
        attr_accessor :valuePeriod   # 0-1 Period
      end

      attr_accessor :id          # 0-1 id
      attr_accessor :extension   # 0-* [ Extension ]
      attr_accessor :type        # 1-1 code
      attr_accessor :profile     # 0-1 Reference()
      attr_accessor :mustSupport # 0-* [ string ]
      attr_accessor :codeFilter  # 0-* [ DataRequirement::CodeFilter ]
      attr_accessor :dateFilter  # 0-* [ DataRequirement::DateFilter ]
    end
  end
end