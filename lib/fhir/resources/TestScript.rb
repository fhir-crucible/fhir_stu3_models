module FHIR
  class TestScript < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["description", "identifier", "name", "testscript-capability", "testscript-setup-capability", "testscript-test-capability", "url"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'TestScript.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'TestScript.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'TestScript.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'TestScript.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'TestScript.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'TestScript.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'TestScript.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'TestScript.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'TestScript.url', 'min'=>1, 'max'=>1},
      'version' => {'type'=>'string', 'path'=>'TestScript.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'TestScript.name', 'min'=>1, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/conformance-resource-status'=>['draft', 'active', 'retired']}, 'type'=>'code', 'path'=>'TestScript.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conformance-resource-status'}},
      'identifier' => {'type'=>'Identifier', 'path'=>'TestScript.identifier', 'min'=>0, 'max'=>1},
      'experimental' => {'type'=>'boolean', 'path'=>'TestScript.experimental', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'TestScript.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'TestScript::Contact', 'path'=>'TestScript.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'date' => {'type'=>'dateTime', 'path'=>'TestScript.date', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'TestScript.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'CodeableConcept', 'path'=>'TestScript.useContext', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/use-context'}},
      'requirements' => {'type'=>'string', 'path'=>'TestScript.requirements', 'min'=>0, 'max'=>1},
      'copyright' => {'type'=>'string', 'path'=>'TestScript.copyright', 'min'=>0, 'max'=>1},
      'origin' => {'type'=>'TestScript::Origin', 'path'=>'TestScript.origin', 'min'=>0, 'max'=>Float::INFINITY},
      'destination' => {'type'=>'TestScript::Destination', 'path'=>'TestScript.destination', 'min'=>0, 'max'=>Float::INFINITY},
      'metadata' => {'type'=>'TestScript::Metadata', 'path'=>'TestScript.metadata', 'min'=>0, 'max'=>1},
      'fixture' => {'type'=>'TestScript::Fixture', 'path'=>'TestScript.fixture', 'min'=>0, 'max'=>Float::INFINITY},
      'profile' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'TestScript.profile', 'min'=>0, 'max'=>Float::INFINITY},
      'variable' => {'type'=>'TestScript::Variable', 'path'=>'TestScript.variable', 'min'=>0, 'max'=>Float::INFINITY},
      'rule' => {'type'=>'TestScript::Rule', 'path'=>'TestScript.rule', 'min'=>0, 'max'=>Float::INFINITY},
      'ruleset' => {'type'=>'TestScript::Ruleset', 'path'=>'TestScript.ruleset', 'min'=>0, 'max'=>Float::INFINITY},
      'setup' => {'type'=>'TestScript::Setup', 'path'=>'TestScript.setup', 'min'=>0, 'max'=>1},
      'test' => {'type'=>'TestScript::Test', 'path'=>'TestScript.test', 'min'=>0, 'max'=>Float::INFINITY},
      'teardown' => {'type'=>'TestScript::Teardown', 'path'=>'TestScript.teardown', 'min'=>0, 'max'=>1}
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

    class Origin < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Origin.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Origin.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Origin.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'index' => {'type'=>'integer', 'path'=>'Origin.index', 'min'=>1, 'max'=>1},
        'profile' => {'valid_codes'=>{'http://hl7.org/fhir/testscript-profile-origin-types'=>['FHIR-Client', 'FHIR-SDC-FormFiller']}, 'type'=>'Coding', 'path'=>'Origin.profile', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/testscript-profile-origin-types'}}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :index             # 1-1 integer
      attr_accessor :profile           # 1-1 Coding
    end

    class Destination < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Destination.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Destination.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Destination.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'index' => {'type'=>'integer', 'path'=>'Destination.index', 'min'=>1, 'max'=>1},
        'profile' => {'valid_codes'=>{'http://hl7.org/fhir/testscript-profile-destination-types'=>['FHIR-Server', 'FHIR-SDC-FormManager', 'FHIR-SDC-FormProcessor', 'FHIR-SDC-FormReceiver']}, 'type'=>'Coding', 'path'=>'Destination.profile', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/testscript-profile-destination-types'}}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :index             # 1-1 integer
      attr_accessor :profile           # 1-1 Coding
    end

    class Metadata < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Metadata.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Metadata.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Metadata.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'link' => {'type'=>'TestScript::Metadata::Link', 'path'=>'Metadata.link', 'min'=>0, 'max'=>Float::INFINITY},
        'capability' => {'type'=>'TestScript::Metadata::Capability', 'path'=>'Metadata.capability', 'min'=>1, 'max'=>Float::INFINITY}
      }

      class Link < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Link.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Link.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Link.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'url' => {'type'=>'uri', 'path'=>'Link.url', 'min'=>1, 'max'=>1},
          'description' => {'type'=>'string', 'path'=>'Link.description', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :url               # 1-1 uri
        attr_accessor :description       # 0-1 string
      end

      class Capability < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Capability.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Capability.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Capability.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'required' => {'type'=>'boolean', 'path'=>'Capability.required', 'min'=>0, 'max'=>1},
          'validated' => {'type'=>'boolean', 'path'=>'Capability.validated', 'min'=>0, 'max'=>1},
          'description' => {'type'=>'string', 'path'=>'Capability.description', 'min'=>0, 'max'=>1},
          'origin' => {'type'=>'integer', 'path'=>'Capability.origin', 'min'=>0, 'max'=>Float::INFINITY},
          'destination' => {'type'=>'integer', 'path'=>'Capability.destination', 'min'=>0, 'max'=>1},
          'link' => {'type'=>'uri', 'path'=>'Capability.link', 'min'=>0, 'max'=>Float::INFINITY},
          'conformance' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Conformance'], 'type'=>'Reference', 'path'=>'Capability.conformance', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :required          # 0-1 boolean
        attr_accessor :validated         # 0-1 boolean
        attr_accessor :description       # 0-1 string
        attr_accessor :origin            # 0-* [ integer ]
        attr_accessor :destination       # 0-1 integer
        attr_accessor :link              # 0-* [ uri ]
        attr_accessor :conformance       # 1-1 Reference(Conformance)
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :link              # 0-* [ TestScript::Metadata::Link ]
      attr_accessor :capability        # 1-* [ TestScript::Metadata::Capability ]
    end

    class Fixture < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Fixture.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Fixture.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Fixture.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'autocreate' => {'type'=>'boolean', 'path'=>'Fixture.autocreate', 'min'=>0, 'max'=>1},
        'autodelete' => {'type'=>'boolean', 'path'=>'Fixture.autodelete', 'min'=>0, 'max'=>1},
        'resource' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Fixture.resource', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :autocreate        # 0-1 boolean
      attr_accessor :autodelete        # 0-1 boolean
      attr_accessor :resource          # 0-1 Reference(Resource)
    end

    class Variable < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Variable.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Variable.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Variable.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Variable.name', 'min'=>1, 'max'=>1},
        'defaultValue' => {'type'=>'string', 'path'=>'Variable.defaultValue', 'min'=>0, 'max'=>1},
        'headerField' => {'type'=>'string', 'path'=>'Variable.headerField', 'min'=>0, 'max'=>1},
        'path' => {'type'=>'string', 'path'=>'Variable.path', 'min'=>0, 'max'=>1},
        'sourceId' => {'type'=>'id', 'path'=>'Variable.sourceId', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 1-1 string
      attr_accessor :defaultValue      # 0-1 string
      attr_accessor :headerField       # 0-1 string
      attr_accessor :path              # 0-1 string
      attr_accessor :sourceId          # 0-1 id
    end

    class Rule < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Rule.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Rule.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Rule.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'resource' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Rule.resource', 'min'=>1, 'max'=>1},
        'param' => {'type'=>'TestScript::Rule::Param', 'path'=>'Rule.param', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Param < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Param.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Param.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Param.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'Param.name', 'min'=>1, 'max'=>1},
          'value' => {'type'=>'string', 'path'=>'Param.value', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 1-1 string
        attr_accessor :value             # 0-1 string
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :resource          # 1-1 Reference(Resource)
      attr_accessor :param             # 0-* [ TestScript::Rule::Param ]
    end

    class Ruleset < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Ruleset.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Ruleset.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Ruleset.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'resource' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Ruleset.resource', 'min'=>1, 'max'=>1},
        'rule' => {'type'=>'TestScript::Ruleset::Rule', 'path'=>'Ruleset.rule', 'min'=>1, 'max'=>Float::INFINITY}
      }

      class Rule < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Rule.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Rule.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Rule.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'param' => {'type'=>'TestScript::Ruleset::Rule::Param', 'path'=>'Rule.param', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Param < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Param.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Param.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Param.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'name' => {'type'=>'string', 'path'=>'Param.name', 'min'=>1, 'max'=>1},
            'value' => {'type'=>'string', 'path'=>'Param.value', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :name              # 1-1 string
          attr_accessor :value             # 0-1 string
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :param             # 0-* [ TestScript::Ruleset::Rule::Param ]
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :resource          # 1-1 Reference(Resource)
      attr_accessor :rule              # 1-* [ TestScript::Ruleset::Rule ]
    end

    class Setup < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Setup.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Setup.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Setup.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'metadata' => {'type'=>'TestScript::Metadata', 'path'=>'Setup.metadata', 'min'=>0, 'max'=>1},
        'action' => {'type'=>'TestScript::Setup::Action', 'path'=>'Setup.action', 'min'=>1, 'max'=>Float::INFINITY}
      }

      class Action < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Action.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Action.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Action.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'operation' => {'type'=>'TestScript::Setup::Action::Operation', 'path'=>'Action.operation', 'min'=>0, 'max'=>1},
          'assert' => {'type'=>'TestScript::Setup::Action::Assert', 'path'=>'Action.assert', 'min'=>0, 'max'=>1}
        }

        class Operation < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Operation.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Operation.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Operation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'type' => {'valid_codes'=>{'http://hl7.org/fhir/testscript-operation-codes'=>['read', 'vread', 'update', 'delete', 'history', 'create', 'search', 'batch', 'transaction', 'conformance', 'cancel', 'cds-hook', 'closure', 'document', 'evaluate', 'evaluate-measure', 'everything', 'expand', 'fail', 'find', 'finish', 'lookup', 'match', 'meta', 'meta-add', 'meta-delete', 'place', 'populate', 'process-message', 'questionnaire', 'release', 'reserve', 'resume', 'set-input', 'set-output', 'start', 'stop', 'suspend', 'translate', 'validate', 'validate-code']}, 'type'=>'Coding', 'path'=>'Operation.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/testscript-operation-codes'}},
            'resource' => {'valid_codes'=>{'http://hl7.org/fhir/data-types'=>['ActionDefinition', 'Address', 'Age', 'Annotation', 'Attachment', 'BackboneElement', 'CodeableConcept', 'Coding', 'ContactPoint', 'Count', 'DataRequirement', 'Distance', 'Duration', 'Element', 'ElementDefinition', 'Extension', 'HumanName', 'Identifier', 'Meta', 'ModuleMetadata', 'Money', 'Narrative', 'ParameterDefinition', 'Period', 'Quantity', 'Range', 'Ratio', 'Reference', 'SampledData', 'Signature', 'SimpleQuantity', 'Timing', 'TriggerDefinition', 'base64Binary', 'boolean', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'uuid', 'xhtml'], 'http://hl7.org/fhir/resource-types'=>['Account', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportRule', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticOrder', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingExcerpt', 'ImagingObjectSelection', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'ModuleDefinition', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Order', 'OrderResponse', 'OrderSet', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Protocol', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription']}, 'type'=>'code', 'path'=>'Operation.resource', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/defined-types'}},
            'label' => {'type'=>'string', 'path'=>'Operation.label', 'min'=>0, 'max'=>1},
            'description' => {'type'=>'string', 'path'=>'Operation.description', 'min'=>0, 'max'=>1},
            'accept' => {'valid_codes'=>{'http://hl7.org/fhir/content-type'=>['xml', 'json']}, 'type'=>'code', 'path'=>'Operation.accept', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/content-type'}},
            'contentType' => {'valid_codes'=>{'http://hl7.org/fhir/content-type'=>['xml', 'json']}, 'type'=>'code', 'path'=>'Operation.contentType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/content-type'}},
            'destination' => {'type'=>'integer', 'path'=>'Operation.destination', 'min'=>0, 'max'=>1},
            'encodeRequestUrl' => {'type'=>'boolean', 'path'=>'Operation.encodeRequestUrl', 'min'=>0, 'max'=>1},
            'origin' => {'type'=>'integer', 'path'=>'Operation.origin', 'min'=>0, 'max'=>1},
            'params' => {'type'=>'string', 'path'=>'Operation.params', 'min'=>0, 'max'=>1},
            'requestHeader' => {'type'=>'TestScript::Setup::Action::Operation::Requestheader', 'path'=>'Operation.requestHeader', 'min'=>0, 'max'=>Float::INFINITY},
            'responseId' => {'type'=>'id', 'path'=>'Operation.responseId', 'min'=>0, 'max'=>1},
            'sourceId' => {'type'=>'id', 'path'=>'Operation.sourceId', 'min'=>0, 'max'=>1},
            'targetId' => {'type'=>'id', 'path'=>'Operation.targetId', 'min'=>0, 'max'=>1},
            'url' => {'type'=>'string', 'path'=>'Operation.url', 'min'=>0, 'max'=>1}
          }

          class Requestheader < FHIR::Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'id', 'path'=>'Requestheader.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Requestheader.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Requestheader.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'field' => {'type'=>'string', 'path'=>'Requestheader.field', 'min'=>1, 'max'=>1},
              'value' => {'type'=>'string', 'path'=>'Requestheader.value', 'min'=>1, 'max'=>1}
            }

            attr_accessor :id                # 0-1 id
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :field             # 1-1 string
            attr_accessor :value             # 1-1 string
          end

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :type              # 0-1 Coding
          attr_accessor :resource          # 0-1 code
          attr_accessor :label             # 0-1 string
          attr_accessor :description       # 0-1 string
          attr_accessor :accept            # 0-1 code
          attr_accessor :contentType       # 0-1 code
          attr_accessor :destination       # 0-1 integer
          attr_accessor :encodeRequestUrl  # 0-1 boolean
          attr_accessor :origin            # 0-1 integer
          attr_accessor :params            # 0-1 string
          attr_accessor :requestHeader     # 0-* [ TestScript::Setup::Action::Operation::Requestheader ]
          attr_accessor :responseId        # 0-1 id
          attr_accessor :sourceId          # 0-1 id
          attr_accessor :targetId          # 0-1 id
          attr_accessor :url               # 0-1 string
        end

        class Assert < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Assert.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Assert.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Assert.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'label' => {'type'=>'string', 'path'=>'Assert.label', 'min'=>0, 'max'=>1},
            'description' => {'type'=>'string', 'path'=>'Assert.description', 'min'=>0, 'max'=>1},
            'direction' => {'valid_codes'=>{'http://hl7.org/fhir/assert-direction-codes'=>['response', 'request']}, 'type'=>'code', 'path'=>'Assert.direction', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/assert-direction-codes'}},
            'compareToSourceId' => {'type'=>'string', 'path'=>'Assert.compareToSourceId', 'min'=>0, 'max'=>1},
            'compareToSourcePath' => {'type'=>'string', 'path'=>'Assert.compareToSourcePath', 'min'=>0, 'max'=>1},
            'contentType' => {'valid_codes'=>{'http://hl7.org/fhir/content-type'=>['xml', 'json']}, 'type'=>'code', 'path'=>'Assert.contentType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/content-type'}},
            'headerField' => {'type'=>'string', 'path'=>'Assert.headerField', 'min'=>0, 'max'=>1},
            'minimumId' => {'type'=>'string', 'path'=>'Assert.minimumId', 'min'=>0, 'max'=>1},
            'navigationLinks' => {'type'=>'boolean', 'path'=>'Assert.navigationLinks', 'min'=>0, 'max'=>1},
            'operator' => {'valid_codes'=>{'http://hl7.org/fhir/assert-operator-codes'=>['equals', 'notEquals', 'in', 'notIn', 'greaterThan', 'lessThan', 'empty', 'notEmpty', 'contains', 'notContains']}, 'type'=>'code', 'path'=>'Assert.operator', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/assert-operator-codes'}},
            'path' => {'type'=>'string', 'path'=>'Assert.path', 'min'=>0, 'max'=>1},
            'resource' => {'valid_codes'=>{'http://hl7.org/fhir/data-types'=>['ActionDefinition', 'Address', 'Age', 'Annotation', 'Attachment', 'BackboneElement', 'CodeableConcept', 'Coding', 'ContactPoint', 'Count', 'DataRequirement', 'Distance', 'Duration', 'Element', 'ElementDefinition', 'Extension', 'HumanName', 'Identifier', 'Meta', 'ModuleMetadata', 'Money', 'Narrative', 'ParameterDefinition', 'Period', 'Quantity', 'Range', 'Ratio', 'Reference', 'SampledData', 'Signature', 'SimpleQuantity', 'Timing', 'TriggerDefinition', 'base64Binary', 'boolean', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'uuid', 'xhtml'], 'http://hl7.org/fhir/resource-types'=>['Account', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'AuditEvent', 'Basic', 'Binary', 'BodySite', 'Bundle', 'CarePlan', 'CareTeam', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'Conformance', 'Contract', 'Coverage', 'DataElement', 'DecisionSupportRule', 'DecisionSupportServiceModule', 'DetectedIssue', 'Device', 'DeviceComponent', 'DeviceMetric', 'DeviceUseRequest', 'DeviceUseStatement', 'DiagnosticOrder', 'DiagnosticReport', 'DocumentManifest', 'DocumentReference', 'DomainResource', 'EligibilityRequest', 'EligibilityResponse', 'Encounter', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'ExpansionProfile', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'Goal', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingExcerpt', 'ImagingObjectSelection', 'ImagingStudy', 'Immunization', 'ImmunizationRecommendation', 'ImplementationGuide', 'Library', 'Linkage', 'List', 'Location', 'Measure', 'MeasureReport', 'Media', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationOrder', 'MedicationStatement', 'MessageHeader', 'ModuleDefinition', 'NamingSystem', 'NutritionOrder', 'Observation', 'OperationDefinition', 'OperationOutcome', 'Order', 'OrderResponse', 'OrderSet', 'Organization', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Person', 'Practitioner', 'PractitionerRole', 'Procedure', 'ProcedureRequest', 'ProcessRequest', 'ProcessResponse', 'Protocol', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'ReferralRequest', 'RelatedPerson', 'Resource', 'RiskAssessment', 'Schedule', 'SearchParameter', 'Sequence', 'Slot', 'Specimen', 'StructureDefinition', 'StructureMap', 'Subscription', 'Substance', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TestScript', 'ValueSet', 'VisionPrescription']}, 'type'=>'code', 'path'=>'Assert.resource', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/defined-types'}},
            'response' => {'valid_codes'=>{'http://hl7.org/fhir/assert-response-code-types'=>['okay', 'created', 'noContent', 'notModified', 'bad', 'forbidden', 'notFound', 'methodNotAllowed', 'conflict', 'gone', 'preconditionFailed', 'unprocessable']}, 'type'=>'code', 'path'=>'Assert.response', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/assert-response-code-types'}},
            'responseCode' => {'type'=>'string', 'path'=>'Assert.responseCode', 'min'=>0, 'max'=>1},
            'rule' => {'type'=>'TestScript::Setup::Action::Assert::Rule', 'path'=>'Assert.rule', 'min'=>0, 'max'=>1},
            'ruleset' => {'type'=>'TestScript::Setup::Action::Assert::Ruleset', 'path'=>'Assert.ruleset', 'min'=>0, 'max'=>1},
            'sourceId' => {'type'=>'id', 'path'=>'Assert.sourceId', 'min'=>0, 'max'=>1},
            'validateProfileId' => {'type'=>'id', 'path'=>'Assert.validateProfileId', 'min'=>0, 'max'=>1},
            'value' => {'type'=>'string', 'path'=>'Assert.value', 'min'=>0, 'max'=>1},
            'warningOnly' => {'type'=>'boolean', 'path'=>'Assert.warningOnly', 'min'=>0, 'max'=>1}
          }

          class Rule < FHIR::Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'id', 'path'=>'Rule.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Rule.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Rule.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'param' => {'type'=>'TestScript::Setup::Action::Assert::Rule::Param', 'path'=>'Rule.param', 'min'=>0, 'max'=>Float::INFINITY}
            }

            class Param < FHIR::Model
              include FHIR::Hashable
              include FHIR::Json
              include FHIR::Xml

              METADATA = {
                'id' => {'type'=>'id', 'path'=>'Param.id', 'min'=>0, 'max'=>1},
                'extension' => {'type'=>'Extension', 'path'=>'Param.extension', 'min'=>0, 'max'=>Float::INFINITY},
                'modifierExtension' => {'type'=>'Extension', 'path'=>'Param.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                'name' => {'type'=>'string', 'path'=>'Param.name', 'min'=>1, 'max'=>1},
                'value' => {'type'=>'string', 'path'=>'Param.value', 'min'=>1, 'max'=>1}
              }

              attr_accessor :id                # 0-1 id
              attr_accessor :extension         # 0-* [ Extension ]
              attr_accessor :modifierExtension # 0-* [ Extension ]
              attr_accessor :name              # 1-1 string
              attr_accessor :value             # 1-1 string
            end

            attr_accessor :id                # 0-1 id
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :param             # 0-* [ TestScript::Setup::Action::Assert::Rule::Param ]
          end

          class Ruleset < FHIR::Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'id', 'path'=>'Ruleset.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Ruleset.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Ruleset.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'rule' => {'type'=>'TestScript::Setup::Action::Assert::Ruleset::Rule', 'path'=>'Ruleset.rule', 'min'=>1, 'max'=>Float::INFINITY}
            }

            class Rule < FHIR::Model
              include FHIR::Hashable
              include FHIR::Json
              include FHIR::Xml

              METADATA = {
                'id' => {'type'=>'id', 'path'=>'Rule.id', 'min'=>0, 'max'=>1},
                'extension' => {'type'=>'Extension', 'path'=>'Rule.extension', 'min'=>0, 'max'=>Float::INFINITY},
                'modifierExtension' => {'type'=>'Extension', 'path'=>'Rule.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                'param' => {'type'=>'TestScript::Setup::Action::Assert::Ruleset::Rule::Param', 'path'=>'Rule.param', 'min'=>0, 'max'=>Float::INFINITY}
              }

              class Param < FHIR::Model
                include FHIR::Hashable
                include FHIR::Json
                include FHIR::Xml

                METADATA = {
                  'id' => {'type'=>'id', 'path'=>'Param.id', 'min'=>0, 'max'=>1},
                  'extension' => {'type'=>'Extension', 'path'=>'Param.extension', 'min'=>0, 'max'=>Float::INFINITY},
                  'modifierExtension' => {'type'=>'Extension', 'path'=>'Param.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                  'name' => {'type'=>'string', 'path'=>'Param.name', 'min'=>1, 'max'=>1},
                  'value' => {'type'=>'string', 'path'=>'Param.value', 'min'=>1, 'max'=>1}
                }

                attr_accessor :id                # 0-1 id
                attr_accessor :extension         # 0-* [ Extension ]
                attr_accessor :modifierExtension # 0-* [ Extension ]
                attr_accessor :name              # 1-1 string
                attr_accessor :value             # 1-1 string
              end

              attr_accessor :id                # 0-1 id
              attr_accessor :extension         # 0-* [ Extension ]
              attr_accessor :modifierExtension # 0-* [ Extension ]
              attr_accessor :param             # 0-* [ TestScript::Setup::Action::Assert::Ruleset::Rule::Param ]
            end

            attr_accessor :id                # 0-1 id
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :rule              # 1-* [ TestScript::Setup::Action::Assert::Ruleset::Rule ]
          end

          attr_accessor :id                  # 0-1 id
          attr_accessor :extension           # 0-* [ Extension ]
          attr_accessor :modifierExtension   # 0-* [ Extension ]
          attr_accessor :label               # 0-1 string
          attr_accessor :description         # 0-1 string
          attr_accessor :direction           # 0-1 code
          attr_accessor :compareToSourceId   # 0-1 string
          attr_accessor :compareToSourcePath # 0-1 string
          attr_accessor :contentType         # 0-1 code
          attr_accessor :headerField         # 0-1 string
          attr_accessor :minimumId           # 0-1 string
          attr_accessor :navigationLinks     # 0-1 boolean
          attr_accessor :operator            # 0-1 code
          attr_accessor :path                # 0-1 string
          attr_accessor :resource            # 0-1 code
          attr_accessor :response            # 0-1 code
          attr_accessor :responseCode        # 0-1 string
          attr_accessor :rule                # 0-1 TestScript::Setup::Action::Assert::Rule
          attr_accessor :ruleset             # 0-1 TestScript::Setup::Action::Assert::Ruleset
          attr_accessor :sourceId            # 0-1 id
          attr_accessor :validateProfileId   # 0-1 id
          attr_accessor :value               # 0-1 string
          attr_accessor :warningOnly         # 0-1 boolean
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :operation         # 0-1 TestScript::Setup::Action::Operation
        attr_accessor :assert            # 0-1 TestScript::Setup::Action::Assert
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :metadata          # 0-1 TestScript::Metadata
      attr_accessor :action            # 1-* [ TestScript::Setup::Action ]
    end

    class Test < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Test.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Test.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Test.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Test.name', 'min'=>0, 'max'=>1},
        'description' => {'type'=>'string', 'path'=>'Test.description', 'min'=>0, 'max'=>1},
        'metadata' => {'type'=>'TestScript::Metadata', 'path'=>'Test.metadata', 'min'=>0, 'max'=>1},
        'action' => {'type'=>'TestScript::Test::Action', 'path'=>'Test.action', 'min'=>1, 'max'=>Float::INFINITY}
      }

      class Action < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Action.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Action.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Action.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'operation' => {'type'=>'TestScript::Setup::Action::Operation', 'path'=>'Action.operation', 'min'=>0, 'max'=>1},
          'assert' => {'type'=>'TestScript::Setup::Action::Assert', 'path'=>'Action.assert', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :operation         # 0-1 TestScript::Setup::Action::Operation
        attr_accessor :assert            # 0-1 TestScript::Setup::Action::Assert
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 0-1 string
      attr_accessor :description       # 0-1 string
      attr_accessor :metadata          # 0-1 TestScript::Metadata
      attr_accessor :action            # 1-* [ TestScript::Test::Action ]
    end

    class Teardown < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Teardown.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Teardown.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Teardown.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'action' => {'type'=>'TestScript::Teardown::Action', 'path'=>'Teardown.action', 'min'=>1, 'max'=>Float::INFINITY}
      }

      class Action < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Action.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Action.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Action.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'operation' => {'type'=>'TestScript::Setup::Action::Operation', 'path'=>'Action.operation', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :operation         # 0-1 TestScript::Setup::Action::Operation
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :action            # 1-* [ TestScript::Teardown::Action ]
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
    attr_accessor :version           # 0-1 string
    attr_accessor :name              # 1-1 string
    attr_accessor :status            # 1-1 code
    attr_accessor :identifier        # 0-1 Identifier
    attr_accessor :experimental      # 0-1 boolean
    attr_accessor :publisher         # 0-1 string
    attr_accessor :contact           # 0-* [ TestScript::Contact ]
    attr_accessor :date              # 0-1 dateTime
    attr_accessor :description       # 0-1 string
    attr_accessor :useContext        # 0-* [ CodeableConcept ]
    attr_accessor :requirements      # 0-1 string
    attr_accessor :copyright         # 0-1 string
    attr_accessor :origin            # 0-* [ TestScript::Origin ]
    attr_accessor :destination       # 0-* [ TestScript::Destination ]
    attr_accessor :metadata          # 0-1 TestScript::Metadata
    attr_accessor :fixture           # 0-* [ TestScript::Fixture ]
    attr_accessor :profile           # 0-* [ Reference(Resource) ]
    attr_accessor :variable          # 0-* [ TestScript::Variable ]
    attr_accessor :rule              # 0-* [ TestScript::Rule ]
    attr_accessor :ruleset           # 0-* [ TestScript::Ruleset ]
    attr_accessor :setup             # 0-1 TestScript::Setup
    attr_accessor :test              # 0-* [ TestScript::Test ]
    attr_accessor :teardown          # 0-1 TestScript::Teardown

    def resourceType
      'TestScript'
    end
  end
end