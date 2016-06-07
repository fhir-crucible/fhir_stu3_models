module FHIR
  class Provenance < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["agent", "end", "entity", "entity-type", "location", "patient", "sig", "start", "target", "userid"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Provenance.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Provenance.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Provenance.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Provenance.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'Provenance.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Provenance.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Provenance.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Provenance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'target' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Provenance.target', 'min'=>1, 'max'=>Float::INFINITY},
      'period' => {'type'=>'Period', 'path'=>'Provenance.period', 'min'=>0, 'max'=>1},
      'recorded' => {'type'=>'instant', 'path'=>'Provenance.recorded', 'min'=>1, 'max'=>1},
      'reason' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH']}, 'type'=>'Coding', 'path'=>'Provenance.reason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-PurposeOfUse'}},
      'activity' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActStatus'=>['aborted', 'cancelled', 'completed', 'new', 'nullified', 'obsolete'], 'http://hl7.org/fhir/v3/DocumentCompletion'=>['AU', 'DI', 'DO', 'LA', 'UC']}, 'type'=>'Coding', 'path'=>'Provenance.activity', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ProvenanceEventCurrentState'}},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Provenance.location', 'min'=>0, 'max'=>1},
      'policy' => {'type'=>'uri', 'path'=>'Provenance.policy', 'min'=>0, 'max'=>Float::INFINITY},
      'agent' => {'type'=>'Provenance::Agent', 'path'=>'Provenance.agent', 'min'=>1, 'max'=>Float::INFINITY},
      'entity' => {'type'=>'Provenance::Entity', 'path'=>'Provenance.entity', 'min'=>0, 'max'=>Float::INFINITY},
      'signature' => {'type'=>'Signature', 'path'=>'Provenance.signature', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Agent < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Agent.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Agent.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Agent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'role' => {'valid_codes'=>{'http://hl7.org/fhir/provenance-participant-role'=>['enterer', 'performer', 'author', 'verifier', 'legal', 'attester', 'informant', 'custodian', 'assembler', 'composer']}, 'type'=>'Coding', 'path'=>'Agent.role', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/provenance-agent-role'}},
        'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Agent.actor', 'min'=>0, 'max'=>1},
        'userId' => {'type'=>'Identifier', 'path'=>'Agent.userId', 'min'=>0, 'max'=>1},
        'relatedAgent' => {'type'=>'Provenance::Agent::Relatedagent', 'path'=>'Agent.relatedAgent', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Relatedagent < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Relatedagent.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Relatedagent.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Relatedagent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/v3/RoleLinkType'=>['REL', 'BACKUP', 'CONT', 'DIRAUTH', 'IDENT', 'INDAUTH', 'PART', 'REPL']}, 'type'=>'CodeableConcept', 'path'=>'Relatedagent.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-RoleLinkType'}},
          'target' => {'type'=>'uri', 'path'=>'Relatedagent.target', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 CodeableConcept
        attr_accessor :target            # 1-1 uri
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :role              # 1-1 Coding
      attr_accessor :actor             # 0-1 Reference(Practitioner|RelatedPerson|Patient|Device|Organization)
      attr_accessor :userId            # 0-1 Identifier
      attr_accessor :relatedAgent      # 0-* [ Provenance::Agent::Relatedagent ]
    end

    class Entity < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Entity.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Entity.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Entity.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'role' => {'valid_codes'=>{'http://hl7.org/fhir/provenance-entity-role'=>['derivation', 'revision', 'quotation', 'source', 'removal']}, 'type'=>'code', 'path'=>'Entity.role', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/provenance-entity-role'}},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/resource-types'=>['Account', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportRule', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticOrder', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingExcerpt', 'ImagingObjectSelection', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'ModuleDefinition', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Order', 'OrderResponse', 'OrderSet', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Protocol', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription']}, 'type'=>'Coding', 'path'=>'Entity.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/resource-types'}},
        'reference' => {'type'=>'uri', 'path'=>'Entity.reference', 'min'=>1, 'max'=>1},
        'display' => {'type'=>'string', 'path'=>'Entity.display', 'min'=>0, 'max'=>1},
        'agent' => {'type'=>'Provenance::Agent', 'path'=>'Entity.agent', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :role              # 1-1 code
      attr_accessor :type              # 1-1 Coding
      attr_accessor :reference         # 1-1 uri
      attr_accessor :display           # 0-1 string
      attr_accessor :agent             # 0-1 Provenance::Agent
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :target            # 1-* [ Reference(Resource) ]
    attr_accessor :period            # 0-1 Period
    attr_accessor :recorded          # 1-1 instant
    attr_accessor :reason            # 0-* [ Coding ]
    attr_accessor :activity          # 0-1 Coding
    attr_accessor :location          # 0-1 Reference(Location)
    attr_accessor :policy            # 0-* [ uri ]
    attr_accessor :agent             # 1-* [ Provenance::Agent ]
    attr_accessor :entity            # 0-* [ Provenance::Entity ]
    attr_accessor :signature         # 0-* [ Signature ]

    def resourceType
      'Provenance'
    end
  end
end