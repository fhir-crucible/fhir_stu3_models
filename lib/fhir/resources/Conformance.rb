module FHIR
  class Conformance < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["context", "date", "description", "event", "fhirversion", "format", "mode", "name", "publisher", "resource", "resourceprofile", "securityservice", "software", "status", "supported-profile", "url", "version"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Conformance.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Conformance.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Conformance.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Conformance.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'Conformance.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Conformance.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Conformance.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Conformance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'Conformance.url', 'min'=>0, 'max'=>1},
      'version' => {'type'=>'string', 'path'=>'Conformance.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'Conformance.name', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/conformance-resource-status'=>['draft', 'active', 'retired']}, 'type'=>'code', 'path'=>'Conformance.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conformance-resource-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'Conformance.experimental', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'Conformance.date', 'min'=>1, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'Conformance.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'Conformance::Contact', 'path'=>'Conformance.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'string', 'path'=>'Conformance.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'CodeableConcept', 'path'=>'Conformance.useContext', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/use-context'}},
      'requirements' => {'type'=>'string', 'path'=>'Conformance.requirements', 'min'=>0, 'max'=>1},
      'copyright' => {'type'=>'string', 'path'=>'Conformance.copyright', 'min'=>0, 'max'=>1},
      'kind' => {'valid_codes'=>{'http://hl7.org/fhir/conformance-statement-kind'=>['instance', 'capability', 'requirements']}, 'type'=>'code', 'path'=>'Conformance.kind', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conformance-statement-kind'}},
      'software' => {'type'=>'Conformance::Software', 'path'=>'Conformance.software', 'min'=>0, 'max'=>1},
      'implementation' => {'type'=>'Conformance::Implementation', 'path'=>'Conformance.implementation', 'min'=>0, 'max'=>1},
      'fhirVersion' => {'type'=>'id', 'path'=>'Conformance.fhirVersion', 'min'=>1, 'max'=>1},
      'acceptUnknown' => {'valid_codes'=>{'http://hl7.org/fhir/unknown-content-code'=>['no', 'extensions', 'elements', 'both']}, 'type'=>'code', 'path'=>'Conformance.acceptUnknown', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/unknown-content-code'}},
      'format' => {'type'=>'code', 'path'=>'Conformance.format', 'min'=>1, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://www.rfc-editor.org/bcp/bcp13.txt'}},
      'profile' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'Conformance.profile', 'min'=>0, 'max'=>Float::INFINITY},
      'rest' => {'type'=>'Conformance::Rest', 'path'=>'Conformance.rest', 'min'=>0, 'max'=>Float::INFINITY},
      'messaging' => {'type'=>'Conformance::Messaging', 'path'=>'Conformance.messaging', 'min'=>0, 'max'=>Float::INFINITY},
      'document' => {'type'=>'Conformance::Document', 'path'=>'Conformance.document', 'min'=>0, 'max'=>Float::INFINITY}
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

    class Software < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Software.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Software.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Software.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Software.name', 'min'=>1, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'Software.version', 'min'=>0, 'max'=>1},
        'releaseDate' => {'type'=>'dateTime', 'path'=>'Software.releaseDate', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 1-1 string
      attr_accessor :version           # 0-1 string
      attr_accessor :releaseDate       # 0-1 dateTime
    end

    class Implementation < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Implementation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Implementation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Implementation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'string', 'path'=>'Implementation.description', 'min'=>1, 'max'=>1},
        'url' => {'type'=>'uri', 'path'=>'Implementation.url', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :description       # 1-1 string
      attr_accessor :url               # 0-1 uri
    end

    class Rest < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Rest.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Rest.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Rest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'mode' => {'valid_codes'=>{'http://hl7.org/fhir/restful-conformance-mode'=>['client', 'server']}, 'type'=>'code', 'path'=>'Rest.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/restful-conformance-mode'}},
        'documentation' => {'type'=>'string', 'path'=>'Rest.documentation', 'min'=>0, 'max'=>1},
        'security' => {'type'=>'Conformance::Rest::Security', 'path'=>'Rest.security', 'min'=>0, 'max'=>1},
        'resource' => {'type'=>'Conformance::Rest::Resource', 'path'=>'Rest.resource', 'min'=>0, 'max'=>Float::INFINITY},
        'interaction' => {'type'=>'Conformance::Rest::Interaction', 'path'=>'Rest.interaction', 'min'=>0, 'max'=>Float::INFINITY},
        'transactionMode' => {'valid_codes'=>{'http://hl7.org/fhir/transaction-mode'=>['not-supported', 'batch', 'transaction', 'both']}, 'type'=>'code', 'path'=>'Rest.transactionMode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/transaction-mode'}},
        'searchParam' => {'type'=>'Conformance::Rest::Resource::Searchparam', 'path'=>'Rest.searchParam', 'min'=>0, 'max'=>Float::INFINITY},
        'operation' => {'type'=>'Conformance::Rest::Operation', 'path'=>'Rest.operation', 'min'=>0, 'max'=>Float::INFINITY},
        'compartment' => {'type'=>'uri', 'path'=>'Rest.compartment', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Security < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Security.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Security.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Security.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'cors' => {'type'=>'boolean', 'path'=>'Security.cors', 'min'=>0, 'max'=>1},
          'service' => {'valid_codes'=>{'http://hl7.org/fhir/restful-security-service'=>['OAuth', 'SMART-on-FHIR', 'NTLM', 'Basic', 'Kerberos', 'Certificates']}, 'type'=>'CodeableConcept', 'path'=>'Security.service', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/restful-security-service'}},
          'description' => {'type'=>'string', 'path'=>'Security.description', 'min'=>0, 'max'=>1},
          'certificate' => {'type'=>'Conformance::Rest::Security::Certificate', 'path'=>'Security.certificate', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Certificate < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Certificate.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Certificate.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Certificate.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'type' => {'type'=>'code', 'path'=>'Certificate.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://www.rfc-editor.org/bcp/bcp13.txt'}},
            'blob' => {'type'=>'base64Binary', 'path'=>'Certificate.blob', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :type              # 0-1 code
          attr_accessor :blob              # 0-1 base64Binary
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :cors              # 0-1 boolean
        attr_accessor :service           # 0-* [ CodeableConcept ]
        attr_accessor :description       # 0-1 string
        attr_accessor :certificate       # 0-* [ Conformance::Rest::Security::Certificate ]
      end

      class Resource < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Resource.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Resource.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Resource.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/resource-types'=>['Account', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportRule', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticOrder', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingExcerpt', 'ImagingObjectSelection', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'ModuleDefinition', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Order', 'OrderResponse', 'OrderSet', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Protocol', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription']}, 'type'=>'code', 'path'=>'Resource.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/resource-types'}},
          'profile' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'Resource.profile', 'min'=>0, 'max'=>1},
          'interaction' => {'type'=>'Conformance::Rest::Resource::Interaction', 'path'=>'Resource.interaction', 'min'=>1, 'max'=>Float::INFINITY},
          'versioning' => {'valid_codes'=>{'http://hl7.org/fhir/versioning-policy'=>['no-version', 'versioned', 'versioned-update']}, 'type'=>'code', 'path'=>'Resource.versioning', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/versioning-policy'}},
          'readHistory' => {'type'=>'boolean', 'path'=>'Resource.readHistory', 'min'=>0, 'max'=>1},
          'updateCreate' => {'type'=>'boolean', 'path'=>'Resource.updateCreate', 'min'=>0, 'max'=>1},
          'conditionalCreate' => {'type'=>'boolean', 'path'=>'Resource.conditionalCreate', 'min'=>0, 'max'=>1},
          'conditionalUpdate' => {'type'=>'boolean', 'path'=>'Resource.conditionalUpdate', 'min'=>0, 'max'=>1},
          'conditionalDelete' => {'valid_codes'=>{'http://hl7.org/fhir/conditional-delete-status'=>['not-supported', 'single', 'multiple']}, 'type'=>'code', 'path'=>'Resource.conditionalDelete', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conditional-delete-status'}},
          'searchInclude' => {'type'=>'string', 'path'=>'Resource.searchInclude', 'min'=>0, 'max'=>Float::INFINITY},
          'searchRevInclude' => {'type'=>'string', 'path'=>'Resource.searchRevInclude', 'min'=>0, 'max'=>Float::INFINITY},
          'searchParam' => {'type'=>'Conformance::Rest::Resource::Searchparam', 'path'=>'Resource.searchParam', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Interaction < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Interaction.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Interaction.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Interaction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'code' => {'valid_codes'=>{'http://hl7.org/fhir/restful-interaction'=>['read', 'vread', 'update', 'delete', 'history-instance', 'history-type', 'create', 'search-type']}, 'type'=>'code', 'path'=>'Interaction.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/type-restful-interaction'}},
            'documentation' => {'type'=>'string', 'path'=>'Interaction.documentation', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :code              # 1-1 code
          attr_accessor :documentation     # 0-1 string
        end

        class Searchparam < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Searchparam.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Searchparam.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Searchparam.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'name' => {'type'=>'string', 'path'=>'Searchparam.name', 'min'=>1, 'max'=>1},
            'definition' => {'type'=>'uri', 'path'=>'Searchparam.definition', 'min'=>0, 'max'=>1},
            'type' => {'valid_codes'=>{'http://hl7.org/fhir/search-param-type'=>['number', 'date', 'string', 'token', 'reference', 'composite', 'quantity', 'uri']}, 'type'=>'code', 'path'=>'Searchparam.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/search-param-type'}},
            'documentation' => {'type'=>'string', 'path'=>'Searchparam.documentation', 'min'=>0, 'max'=>1},
            'target' => {'valid_codes'=>{'http://hl7.org/fhir/resource-types'=>['Account', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportRule', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticOrder', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingExcerpt', 'ImagingObjectSelection', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'ModuleDefinition', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Order', 'OrderResponse', 'OrderSet', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Protocol', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription']}, 'type'=>'code', 'path'=>'Searchparam.target', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/resource-types'}},
            'modifier' => {'valid_codes'=>{'http://hl7.org/fhir/search-modifier-code'=>['missing', 'exact', 'contains', 'not', 'text', 'in', 'not-in', 'below', 'above', 'type']}, 'type'=>'code', 'path'=>'Searchparam.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/search-modifier-code'}},
            'chain' => {'type'=>'string', 'path'=>'Searchparam.chain', 'min'=>0, 'max'=>Float::INFINITY}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :name              # 1-1 string
          attr_accessor :definition        # 0-1 uri
          attr_accessor :type              # 1-1 code
          attr_accessor :documentation     # 0-1 string
          attr_accessor :target            # 0-* [ code ]
          attr_accessor :modifier          # 0-* [ code ]
          attr_accessor :chain             # 0-* [ string ]
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 code
        attr_accessor :profile           # 0-1 Reference(StructureDefinition)
        attr_accessor :interaction       # 1-* [ Conformance::Rest::Resource::Interaction ]
        attr_accessor :versioning        # 0-1 code
        attr_accessor :readHistory       # 0-1 boolean
        attr_accessor :updateCreate      # 0-1 boolean
        attr_accessor :conditionalCreate # 0-1 boolean
        attr_accessor :conditionalUpdate # 0-1 boolean
        attr_accessor :conditionalDelete # 0-1 code
        attr_accessor :searchInclude     # 0-* [ string ]
        attr_accessor :searchRevInclude  # 0-* [ string ]
        attr_accessor :searchParam       # 0-* [ Conformance::Rest::Resource::Searchparam ]
      end

      class Interaction < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Interaction.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Interaction.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Interaction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'valid_codes'=>{'http://hl7.org/fhir/restful-interaction'=>['transaction', 'search-system', 'history-system']}, 'type'=>'code', 'path'=>'Interaction.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/system-restful-interaction'}},
          'documentation' => {'type'=>'string', 'path'=>'Interaction.documentation', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :code              # 1-1 code
        attr_accessor :documentation     # 0-1 string
      end

      class Operation < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Operation.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Operation.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Operation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'Operation.name', 'min'=>1, 'max'=>1},
          'definition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/OperationDefinition'], 'type'=>'Reference', 'path'=>'Operation.definition', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 1-1 string
        attr_accessor :definition        # 1-1 Reference(OperationDefinition)
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :mode              # 1-1 code
      attr_accessor :documentation     # 0-1 string
      attr_accessor :security          # 0-1 Conformance::Rest::Security
      attr_accessor :resource          # 0-* [ Conformance::Rest::Resource ]
      attr_accessor :interaction       # 0-* [ Conformance::Rest::Interaction ]
      attr_accessor :transactionMode   # 0-1 code
      attr_accessor :searchParam       # 0-* [ Conformance::Rest::Resource::Searchparam ]
      attr_accessor :operation         # 0-* [ Conformance::Rest::Operation ]
      attr_accessor :compartment       # 0-* [ uri ]
    end

    class Messaging < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Messaging.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Messaging.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Messaging.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'endpoint' => {'type'=>'Conformance::Messaging::Endpoint', 'path'=>'Messaging.endpoint', 'min'=>0, 'max'=>Float::INFINITY},
        'reliableCache' => {'type'=>'unsignedInt', 'path'=>'Messaging.reliableCache', 'min'=>0, 'max'=>1},
        'documentation' => {'type'=>'string', 'path'=>'Messaging.documentation', 'min'=>0, 'max'=>1},
        'event' => {'type'=>'Conformance::Messaging::Event', 'path'=>'Messaging.event', 'min'=>1, 'max'=>Float::INFINITY}
      }

      class Endpoint < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Endpoint.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Endpoint.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Endpoint.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'protocol' => {'valid_codes'=>{'http://hl7.org/fhir/message-transport'=>['http', 'ftp', 'mllp']}, 'type'=>'Coding', 'path'=>'Endpoint.protocol', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/message-transport'}},
          'address' => {'type'=>'uri', 'path'=>'Endpoint.address', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :protocol          # 1-1 Coding
        attr_accessor :address           # 1-1 uri
      end

      class Event < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Event.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Event.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Event.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'valid_codes'=>{'http://hl7.org/fhir/message-events'=>['CodeSystem-expand', 'MedicationAdministration-Complete', 'MedicationAdministration-Nullification', 'MedicationAdministration-Recording', 'MedicationAdministration-Update', 'admin-notify', 'diagnosticreport-provide', 'observation-provide', 'patient-link', 'patient-unlink', 'valueset-expand']}, 'type'=>'Coding', 'path'=>'Event.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/message-events'}},
          'category' => {'valid_codes'=>{'http://hl7.org/fhir/message-significance-category'=>['Consequence', 'Currency', 'Notification']}, 'type'=>'code', 'path'=>'Event.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/message-significance-category'}},
          'mode' => {'valid_codes'=>{'http://hl7.org/fhir/message-conformance-event-mode'=>['sender', 'receiver']}, 'type'=>'code', 'path'=>'Event.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/message-conformance-event-mode'}},
          'focus' => {'valid_codes'=>{'http://hl7.org/fhir/resource-types'=>['Account', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportRule', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticOrder', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingExcerpt', 'ImagingObjectSelection', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'ModuleDefinition', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Order', 'OrderResponse', 'OrderSet', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Protocol', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription']}, 'type'=>'code', 'path'=>'Event.focus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/resource-types'}},
          'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'Event.request', 'min'=>1, 'max'=>1},
          'response' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'Event.response', 'min'=>1, 'max'=>1},
          'documentation' => {'type'=>'string', 'path'=>'Event.documentation', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :code              # 1-1 Coding
        attr_accessor :category          # 0-1 code
        attr_accessor :mode              # 1-1 code
        attr_accessor :focus             # 1-1 code
        attr_accessor :request           # 1-1 Reference(StructureDefinition)
        attr_accessor :response          # 1-1 Reference(StructureDefinition)
        attr_accessor :documentation     # 0-1 string
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :endpoint          # 0-* [ Conformance::Messaging::Endpoint ]
      attr_accessor :reliableCache     # 0-1 unsignedInt
      attr_accessor :documentation     # 0-1 string
      attr_accessor :event             # 1-* [ Conformance::Messaging::Event ]
    end

    class Document < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Document.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Document.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Document.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'mode' => {'valid_codes'=>{'http://hl7.org/fhir/document-mode'=>['producer', 'consumer']}, 'type'=>'code', 'path'=>'Document.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/document-mode'}},
        'documentation' => {'type'=>'string', 'path'=>'Document.documentation', 'min'=>0, 'max'=>1},
        'profile' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'Document.profile', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :mode              # 1-1 code
      attr_accessor :documentation     # 0-1 string
      attr_accessor :profile           # 1-1 Reference(StructureDefinition)
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
    attr_accessor :name              # 0-1 string
    attr_accessor :status            # 1-1 code
    attr_accessor :experimental      # 0-1 boolean
    attr_accessor :date              # 1-1 dateTime
    attr_accessor :publisher         # 0-1 string
    attr_accessor :contact           # 0-* [ Conformance::Contact ]
    attr_accessor :description       # 0-1 string
    attr_accessor :useContext        # 0-* [ CodeableConcept ]
    attr_accessor :requirements      # 0-1 string
    attr_accessor :copyright         # 0-1 string
    attr_accessor :kind              # 1-1 code
    attr_accessor :software          # 0-1 Conformance::Software
    attr_accessor :implementation    # 0-1 Conformance::Implementation
    attr_accessor :fhirVersion       # 1-1 id
    attr_accessor :acceptUnknown     # 1-1 code
    attr_accessor :format            # 1-* [ code ]
    attr_accessor :profile           # 0-* [ Reference(StructureDefinition) ]
    attr_accessor :rest              # 0-* [ Conformance::Rest ]
    attr_accessor :messaging         # 0-* [ Conformance::Messaging ]
    attr_accessor :document          # 0-* [ Conformance::Document ]

    def resourceType
      'Conformance'
    end
  end
end