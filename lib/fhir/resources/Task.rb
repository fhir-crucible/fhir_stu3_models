module FHIR
  class Task < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["code", "created", "definition", "focus", "identifier", "modified", "owner", "parent", "patient", "performer", "priority", "requester", "stage", "status", "statusreason"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Task.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Task.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Task.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Task.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Task.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Task.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Task.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Task.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Task.identifier', 'min'=>0, 'max'=>1},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Task.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'requisition' => {'type'=>'Identifier', 'path'=>'Task.requisition', 'min'=>0, 'max'=>1},
      'parent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Task'], 'type'=>'Reference', 'path'=>'Task.parent', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/task-status'=>['draft', 'requested', 'received', 'accepted', 'rejected', 'ready', 'in-progress', 'on-hold', 'failed', 'completed', 'draft', 'requested', 'received', 'accepted', 'rejected', 'ready', 'in-progress', 'on-hold', 'failed', 'completed']}, 'type'=>'code', 'path'=>'Task.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/task-status'}},
      'statusReason' => {'type'=>'CodeableConcept', 'path'=>'Task.statusReason', 'min'=>0, 'max'=>1},
      'businessStatus' => {'type'=>'CodeableConcept', 'path'=>'Task.businessStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'stage' => {'valid_codes'=>{'http://hl7.org/fhir/task-stage'=>['proposal', 'planned', 'actionable', 'proposal', 'planned', 'actionable']}, 'type'=>'CodeableConcept', 'path'=>'Task.stage', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/task-stage'}},
      'code' => {'type'=>'CodeableConcept', 'path'=>'Task.code', 'min'=>0, 'max'=>1},
      'priority' => {'valid_codes'=>{'http://hl7.org/fhir/task-priority'=>['low', 'normal', 'high', 'low', 'normal', 'high']}, 'type'=>'code', 'path'=>'Task.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/task-priority'}},
      'description' => {'type'=>'string', 'path'=>'Task.description', 'min'=>0, 'max'=>1},
      'focus' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Task.focus', 'min'=>0, 'max'=>1},
      'for' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Task.for', 'min'=>0, 'max'=>1},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'Task.context', 'min'=>0, 'max'=>1},
      'created' => {'type'=>'dateTime', 'path'=>'Task.created', 'min'=>1, 'max'=>1},
      'lastModified' => {'type'=>'dateTime', 'path'=>'Task.lastModified', 'min'=>1, 'max'=>1},
      'requester' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Task.requester', 'min'=>1, 'max'=>1},
      'owner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Task.owner', 'min'=>0, 'max'=>1},
      'performerType' => {'valid_codes'=>{'http://hl7.org/fhir/task-performer-type'=>['requester', 'dispatcher', 'scheduler', 'performer', 'monitor', 'manager', 'acquirer', 'reviewer', 'requester', 'dispatcher', 'performer', 'monitor', 'manager', 'acquirer', 'reviewer']}, 'type'=>'CodeableConcept', 'path'=>'Task.performerType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/task-performer-type'}},
      'reason' => {'type'=>'CodeableConcept', 'path'=>'Task.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'note' => {'type'=>'Annotation', 'path'=>'Task.note', 'min'=>0, 'max'=>Float::INFINITY},
      'fulfillment' => {'type'=>'Task::Fulfillment', 'path'=>'Task.fulfillment', 'min'=>0, 'max'=>1},
      'definition' => {'type'=>'uri', 'path'=>'Task.definition', 'min'=>0, 'max'=>1},
      'input' => {'type'=>'Task::Input', 'path'=>'Task.input', 'min'=>0, 'max'=>Float::INFINITY},
      'output' => {'type'=>'Task::Output', 'path'=>'Task.output', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Fulfillment < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Fulfillment.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Fulfillment.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Fulfillment.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'repetitions' => {'type'=>'positiveInt', 'path'=>'Fulfillment.repetitions', 'min'=>0, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'Fulfillment.period', 'min'=>0, 'max'=>1},
        'recipients' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Fulfillment.recipients', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :repetitions       # 0-1 positiveInt
      attr_accessor :period            # 0-1 Period
      attr_accessor :recipients        # 0-* [ Reference(Patient|Practitioner|RelatedPerson|Group|Organization) ]
    end

    class Input < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'value' => ['base64Binary', 'boolean', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'Address', 'Age', 'Annotation', 'Attachment', 'CodeableConcept', 'Coding', 'ContactPoint', 'Count', 'Distance', 'Duration', 'HumanName', 'Identifier', 'Money', 'Period', 'Quantity', 'Range', 'Ratio', 'Reference', 'SampledData', 'Signature', 'Timing', 'Meta']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Input.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Input.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Input.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Input.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
        'valueBase64Binary' => {'type'=>'base64Binary', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueBoolean' => {'type'=>'boolean', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueCode' => {'type'=>'code', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueDate' => {'type'=>'date', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueDateTime' => {'type'=>'dateTime', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueDecimal' => {'type'=>'decimal', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueId' => {'type'=>'id', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueInstant' => {'type'=>'instant', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueInteger' => {'type'=>'integer', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueMarkdown' => {'type'=>'markdown', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueOid' => {'type'=>'oid', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valuePositiveInt' => {'type'=>'positiveInt', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueString' => {'type'=>'string', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueTime' => {'type'=>'time', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueUri' => {'type'=>'uri', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueAddress' => {'type'=>'Address', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueAge' => {'type'=>'Age', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueAnnotation' => {'type'=>'Annotation', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueAttachment' => {'type'=>'Attachment', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueCoding' => {'type'=>'Coding', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueContactPoint' => {'type'=>'ContactPoint', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueCount' => {'type'=>'Count', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueDistance' => {'type'=>'Distance', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueDuration' => {'type'=>'Duration', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueHumanName' => {'type'=>'HumanName', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueIdentifier' => {'type'=>'Identifier', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueMoney' => {'type'=>'Money', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valuePeriod' => {'type'=>'Period', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueQuantity' => {'type'=>'Quantity', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueRange' => {'type'=>'Range', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueRatio' => {'type'=>'Ratio', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueReference' => {'type'=>'Reference', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueSampledData' => {'type'=>'SampledData', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueSignature' => {'type'=>'Signature', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueTiming' => {'type'=>'Timing', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueMeta' => {'type'=>'Meta', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                   # 0-1 string
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :type                 # 1-1 CodeableConcept
      attr_accessor :valueBase64Binary    # 1-1 base64Binary
      attr_accessor :valueBoolean         # 1-1 boolean
      attr_accessor :valueCode            # 1-1 code
      attr_accessor :valueDate            # 1-1 date
      attr_accessor :valueDateTime        # 1-1 dateTime
      attr_accessor :valueDecimal         # 1-1 decimal
      attr_accessor :valueId              # 1-1 id
      attr_accessor :valueInstant         # 1-1 instant
      attr_accessor :valueInteger         # 1-1 integer
      attr_accessor :valueMarkdown        # 1-1 markdown
      attr_accessor :valueOid             # 1-1 oid
      attr_accessor :valuePositiveInt     # 1-1 positiveInt
      attr_accessor :valueString          # 1-1 string
      attr_accessor :valueTime            # 1-1 time
      attr_accessor :valueUnsignedInt     # 1-1 unsignedInt
      attr_accessor :valueUri             # 1-1 uri
      attr_accessor :valueAddress         # 1-1 Address
      attr_accessor :valueAge             # 1-1 Age
      attr_accessor :valueAnnotation      # 1-1 Annotation
      attr_accessor :valueAttachment      # 1-1 Attachment
      attr_accessor :valueCodeableConcept # 1-1 CodeableConcept
      attr_accessor :valueCoding          # 1-1 Coding
      attr_accessor :valueContactPoint    # 1-1 ContactPoint
      attr_accessor :valueCount           # 1-1 Count
      attr_accessor :valueDistance        # 1-1 Distance
      attr_accessor :valueDuration        # 1-1 Duration
      attr_accessor :valueHumanName       # 1-1 HumanName
      attr_accessor :valueIdentifier      # 1-1 Identifier
      attr_accessor :valueMoney           # 1-1 Money
      attr_accessor :valuePeriod          # 1-1 Period
      attr_accessor :valueQuantity        # 1-1 Quantity
      attr_accessor :valueRange           # 1-1 Range
      attr_accessor :valueRatio           # 1-1 Ratio
      attr_accessor :valueReference       # 1-1 Reference()
      attr_accessor :valueSampledData     # 1-1 SampledData
      attr_accessor :valueSignature       # 1-1 Signature
      attr_accessor :valueTiming          # 1-1 Timing
      attr_accessor :valueMeta            # 1-1 Meta
    end

    class Output < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'value' => ['base64Binary', 'boolean', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'Address', 'Age', 'Annotation', 'Attachment', 'CodeableConcept', 'Coding', 'ContactPoint', 'Count', 'Distance', 'Duration', 'HumanName', 'Identifier', 'Money', 'Period', 'Quantity', 'Range', 'Ratio', 'Reference', 'SampledData', 'Signature', 'Timing', 'Meta']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Output.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Output.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Output.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Output.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
        'valueBase64Binary' => {'type'=>'base64Binary', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueBoolean' => {'type'=>'boolean', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueCode' => {'type'=>'code', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueDate' => {'type'=>'date', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueDateTime' => {'type'=>'dateTime', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueDecimal' => {'type'=>'decimal', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueId' => {'type'=>'id', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueInstant' => {'type'=>'instant', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueInteger' => {'type'=>'integer', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueMarkdown' => {'type'=>'markdown', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueOid' => {'type'=>'oid', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valuePositiveInt' => {'type'=>'positiveInt', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueString' => {'type'=>'string', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueTime' => {'type'=>'time', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueUri' => {'type'=>'uri', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueAddress' => {'type'=>'Address', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueAge' => {'type'=>'Age', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueAnnotation' => {'type'=>'Annotation', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueAttachment' => {'type'=>'Attachment', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueCoding' => {'type'=>'Coding', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueContactPoint' => {'type'=>'ContactPoint', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueCount' => {'type'=>'Count', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueDistance' => {'type'=>'Distance', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueDuration' => {'type'=>'Duration', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueHumanName' => {'type'=>'HumanName', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueIdentifier' => {'type'=>'Identifier', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueMoney' => {'type'=>'Money', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valuePeriod' => {'type'=>'Period', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueQuantity' => {'type'=>'Quantity', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueRange' => {'type'=>'Range', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueRatio' => {'type'=>'Ratio', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueReference' => {'type'=>'Reference', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueSampledData' => {'type'=>'SampledData', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueSignature' => {'type'=>'Signature', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueTiming' => {'type'=>'Timing', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueMeta' => {'type'=>'Meta', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                   # 0-1 string
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :type                 # 1-1 CodeableConcept
      attr_accessor :valueBase64Binary    # 1-1 base64Binary
      attr_accessor :valueBoolean         # 1-1 boolean
      attr_accessor :valueCode            # 1-1 code
      attr_accessor :valueDate            # 1-1 date
      attr_accessor :valueDateTime        # 1-1 dateTime
      attr_accessor :valueDecimal         # 1-1 decimal
      attr_accessor :valueId              # 1-1 id
      attr_accessor :valueInstant         # 1-1 instant
      attr_accessor :valueInteger         # 1-1 integer
      attr_accessor :valueMarkdown        # 1-1 markdown
      attr_accessor :valueOid             # 1-1 oid
      attr_accessor :valuePositiveInt     # 1-1 positiveInt
      attr_accessor :valueString          # 1-1 string
      attr_accessor :valueTime            # 1-1 time
      attr_accessor :valueUnsignedInt     # 1-1 unsignedInt
      attr_accessor :valueUri             # 1-1 uri
      attr_accessor :valueAddress         # 1-1 Address
      attr_accessor :valueAge             # 1-1 Age
      attr_accessor :valueAnnotation      # 1-1 Annotation
      attr_accessor :valueAttachment      # 1-1 Attachment
      attr_accessor :valueCodeableConcept # 1-1 CodeableConcept
      attr_accessor :valueCoding          # 1-1 Coding
      attr_accessor :valueContactPoint    # 1-1 ContactPoint
      attr_accessor :valueCount           # 1-1 Count
      attr_accessor :valueDistance        # 1-1 Distance
      attr_accessor :valueDuration        # 1-1 Duration
      attr_accessor :valueHumanName       # 1-1 HumanName
      attr_accessor :valueIdentifier      # 1-1 Identifier
      attr_accessor :valueMoney           # 1-1 Money
      attr_accessor :valuePeriod          # 1-1 Period
      attr_accessor :valueQuantity        # 1-1 Quantity
      attr_accessor :valueRange           # 1-1 Range
      attr_accessor :valueRatio           # 1-1 Ratio
      attr_accessor :valueReference       # 1-1 Reference()
      attr_accessor :valueSampledData     # 1-1 SampledData
      attr_accessor :valueSignature       # 1-1 Signature
      attr_accessor :valueTiming          # 1-1 Timing
      attr_accessor :valueMeta            # 1-1 Meta
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :identifier        # 0-1 Identifier
    attr_accessor :basedOn           # 0-* [ Reference(Resource) ]
    attr_accessor :requisition       # 0-1 Identifier
    attr_accessor :parent            # 0-* [ Reference(Task) ]
    attr_accessor :status            # 1-1 code
    attr_accessor :statusReason      # 0-1 CodeableConcept
    attr_accessor :businessStatus    # 0-1 CodeableConcept
    attr_accessor :stage             # 1-1 CodeableConcept
    attr_accessor :code              # 0-1 CodeableConcept
    attr_accessor :priority          # 0-1 code
    attr_accessor :description       # 0-1 string
    attr_accessor :focus             # 0-1 Reference(Resource)
    attr_accessor :for               # 0-1 Reference(Resource)
    attr_accessor :context           # 0-1 Reference(Encounter|EpisodeOfCare)
    attr_accessor :created           # 1-1 dateTime
    attr_accessor :lastModified      # 1-1 dateTime
    attr_accessor :requester         # 1-1 Reference(Device|Organization|Patient|Practitioner|RelatedPerson)
    attr_accessor :owner             # 0-1 Reference(Device|Organization|Patient|Practitioner|RelatedPerson)
    attr_accessor :performerType     # 0-* [ CodeableConcept ]
    attr_accessor :reason            # 0-1 CodeableConcept
    attr_accessor :note              # 0-* [ Annotation ]
    attr_accessor :fulfillment       # 0-1 Task::Fulfillment
    attr_accessor :definition        # 0-1 uri
    attr_accessor :input             # 0-* [ Task::Input ]
    attr_accessor :output            # 0-* [ Task::Output ]

    def resourceType
      'Task'
    end
  end
end