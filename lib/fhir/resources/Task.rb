module FHIR
  class Task < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["created", "creator", "definition", "failure", "identifier", "modified", "owner", "parent", "performer", "priority", "status", "subject", "type"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Task.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Task.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Task.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Task.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'Task.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Task.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Task.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Task.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Task.identifier', 'min'=>0, 'max'=>1},
      'type' => {'type'=>'CodeableConcept', 'path'=>'Task.type', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'Task.description', 'min'=>0, 'max'=>1},
      'performerType' => {'valid_codes'=>{'http://hl7.org/fhir/task-performer-type'=>['requester', 'dispatcher', 'scheduler', 'performer', 'monitor', 'manager', 'acquirer', 'reviewer']}, 'type'=>'Coding', 'path'=>'Task.performerType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/task-performer-type'}},
      'priority' => {'valid_codes'=>{'http://hl7.org/fhir/task-priority'=>['low', 'normal', 'high']}, 'type'=>'code', 'path'=>'Task.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/task-priority'}},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/task-status'=>['draft', 'requested', 'received', 'accepted', 'rejected', 'ready', 'in-progress', 'on-hold', 'failed', 'completed']}, 'type'=>'code', 'path'=>'Task.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/task-status'}},
      'failureReason' => {'type'=>'CodeableConcept', 'path'=>'Task.failureReason', 'min'=>0, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Task.subject', 'min'=>0, 'max'=>1},
      'for' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Task.for', 'min'=>0, 'max'=>1},
      'definition' => {'type'=>'uri', 'path'=>'Task.definition', 'min'=>0, 'max'=>1},
      'created' => {'type'=>'dateTime', 'path'=>'Task.created', 'min'=>1, 'max'=>1},
      'lastModified' => {'type'=>'dateTime', 'path'=>'Task.lastModified', 'min'=>1, 'max'=>1},
      'creator' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Task.creator', 'min'=>1, 'max'=>1},
      'owner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Task.owner', 'min'=>0, 'max'=>1},
      'parent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Task'], 'type'=>'Reference', 'path'=>'Task.parent', 'min'=>0, 'max'=>1},
      'input' => {'type'=>'Task::Input', 'path'=>'Task.input', 'min'=>0, 'max'=>Float::INFINITY},
      'output' => {'type'=>'Task::Output', 'path'=>'Task.output', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Input < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'value' => ['boolean', 'integer', 'decimal', 'base64Binary', 'instant', 'string', 'uri', 'date', 'dateTime', 'time', 'code', 'oid', 'id', 'unsignedInt', 'positiveInt', 'markdown', 'Annotation', 'Attachment', 'Identifier', 'CodeableConcept', 'Coding', 'Quantity', 'Range', 'Period', 'Ratio', 'SampledData', 'Signature', 'HumanName', 'Address', 'ContactPoint', 'Timing', 'Reference', 'Meta']
      }
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Input.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Input.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Input.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Input.name', 'min'=>1, 'max'=>1},
        'valueBoolean' => {'type'=>'boolean', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueInteger' => {'type'=>'integer', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueDecimal' => {'type'=>'decimal', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueBase64Binary' => {'type'=>'base64Binary', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueInstant' => {'type'=>'instant', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueString' => {'type'=>'string', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueUri' => {'type'=>'uri', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueDate' => {'type'=>'date', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueDateTime' => {'type'=>'dateTime', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueTime' => {'type'=>'time', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueCode' => {'type'=>'code', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueOid' => {'type'=>'oid', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueId' => {'type'=>'id', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valuePositiveInt' => {'type'=>'positiveInt', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueMarkdown' => {'type'=>'markdown', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueAnnotation' => {'type'=>'Annotation', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueAttachment' => {'type'=>'Attachment', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueIdentifier' => {'type'=>'Identifier', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueCoding' => {'type'=>'Coding', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueQuantity' => {'type'=>'Quantity', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueRange' => {'type'=>'Range', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valuePeriod' => {'type'=>'Period', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueRatio' => {'type'=>'Ratio', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueSampledData' => {'type'=>'SampledData', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueSignature' => {'type'=>'Signature', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueHumanName' => {'type'=>'HumanName', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueAddress' => {'type'=>'Address', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueContactPoint' => {'type'=>'ContactPoint', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueTiming' => {'type'=>'Timing', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueReference' => {'type'=>'Reference', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueMeta' => {'type'=>'Meta', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                   # 0-1 id
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :name                 # 1-1 string
      attr_accessor :valueBoolean         # 1-1 boolean
      attr_accessor :valueInteger         # 1-1 integer
      attr_accessor :valueDecimal         # 1-1 decimal
      attr_accessor :valueBase64Binary    # 1-1 base64Binary
      attr_accessor :valueInstant         # 1-1 instant
      attr_accessor :valueString          # 1-1 string
      attr_accessor :valueUri             # 1-1 uri
      attr_accessor :valueDate            # 1-1 date
      attr_accessor :valueDateTime        # 1-1 dateTime
      attr_accessor :valueTime            # 1-1 time
      attr_accessor :valueCode            # 1-1 code
      attr_accessor :valueOid             # 1-1 oid
      attr_accessor :valueId              # 1-1 id
      attr_accessor :valueUnsignedInt     # 1-1 unsignedInt
      attr_accessor :valuePositiveInt     # 1-1 positiveInt
      attr_accessor :valueMarkdown        # 1-1 markdown
      attr_accessor :valueAnnotation      # 1-1 Annotation
      attr_accessor :valueAttachment      # 1-1 Attachment
      attr_accessor :valueIdentifier      # 1-1 Identifier
      attr_accessor :valueCodeableConcept # 1-1 CodeableConcept
      attr_accessor :valueCoding          # 1-1 Coding
      attr_accessor :valueQuantity        # 1-1 Quantity
      attr_accessor :valueRange           # 1-1 Range
      attr_accessor :valuePeriod          # 1-1 Period
      attr_accessor :valueRatio           # 1-1 Ratio
      attr_accessor :valueSampledData     # 1-1 SampledData
      attr_accessor :valueSignature       # 1-1 Signature
      attr_accessor :valueHumanName       # 1-1 HumanName
      attr_accessor :valueAddress         # 1-1 Address
      attr_accessor :valueContactPoint    # 1-1 ContactPoint
      attr_accessor :valueTiming          # 1-1 Timing
      attr_accessor :valueReference       # 1-1 Reference()
      attr_accessor :valueMeta            # 1-1 Meta
    end

    class Output < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'value' => ['boolean', 'integer', 'decimal', 'base64Binary', 'instant', 'string', 'uri', 'date', 'dateTime', 'time', 'code', 'oid', 'id', 'unsignedInt', 'positiveInt', 'markdown', 'Annotation', 'Attachment', 'Identifier', 'CodeableConcept', 'Coding', 'Quantity', 'Range', 'Period', 'Ratio', 'SampledData', 'Signature', 'HumanName', 'Address', 'ContactPoint', 'Timing', 'Reference', 'Meta']
      }
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Output.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Output.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Output.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Output.name', 'min'=>1, 'max'=>1},
        'valueBoolean' => {'type'=>'boolean', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueInteger' => {'type'=>'integer', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueDecimal' => {'type'=>'decimal', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueBase64Binary' => {'type'=>'base64Binary', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueInstant' => {'type'=>'instant', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueString' => {'type'=>'string', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueUri' => {'type'=>'uri', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueDate' => {'type'=>'date', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueDateTime' => {'type'=>'dateTime', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueTime' => {'type'=>'time', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueCode' => {'type'=>'code', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueOid' => {'type'=>'oid', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueId' => {'type'=>'id', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valuePositiveInt' => {'type'=>'positiveInt', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueMarkdown' => {'type'=>'markdown', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueAnnotation' => {'type'=>'Annotation', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueAttachment' => {'type'=>'Attachment', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueIdentifier' => {'type'=>'Identifier', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueCoding' => {'type'=>'Coding', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueQuantity' => {'type'=>'Quantity', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueRange' => {'type'=>'Range', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valuePeriod' => {'type'=>'Period', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueRatio' => {'type'=>'Ratio', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueSampledData' => {'type'=>'SampledData', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueSignature' => {'type'=>'Signature', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueHumanName' => {'type'=>'HumanName', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueAddress' => {'type'=>'Address', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueContactPoint' => {'type'=>'ContactPoint', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueTiming' => {'type'=>'Timing', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueReference' => {'type'=>'Reference', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueMeta' => {'type'=>'Meta', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                   # 0-1 id
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :name                 # 1-1 string
      attr_accessor :valueBoolean         # 1-1 boolean
      attr_accessor :valueInteger         # 1-1 integer
      attr_accessor :valueDecimal         # 1-1 decimal
      attr_accessor :valueBase64Binary    # 1-1 base64Binary
      attr_accessor :valueInstant         # 1-1 instant
      attr_accessor :valueString          # 1-1 string
      attr_accessor :valueUri             # 1-1 uri
      attr_accessor :valueDate            # 1-1 date
      attr_accessor :valueDateTime        # 1-1 dateTime
      attr_accessor :valueTime            # 1-1 time
      attr_accessor :valueCode            # 1-1 code
      attr_accessor :valueOid             # 1-1 oid
      attr_accessor :valueId              # 1-1 id
      attr_accessor :valueUnsignedInt     # 1-1 unsignedInt
      attr_accessor :valuePositiveInt     # 1-1 positiveInt
      attr_accessor :valueMarkdown        # 1-1 markdown
      attr_accessor :valueAnnotation      # 1-1 Annotation
      attr_accessor :valueAttachment      # 1-1 Attachment
      attr_accessor :valueIdentifier      # 1-1 Identifier
      attr_accessor :valueCodeableConcept # 1-1 CodeableConcept
      attr_accessor :valueCoding          # 1-1 Coding
      attr_accessor :valueQuantity        # 1-1 Quantity
      attr_accessor :valueRange           # 1-1 Range
      attr_accessor :valuePeriod          # 1-1 Period
      attr_accessor :valueRatio           # 1-1 Ratio
      attr_accessor :valueSampledData     # 1-1 SampledData
      attr_accessor :valueSignature       # 1-1 Signature
      attr_accessor :valueHumanName       # 1-1 HumanName
      attr_accessor :valueAddress         # 1-1 Address
      attr_accessor :valueContactPoint    # 1-1 ContactPoint
      attr_accessor :valueTiming          # 1-1 Timing
      attr_accessor :valueReference       # 1-1 Reference()
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
    attr_accessor :type              # 0-1 CodeableConcept
    attr_accessor :description       # 0-1 string
    attr_accessor :performerType     # 0-* [ Coding ]
    attr_accessor :priority          # 0-1 code
    attr_accessor :status            # 1-1 code
    attr_accessor :failureReason     # 0-1 CodeableConcept
    attr_accessor :subject           # 0-1 Reference(Resource)
    attr_accessor :for               # 0-1 Reference(Resource)
    attr_accessor :definition        # 0-1 uri
    attr_accessor :created           # 1-1 dateTime
    attr_accessor :lastModified      # 1-1 dateTime
    attr_accessor :creator           # 1-1 Reference(Device|Organization|Patient|Practitioner|RelatedPerson)
    attr_accessor :owner             # 0-1 Reference(Device|Organization|Patient|Practitioner|RelatedPerson)
    attr_accessor :parent            # 0-1 Reference(Task)
    attr_accessor :input             # 0-* [ Task::Input ]
    attr_accessor :output            # 0-* [ Task::Output ]

    def resourceType
      'Task'
    end
  end
end