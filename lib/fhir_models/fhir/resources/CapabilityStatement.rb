module FHIR
  class CapabilityStatement < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['date', 'description', 'event', 'fhirversion', 'format', 'guide', 'jurisdiction', 'mode', 'name', 'publisher', 'resource', 'resource-profile', 'security-service', 'software', 'status', 'supported-profile', 'title', 'url', 'version']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'CapabilityStatement.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'CapabilityStatement.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'CapabilityStatement.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'CapabilityStatement.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'CapabilityStatement.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'CapabilityStatement.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'CapabilityStatement.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'CapabilityStatement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'CapabilityStatement.url', 'min'=>0, 'max'=>1},
      'version' => {'type'=>'string', 'path'=>'CapabilityStatement.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'CapabilityStatement.name', 'min'=>0, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'CapabilityStatement.title', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown', 'draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'CapabilityStatement.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'CapabilityStatement.experimental', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'CapabilityStatement.date', 'min'=>1, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'CapabilityStatement.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactDetail', 'path'=>'CapabilityStatement.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'markdown', 'path'=>'CapabilityStatement.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'UsageContext', 'path'=>'CapabilityStatement.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AN', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BU', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CS', 'CT', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DD', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DY', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FQ', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'HV', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'JT', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MI', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NH', 'NI', 'NL', 'NO', 'NP', 'NQ', 'NR', 'NT', 'NU', 'NZ', 'OM', 'PA', 'PC', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PU', 'PW', 'PY', 'PZ', 'QA', 'RE', 'RH', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SU', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TP', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VD', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WK', 'WS', 'YD', 'YE', 'YT', 'YU', 'ZA', 'ZM', 'ZR', 'ZW'], 'http://unstats.un.org/unsd/methods/m49/m49.htm'=>['001', '002', '014', '017', '015', '018', '011', '019', '419', '029', '013', '005', '021', '142', '143', '030', '034', '035', '145', '150', '151', '154', '039', '155', '009', '053', '054', '057', '061'], 'https://www.usps.com/'=>['AK', 'AL', 'AR', 'AS', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'FM', 'GA', 'GU', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MH', 'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'PW', 'RI', 'SC', 'SD', 'TN', 'TX', 'UM', 'UT', 'VA', 'VI', 'VT', 'WA', 'WI', 'WV', 'WY'], nil=>[]}, 'type'=>'CodeableConcept', 'path'=>'CapabilityStatement.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
      'purpose' => {'type'=>'markdown', 'path'=>'CapabilityStatement.purpose', 'min'=>0, 'max'=>1},
      'copyright' => {'type'=>'markdown', 'path'=>'CapabilityStatement.copyright', 'min'=>0, 'max'=>1},
      'kind' => {'valid_codes'=>{'http://hl7.org/fhir/capability-statement-kind'=>['instance', 'capability', 'requirements', 'instance', 'capability', 'requirements']}, 'type'=>'code', 'path'=>'CapabilityStatement.kind', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/capability-statement-kind'}},
      'instantiates' => {'type'=>'uri', 'path'=>'CapabilityStatement.instantiates', 'min'=>0, 'max'=>Float::INFINITY},
      'software' => {'type'=>'CapabilityStatement::Software', 'path'=>'CapabilityStatement.software', 'min'=>0, 'max'=>1},
      'implementation' => {'type'=>'CapabilityStatement::Implementation', 'path'=>'CapabilityStatement.implementation', 'min'=>0, 'max'=>1},
      'fhirVersion' => {'type'=>'id', 'path'=>'CapabilityStatement.fhirVersion', 'min'=>1, 'max'=>1},
      'acceptUnknown' => {'valid_codes'=>{'http://hl7.org/fhir/unknown-content-code'=>['no', 'extensions', 'elements', 'both', 'no', 'extensions', 'elements', 'both']}, 'type'=>'code', 'path'=>'CapabilityStatement.acceptUnknown', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/unknown-content-code'}},
      'format' => {'type'=>'code', 'path'=>'CapabilityStatement.format', 'min'=>1, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://www.rfc-editor.org/bcp/bcp13.txt'}},
      'patchFormat' => {'type'=>'code', 'path'=>'CapabilityStatement.patchFormat', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://www.rfc-editor.org/bcp/bcp13.txt'}},
      'implementationGuide' => {'type'=>'uri', 'path'=>'CapabilityStatement.implementationGuide', 'min'=>0, 'max'=>Float::INFINITY},
      'profile' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'CapabilityStatement.profile', 'min'=>0, 'max'=>Float::INFINITY},
      'rest' => {'type'=>'CapabilityStatement::Rest', 'path'=>'CapabilityStatement.rest', 'min'=>0, 'max'=>Float::INFINITY},
      'messaging' => {'type'=>'CapabilityStatement::Messaging', 'path'=>'CapabilityStatement.messaging', 'min'=>0, 'max'=>Float::INFINITY},
      'document' => {'type'=>'CapabilityStatement::Document', 'path'=>'CapabilityStatement.document', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Software < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Software.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Software.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Software.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Software.name', 'min'=>1, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'Software.version', 'min'=>0, 'max'=>1},
        'releaseDate' => {'type'=>'dateTime', 'path'=>'Software.releaseDate', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
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
        'id' => {'type'=>'string', 'path'=>'Implementation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Implementation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Implementation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'string', 'path'=>'Implementation.description', 'min'=>1, 'max'=>1},
        'url' => {'type'=>'uri', 'path'=>'Implementation.url', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
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
        'id' => {'type'=>'string', 'path'=>'Rest.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Rest.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Rest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'mode' => {'valid_codes'=>{'http://hl7.org/fhir/restful-capability-mode'=>['client', 'server', 'client', 'server']}, 'type'=>'code', 'path'=>'Rest.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/restful-capability-mode'}},
        'documentation' => {'type'=>'string', 'path'=>'Rest.documentation', 'min'=>0, 'max'=>1},
        'security' => {'type'=>'CapabilityStatement::Rest::Security', 'path'=>'Rest.security', 'min'=>0, 'max'=>1},
        'resource' => {'type'=>'CapabilityStatement::Rest::Resource', 'path'=>'Rest.resource', 'min'=>0, 'max'=>Float::INFINITY},
        'interaction' => {'type'=>'CapabilityStatement::Rest::Interaction', 'path'=>'Rest.interaction', 'min'=>0, 'max'=>Float::INFINITY},
        'searchParam' => {'type'=>'CapabilityStatement::Rest::Resource::SearchParam', 'path'=>'Rest.searchParam', 'min'=>0, 'max'=>Float::INFINITY},
        'operation' => {'type'=>'CapabilityStatement::Rest::Operation', 'path'=>'Rest.operation', 'min'=>0, 'max'=>Float::INFINITY},
        'compartment' => {'type'=>'uri', 'path'=>'Rest.compartment', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Security < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Security.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Security.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Security.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'cors' => {'type'=>'boolean', 'path'=>'Security.cors', 'min'=>0, 'max'=>1},
          'service' => {'valid_codes'=>{'http://hl7.org/fhir/restful-security-service'=>['OAuth', 'SMART-on-FHIR', 'NTLM', 'Basic', 'Kerberos', 'Certificates', 'OAuth', 'SMART-on-FHIR', 'NTLM', 'Basic', 'Kerberos', 'Certificates']}, 'type'=>'CodeableConcept', 'path'=>'Security.service', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/restful-security-service'}},
          'description' => {'type'=>'string', 'path'=>'Security.description', 'min'=>0, 'max'=>1},
          'certificate' => {'type'=>'CapabilityStatement::Rest::Security::Certificate', 'path'=>'Security.certificate', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Certificate < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Certificate.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Certificate.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Certificate.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'type' => {'type'=>'code', 'path'=>'Certificate.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://www.rfc-editor.org/bcp/bcp13.txt'}},
            'blob' => {'type'=>'base64Binary', 'path'=>'Certificate.blob', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :type              # 0-1 code
          attr_accessor :blob              # 0-1 base64Binary
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :cors              # 0-1 boolean
        attr_accessor :service           # 0-* [ CodeableConcept ]
        attr_accessor :description       # 0-1 string
        attr_accessor :certificate       # 0-* [ CapabilityStatement::Rest::Security::Certificate ]
      end

      class Resource < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Resource.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Resource.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Resource.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/resource-types'=>['Account', 'ActivityDefinition', 'AdverseEvent', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CapabilityStatement', 'CarePlan', 'CareTeam', 'ChargeItem', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Consent', 'Contract', 'Coverage', 'DataElement', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceRequest', 'DeviceUseStatement', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'GraphDefinition', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingManifest', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationRequest', 'MedicationStatement', 'MessageDefinition', 'MessageHeader', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'RequestGroup', 'ResearchStudy', 'ResearchSubject', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'ServiceDefinition', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestReport', 'TestScript', 'ValueSet', 'VisionPrescription', 'Account', 'ActivityDefinition', 'AdverseEvent', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CapabilityStatement', 'CarePlan', 'CareTeam', 'ChargeItem', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Consent', 'Contract', 'Coverage', 'DataElement', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceRequest', 'DeviceUseStatement', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'GraphDefinition', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingManifest', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationRequest', 'MedicationStatement', 'MessageDefinition', 'MessageHeader', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'RequestGroup', 'ResearchStudy', 'ResearchSubject', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'ServiceDefinition', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestReport', 'TestScript', 'ValueSet', 'VisionPrescription']}, 'type'=>'code', 'path'=>'Resource.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/resource-types'}},
          'profile' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'Resource.profile', 'min'=>0, 'max'=>1},
          'documentation' => {'type'=>'markdown', 'path'=>'Resource.documentation', 'min'=>0, 'max'=>1},
          'interaction' => {'type'=>'CapabilityStatement::Rest::Resource::Interaction', 'path'=>'Resource.interaction', 'min'=>1, 'max'=>Float::INFINITY},
          'versioning' => {'valid_codes'=>{'http://hl7.org/fhir/versioning-policy'=>['no-version', 'versioned', 'versioned-update', 'no-version', 'versioned', 'versioned-update']}, 'type'=>'code', 'path'=>'Resource.versioning', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/versioning-policy'}},
          'readHistory' => {'type'=>'boolean', 'path'=>'Resource.readHistory', 'min'=>0, 'max'=>1},
          'updateCreate' => {'type'=>'boolean', 'path'=>'Resource.updateCreate', 'min'=>0, 'max'=>1},
          'conditionalCreate' => {'type'=>'boolean', 'path'=>'Resource.conditionalCreate', 'min'=>0, 'max'=>1},
          'conditionalRead' => {'valid_codes'=>{'http://hl7.org/fhir/conditional-read-status'=>['not-supported', 'modified-since', 'not-match', 'full-support', 'not-supported', 'modified-since', 'not-match', 'full-support']}, 'type'=>'code', 'path'=>'Resource.conditionalRead', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conditional-read-status'}},
          'conditionalUpdate' => {'type'=>'boolean', 'path'=>'Resource.conditionalUpdate', 'min'=>0, 'max'=>1},
          'conditionalDelete' => {'valid_codes'=>{'http://hl7.org/fhir/conditional-delete-status'=>['not-supported', 'single', 'multiple', 'not-supported', 'single', 'multiple']}, 'type'=>'code', 'path'=>'Resource.conditionalDelete', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conditional-delete-status'}},
          'referencePolicy' => {'valid_codes'=>{'http://hl7.org/fhir/reference-handling-policy'=>['literal', 'logical', 'resolves', 'enforced', 'local', 'literal', 'logical', 'resolves', 'enforced', 'local']}, 'type'=>'code', 'path'=>'Resource.referencePolicy', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/reference-handling-policy'}},
          'searchInclude' => {'type'=>'string', 'path'=>'Resource.searchInclude', 'min'=>0, 'max'=>Float::INFINITY},
          'searchRevInclude' => {'type'=>'string', 'path'=>'Resource.searchRevInclude', 'min'=>0, 'max'=>Float::INFINITY},
          'searchParam' => {'type'=>'CapabilityStatement::Rest::Resource::SearchParam', 'path'=>'Resource.searchParam', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Interaction < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Interaction.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Interaction.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Interaction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'code' => {'valid_codes'=>{'http://hl7.org/fhir/restful-interaction'=>['read', 'vread', 'update', 'patch', 'delete', 'history-instance', 'history-type', 'create', 'search-type', 'read', 'vread', 'update', 'patch', 'delete', 'history', 'create', 'search', 'capabilities', 'transaction', 'batch', 'operation']}, 'type'=>'code', 'path'=>'Interaction.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/type-restful-interaction'}},
            'documentation' => {'type'=>'string', 'path'=>'Interaction.documentation', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :code              # 1-1 code
          attr_accessor :documentation     # 0-1 string
        end

        class SearchParam < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'SearchParam.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'SearchParam.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'SearchParam.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'name' => {'type'=>'string', 'path'=>'SearchParam.name', 'min'=>1, 'max'=>1},
            'definition' => {'type'=>'uri', 'path'=>'SearchParam.definition', 'min'=>0, 'max'=>1},
            'type' => {'valid_codes'=>{'http://hl7.org/fhir/search-param-type'=>['number', 'date', 'string', 'token', 'reference', 'composite', 'quantity', 'uri', 'number', 'date', 'string', 'token', 'reference', 'composite', 'quantity', 'uri']}, 'type'=>'code', 'path'=>'SearchParam.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/search-param-type'}},
            'documentation' => {'type'=>'string', 'path'=>'SearchParam.documentation', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :name              # 1-1 string
          attr_accessor :definition        # 0-1 uri
          attr_accessor :type              # 1-1 code
          attr_accessor :documentation     # 0-1 string
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 code
        attr_accessor :profile           # 0-1 Reference(StructureDefinition)
        attr_accessor :documentation     # 0-1 markdown
        attr_accessor :interaction       # 1-* [ CapabilityStatement::Rest::Resource::Interaction ]
        attr_accessor :versioning        # 0-1 code
        attr_accessor :readHistory       # 0-1 boolean
        attr_accessor :updateCreate      # 0-1 boolean
        attr_accessor :conditionalCreate # 0-1 boolean
        attr_accessor :conditionalRead   # 0-1 code
        attr_accessor :conditionalUpdate # 0-1 boolean
        attr_accessor :conditionalDelete # 0-1 code
        attr_accessor :referencePolicy   # 0-* [ code ]
        attr_accessor :searchInclude     # 0-* [ string ]
        attr_accessor :searchRevInclude  # 0-* [ string ]
        attr_accessor :searchParam       # 0-* [ CapabilityStatement::Rest::Resource::SearchParam ]
      end

      class Interaction < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Interaction.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Interaction.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Interaction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'valid_codes'=>{'http://hl7.org/fhir/restful-interaction'=>['transaction', 'batch', 'search-system', 'history-system', 'read', 'vread', 'update', 'patch', 'delete', 'history', 'create', 'search', 'capabilities', 'transaction', 'batch', 'operation']}, 'type'=>'code', 'path'=>'Interaction.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/system-restful-interaction'}},
          'documentation' => {'type'=>'string', 'path'=>'Interaction.documentation', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
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
          'id' => {'type'=>'string', 'path'=>'Operation.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Operation.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Operation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'Operation.name', 'min'=>1, 'max'=>1},
          'definition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/OperationDefinition'], 'type'=>'Reference', 'path'=>'Operation.definition', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 1-1 string
        attr_accessor :definition        # 1-1 Reference(OperationDefinition)
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :mode              # 1-1 code
      attr_accessor :documentation     # 0-1 string
      attr_accessor :security          # 0-1 CapabilityStatement::Rest::Security
      attr_accessor :resource          # 0-* [ CapabilityStatement::Rest::Resource ]
      attr_accessor :interaction       # 0-* [ CapabilityStatement::Rest::Interaction ]
      attr_accessor :searchParam       # 0-* [ CapabilityStatement::Rest::Resource::SearchParam ]
      attr_accessor :operation         # 0-* [ CapabilityStatement::Rest::Operation ]
      attr_accessor :compartment       # 0-* [ uri ]
    end

    class Messaging < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Messaging.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Messaging.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Messaging.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'endpoint' => {'type'=>'CapabilityStatement::Messaging::Endpoint', 'path'=>'Messaging.endpoint', 'min'=>0, 'max'=>Float::INFINITY},
        'reliableCache' => {'type'=>'unsignedInt', 'path'=>'Messaging.reliableCache', 'min'=>0, 'max'=>1},
        'documentation' => {'type'=>'string', 'path'=>'Messaging.documentation', 'min'=>0, 'max'=>1},
        'supportedMessage' => {'type'=>'CapabilityStatement::Messaging::SupportedMessage', 'path'=>'Messaging.supportedMessage', 'min'=>0, 'max'=>Float::INFINITY},
        'event' => {'type'=>'CapabilityStatement::Messaging::Event', 'path'=>'Messaging.event', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Endpoint < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Endpoint.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Endpoint.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Endpoint.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'protocol' => {'valid_codes'=>{'http://hl7.org/fhir/message-transport'=>['http', 'ftp', 'mllp', 'http', 'ftp', 'mllp']}, 'type'=>'Coding', 'path'=>'Endpoint.protocol', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/message-transport'}},
          'address' => {'type'=>'uri', 'path'=>'Endpoint.address', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :protocol          # 1-1 Coding
        attr_accessor :address           # 1-1 uri
      end

      class SupportedMessage < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'SupportedMessage.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'SupportedMessage.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'SupportedMessage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'mode' => {'valid_codes'=>{'http://hl7.org/fhir/event-capability-mode'=>['sender', 'receiver', 'sender', 'receiver']}, 'type'=>'code', 'path'=>'SupportedMessage.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/event-capability-mode'}},
          'definition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MessageDefinition'], 'type'=>'Reference', 'path'=>'SupportedMessage.definition', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :mode              # 1-1 code
        attr_accessor :definition        # 1-1 Reference(MessageDefinition)
      end

      class Event < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Event.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Event.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Event.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'valid_codes'=>{'http://hl7.org/fhir/message-events'=>['CodeSystem-expand', 'MedicationAdministration-Complete', 'MedicationAdministration-Nullification', 'MedicationAdministration-Recording', 'MedicationAdministration-Update', 'admin-notify', 'communication-request', 'diagnosticreport-provide', 'observation-provide', 'patient-link', 'patient-unlink', 'valueset-expand', 'CodeSystem-expand', 'MedicationAdministration-Complete', 'MedicationAdministration-Nullification', 'MedicationAdministration-Recording', 'MedicationAdministration-Update', 'admin-notify', 'communication-request', 'diagnosticreport-provide', 'observation-provide', 'patient-link', 'patient-unlink', 'valueset-expand']}, 'type'=>'Coding', 'path'=>'Event.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/message-events'}},
          'category' => {'valid_codes'=>{'http://hl7.org/fhir/message-significance-category'=>['Consequence', 'Currency', 'Notification', 'Consequence', 'Currency', 'Notification']}, 'type'=>'code', 'path'=>'Event.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/message-significance-category'}},
          'mode' => {'valid_codes'=>{'http://hl7.org/fhir/event-capability-mode'=>['sender', 'receiver', 'sender', 'receiver']}, 'type'=>'code', 'path'=>'Event.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/event-capability-mode'}},
          'focus' => {'valid_codes'=>{'http://hl7.org/fhir/resource-types'=>['Account', 'ActivityDefinition', 'AdverseEvent', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CapabilityStatement', 'CarePlan', 'CareTeam', 'ChargeItem', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Consent', 'Contract', 'Coverage', 'DataElement', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceRequest', 'DeviceUseStatement', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'GraphDefinition', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingManifest', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationRequest', 'MedicationStatement', 'MessageDefinition', 'MessageHeader', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'RequestGroup', 'ResearchStudy', 'ResearchSubject', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'ServiceDefinition', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestReport', 'TestScript', 'ValueSet', 'VisionPrescription', 'Account', 'ActivityDefinition', 'AdverseEvent', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CapabilityStatement', 'CarePlan', 'CareTeam', 'ChargeItem', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Consent', 'Contract', 'Coverage', 'DataElement', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceRequest', 'DeviceUseStatement', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'GraphDefinition', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingManifest', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationRequest', 'MedicationStatement', 'MessageDefinition', 'MessageHeader', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'RequestGroup', 'ResearchStudy', 'ResearchSubject', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'ServiceDefinition', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestReport', 'TestScript', 'ValueSet', 'VisionPrescription']}, 'type'=>'code', 'path'=>'Event.focus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/resource-types'}},
          'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'Event.request', 'min'=>1, 'max'=>1},
          'response' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'Event.response', 'min'=>1, 'max'=>1},
          'documentation' => {'type'=>'string', 'path'=>'Event.documentation', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
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

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :endpoint          # 0-* [ CapabilityStatement::Messaging::Endpoint ]
      attr_accessor :reliableCache     # 0-1 unsignedInt
      attr_accessor :documentation     # 0-1 string
      attr_accessor :supportedMessage  # 0-* [ CapabilityStatement::Messaging::SupportedMessage ]
      attr_accessor :event             # 0-* [ CapabilityStatement::Messaging::Event ]
    end

    class Document < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Document.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Document.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Document.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'mode' => {'valid_codes'=>{'http://hl7.org/fhir/document-mode'=>['producer', 'consumer', 'producer', 'consumer']}, 'type'=>'code', 'path'=>'Document.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/document-mode'}},
        'documentation' => {'type'=>'string', 'path'=>'Document.documentation', 'min'=>0, 'max'=>1},
        'profile' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'Document.profile', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :mode              # 1-1 code
      attr_accessor :documentation     # 0-1 string
      attr_accessor :profile           # 1-1 Reference(StructureDefinition)
    end

    attr_accessor :id                  # 0-1 id
    attr_accessor :meta                # 0-1 Meta
    attr_accessor :implicitRules       # 0-1 uri
    attr_accessor :language            # 0-1 code
    attr_accessor :text                # 0-1 Narrative
    attr_accessor :contained           # 0-* [ Resource ]
    attr_accessor :extension           # 0-* [ Extension ]
    attr_accessor :modifierExtension   # 0-* [ Extension ]
    attr_accessor :url                 # 0-1 uri
    attr_accessor :version             # 0-1 string
    attr_accessor :name                # 0-1 string
    attr_accessor :title               # 0-1 string
    attr_accessor :status              # 1-1 code
    attr_accessor :experimental        # 0-1 boolean
    attr_accessor :date                # 1-1 dateTime
    attr_accessor :publisher           # 0-1 string
    attr_accessor :contact             # 0-* [ ContactDetail ]
    attr_accessor :description         # 0-1 markdown
    attr_accessor :useContext          # 0-* [ UsageContext ]
    attr_accessor :jurisdiction        # 0-* [ CodeableConcept ]
    attr_accessor :purpose             # 0-1 markdown
    attr_accessor :copyright           # 0-1 markdown
    attr_accessor :kind                # 1-1 code
    attr_accessor :instantiates        # 0-* [ uri ]
    attr_accessor :software            # 0-1 CapabilityStatement::Software
    attr_accessor :implementation      # 0-1 CapabilityStatement::Implementation
    attr_accessor :fhirVersion         # 1-1 id
    attr_accessor :acceptUnknown       # 1-1 code
    attr_accessor :format              # 1-* [ code ]
    attr_accessor :patchFormat         # 0-* [ code ]
    attr_accessor :implementationGuide # 0-* [ uri ]
    attr_accessor :profile             # 0-* [ Reference(StructureDefinition) ]
    attr_accessor :rest                # 0-* [ CapabilityStatement::Rest ]
    attr_accessor :messaging           # 0-* [ CapabilityStatement::Messaging ]
    attr_accessor :document            # 0-* [ CapabilityStatement::Document ]

    def resourceType
      'CapabilityStatement'
    end
  end
end