module FHIR
  class Questionnaire < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["code", "context", "date", "identifier", "publisher", "status", "title", "version"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Questionnaire.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Questionnaire.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Questionnaire.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Questionnaire.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Questionnaire.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Questionnaire.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Questionnaire.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Questionnaire.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'Questionnaire.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'Questionnaire.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'Questionnaire.version', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/questionnaire-status'=>['draft', 'published', 'retired', 'draft', 'published', 'retired']}, 'type'=>'code', 'path'=>'Questionnaire.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/questionnaire-status'}},
      'date' => {'type'=>'dateTime', 'path'=>'Questionnaire.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'Questionnaire.publisher', 'min'=>0, 'max'=>1},
      'telecom' => {'type'=>'ContactPoint', 'path'=>'Questionnaire.telecom', 'min'=>0, 'max'=>Float::INFINITY},
      'useContext' => {'valid_codes'=>{'https://www.usps.com/'=>['AK', 'AL', 'AR', 'AS', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'FM', 'GA', 'GU', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MH', 'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'PW', 'RI', 'SC', 'SD', 'TN', 'TX', 'UM', 'UT', 'VA', 'VI', 'VT', 'WA', 'WI', 'WV', 'WY'], 'http://hl7.org/fhir/practitioner-specialty'=>['cardio', 'dent', 'dietary', 'midw', 'sysarch'], 'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AN', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BU', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CS', 'CT', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DD', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DY', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FQ', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'HV', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'JT', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MI', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NH', 'NI', 'NL', 'NO', 'NP', 'NQ', 'NR', 'NT', 'NU', 'NZ', 'OM', 'PA', 'PC', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PU', 'PW', 'PY', 'PZ', 'QA', 'RE', 'RH', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SU', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TP', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VD', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WK', 'WS', 'YD', 'YE', 'YT', 'YU', 'ZA', 'ZM', 'ZR', 'ZW'], 'http://unstats.un.org/unsd/methods/m49/m49.htm'=>['004', '008', '012', '016', '020', '024', '028', '031', '032', '036', '040', '044', '048', '050', '051', '052', '056', '060', '064', '068', '070', '072', '076', '084', '090', '092', '096', '100', '104', '108', '112', '116', '120', '124', '132', '136', '140', '144', '148', '152', '156', '170', '174', '175', '178', '180', '184', '188', '191', '192', '196', '203', '204', '208', '212', '214', '218', '222', '226', '231', '232', '233', '234', '238', '242', '246', '248', '250', '254', '258', '262', '266', '268', '270', '275', '276', '288', '292', '296', '300', '304', '308', '312', '316', '320', '324', '328', '332', '336', '340', '344', '348', '352', '356', '360', '364', '368', '372', '376', '380', '384', '388', '392', '398', '400', '404', '408', '410', '414', '417', '418', '422', '426', '428', '430', '434', '438', '440', '442', '446', '450', '454', '458', '462', '466', '470', '474', '478', '480', '484', '492', '496', '498', '499', '500', '504', '508', '512', '516', '520', '524', '528', '531', '533', '534', '535', '540', '548', '554', '558', '562', '566', '570', '574', '578', '580', '583', '584', '585', '586', '591', '598', '600', '604', '608', '612', '616', '620', '624', '626', '630', '634', '638', '642', '643', '646', '652', '654', '659', '660', '662', '663', '666', '670', '674', '678', '680', '682', '686', '688', '690', '694', '702', '703', '704', '705', '706', '710', '716', '724', '728', '729', '732', '740', '744', '748', '752', '756', '760', '762', '764', '768', '772', '776', '780', '784', '788', '792', '795', '796', '798', '800', '804', '807', '818', '826', '830', '831', '832', '833', '834', '840', '850', '854', '858', '860', '862', '876', '882', '887', '894']}, 'type'=>'CodeableConcept', 'path'=>'Questionnaire.useContext', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/use-context'}},
      'title' => {'type'=>'string', 'path'=>'Questionnaire.title', 'min'=>0, 'max'=>1},
      'concept' => {'valid_codes'=>{'http://loinc.org'=>[]}, 'type'=>'Coding', 'path'=>'Questionnaire.concept', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/questionnaire-questions'}},
      'subjectType' => {'valid_codes'=>{'http://hl7.org/fhir/resource-types'=>['Account', 'ActivityDefinition', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Consent', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticReport', 'DiagnosticRequest', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingManifest', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'NamingSystem', 'NutritionRequest', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription', 'Account', 'ActivityDefinition', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Consent', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticReport', 'DiagnosticRequest', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingManifest', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'NamingSystem', 'NutritionRequest', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription']}, 'type'=>'code', 'path'=>'Questionnaire.subjectType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/resource-types'}},
      'item' => {'type'=>'Questionnaire::Item', 'path'=>'Questionnaire.item', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Item < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'initial' => ['boolean', 'decimal', 'integer', 'date', 'dateTime', 'instant', 'time', 'string', 'uri', 'Attachment', 'Coding', 'Quantity', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'linkId' => {'type'=>'string', 'path'=>'Item.linkId', 'min'=>0, 'max'=>1},
        'concept' => {'valid_codes'=>{'http://loinc.org'=>[]}, 'type'=>'Coding', 'path'=>'Item.concept', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/questionnaire-questions'}},
        'prefix' => {'type'=>'string', 'path'=>'Item.prefix', 'min'=>0, 'max'=>1},
        'text' => {'type'=>'string', 'path'=>'Item.text', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/item-type'=>['group', 'display', 'question', 'boolean', 'decimal', 'integer', 'date', 'dateTime', 'instant', 'time', 'string', 'text', 'url', 'choice', 'open-choice', 'attachment', 'reference', 'quantity', 'group', 'display', 'question']}, 'type'=>'code', 'path'=>'Item.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/item-type'}},
        'enableWhen' => {'type'=>'Questionnaire::Item::EnableWhen', 'path'=>'Item.enableWhen', 'min'=>0, 'max'=>Float::INFINITY},
        'required' => {'type'=>'boolean', 'path'=>'Item.required', 'min'=>0, 'max'=>1},
        'repeats' => {'type'=>'boolean', 'path'=>'Item.repeats', 'min'=>0, 'max'=>1},
        'readOnly' => {'type'=>'boolean', 'path'=>'Item.readOnly', 'min'=>0, 'max'=>1},
        'maxLength' => {'type'=>'integer', 'path'=>'Item.maxLength', 'min'=>0, 'max'=>1},
        'options' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ValueSet'], 'type'=>'Reference', 'path'=>'Item.options', 'min'=>0, 'max'=>1},
        'option' => {'type'=>'Questionnaire::Item::Option', 'path'=>'Item.option', 'min'=>0, 'max'=>Float::INFINITY},
        'initialBoolean' => {'type'=>'boolean', 'path'=>'Item.initial[x]', 'min'=>0, 'max'=>1},
        'initialDecimal' => {'type'=>'decimal', 'path'=>'Item.initial[x]', 'min'=>0, 'max'=>1},
        'initialInteger' => {'type'=>'integer', 'path'=>'Item.initial[x]', 'min'=>0, 'max'=>1},
        'initialDate' => {'type'=>'date', 'path'=>'Item.initial[x]', 'min'=>0, 'max'=>1},
        'initialDateTime' => {'type'=>'dateTime', 'path'=>'Item.initial[x]', 'min'=>0, 'max'=>1},
        'initialInstant' => {'type'=>'instant', 'path'=>'Item.initial[x]', 'min'=>0, 'max'=>1},
        'initialTime' => {'type'=>'time', 'path'=>'Item.initial[x]', 'min'=>0, 'max'=>1},
        'initialString' => {'type'=>'string', 'path'=>'Item.initial[x]', 'min'=>0, 'max'=>1},
        'initialUri' => {'type'=>'uri', 'path'=>'Item.initial[x]', 'min'=>0, 'max'=>1},
        'initialAttachment' => {'type'=>'Attachment', 'path'=>'Item.initial[x]', 'min'=>0, 'max'=>1},
        'initialCoding' => {'type'=>'Coding', 'path'=>'Item.initial[x]', 'min'=>0, 'max'=>1},
        'initialQuantity' => {'type'=>'Quantity', 'path'=>'Item.initial[x]', 'min'=>0, 'max'=>1},
        'initialReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Item.initial[x]', 'min'=>0, 'max'=>1},
        'item' => {'type'=>'Questionnaire::Item', 'path'=>'Item.item', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class EnableWhen < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'answer' => ['boolean', 'decimal', 'integer', 'date', 'dateTime', 'instant', 'time', 'string', 'uri', 'Attachment', 'Coding', 'Quantity', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'EnableWhen.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'EnableWhen.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'EnableWhen.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'question' => {'type'=>'string', 'path'=>'EnableWhen.question', 'min'=>1, 'max'=>1},
          'hasAnswer' => {'type'=>'boolean', 'path'=>'EnableWhen.hasAnswer', 'min'=>0, 'max'=>1},
          'answerBoolean' => {'type'=>'boolean', 'path'=>'EnableWhen.answer[x]', 'min'=>0, 'max'=>1},
          'answerDecimal' => {'type'=>'decimal', 'path'=>'EnableWhen.answer[x]', 'min'=>0, 'max'=>1},
          'answerInteger' => {'type'=>'integer', 'path'=>'EnableWhen.answer[x]', 'min'=>0, 'max'=>1},
          'answerDate' => {'type'=>'date', 'path'=>'EnableWhen.answer[x]', 'min'=>0, 'max'=>1},
          'answerDateTime' => {'type'=>'dateTime', 'path'=>'EnableWhen.answer[x]', 'min'=>0, 'max'=>1},
          'answerInstant' => {'type'=>'instant', 'path'=>'EnableWhen.answer[x]', 'min'=>0, 'max'=>1},
          'answerTime' => {'type'=>'time', 'path'=>'EnableWhen.answer[x]', 'min'=>0, 'max'=>1},
          'answerString' => {'type'=>'string', 'path'=>'EnableWhen.answer[x]', 'min'=>0, 'max'=>1},
          'answerUri' => {'type'=>'uri', 'path'=>'EnableWhen.answer[x]', 'min'=>0, 'max'=>1},
          'answerAttachment' => {'type'=>'Attachment', 'path'=>'EnableWhen.answer[x]', 'min'=>0, 'max'=>1},
          'answerCoding' => {'type'=>'Coding', 'path'=>'EnableWhen.answer[x]', 'min'=>0, 'max'=>1},
          'answerQuantity' => {'type'=>'Quantity', 'path'=>'EnableWhen.answer[x]', 'min'=>0, 'max'=>1},
          'answerReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'EnableWhen.answer[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :question          # 1-1 string
        attr_accessor :hasAnswer         # 0-1 boolean
        attr_accessor :answerBoolean     # 0-1 boolean
        attr_accessor :answerDecimal     # 0-1 decimal
        attr_accessor :answerInteger     # 0-1 integer
        attr_accessor :answerDate        # 0-1 date
        attr_accessor :answerDateTime    # 0-1 dateTime
        attr_accessor :answerInstant     # 0-1 instant
        attr_accessor :answerTime        # 0-1 time
        attr_accessor :answerString      # 0-1 string
        attr_accessor :answerUri         # 0-1 uri
        attr_accessor :answerAttachment  # 0-1 Attachment
        attr_accessor :answerCoding      # 0-1 Coding
        attr_accessor :answerQuantity    # 0-1 Quantity
        attr_accessor :answerReference   # 0-1 Reference(Resource)
      end

      class Option < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['integer', 'date', 'time', 'string', 'Coding']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Option.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Option.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Option.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'valueInteger' => {'type'=>'integer', 'path'=>'Option.value[x]', 'min'=>1, 'max'=>1},
          'valueDate' => {'type'=>'date', 'path'=>'Option.value[x]', 'min'=>1, 'max'=>1},
          'valueTime' => {'type'=>'time', 'path'=>'Option.value[x]', 'min'=>1, 'max'=>1},
          'valueString' => {'type'=>'string', 'path'=>'Option.value[x]', 'min'=>1, 'max'=>1},
          'valueCoding' => {'valid_codes'=>{'http://snomed.info/sct'=>[]}, 'type'=>'Coding', 'path'=>'Option.value[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/questionnaire-answers'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :valueInteger      # 1-1 integer
        attr_accessor :valueDate         # 1-1 date
        attr_accessor :valueTime         # 1-1 time
        attr_accessor :valueString       # 1-1 string
        attr_accessor :valueCoding       # 1-1 Coding
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :linkId            # 0-1 string
      attr_accessor :concept           # 0-* [ Coding ]
      attr_accessor :prefix            # 0-1 string
      attr_accessor :text              # 0-1 string
      attr_accessor :type              # 1-1 code
      attr_accessor :enableWhen        # 0-* [ Questionnaire::Item::EnableWhen ]
      attr_accessor :required          # 0-1 boolean
      attr_accessor :repeats           # 0-1 boolean
      attr_accessor :readOnly          # 0-1 boolean
      attr_accessor :maxLength         # 0-1 integer
      attr_accessor :options           # 0-1 Reference(ValueSet)
      attr_accessor :option            # 0-* [ Questionnaire::Item::Option ]
      attr_accessor :initialBoolean    # 0-1 boolean
      attr_accessor :initialDecimal    # 0-1 decimal
      attr_accessor :initialInteger    # 0-1 integer
      attr_accessor :initialDate       # 0-1 date
      attr_accessor :initialDateTime   # 0-1 dateTime
      attr_accessor :initialInstant    # 0-1 instant
      attr_accessor :initialTime       # 0-1 time
      attr_accessor :initialString     # 0-1 string
      attr_accessor :initialUri        # 0-1 uri
      attr_accessor :initialAttachment # 0-1 Attachment
      attr_accessor :initialCoding     # 0-1 Coding
      attr_accessor :initialQuantity   # 0-1 Quantity
      attr_accessor :initialReference  # 0-1 Reference(Resource)
      attr_accessor :item              # 0-* [ Questionnaire::Item ]
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
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :version           # 0-1 string
    attr_accessor :status            # 1-1 code
    attr_accessor :date              # 0-1 dateTime
    attr_accessor :publisher         # 0-1 string
    attr_accessor :telecom           # 0-* [ ContactPoint ]
    attr_accessor :useContext        # 0-* [ CodeableConcept ]
    attr_accessor :title             # 0-1 string
    attr_accessor :concept           # 0-* [ Coding ]
    attr_accessor :subjectType       # 0-* [ code ]
    attr_accessor :item              # 0-* [ Questionnaire::Item ]

    def resourceType
      'Questionnaire'
    end
  end
end