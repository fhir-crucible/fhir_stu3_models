module FHIR
  class Library < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["description", "identifier", "status", "title", "topic", "version"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Library.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Library.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Library.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Library.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'Library.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Library.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Library.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Library.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'moduleMetadata' => {'type'=>'ModuleMetadata', 'path'=>'Library.moduleMetadata', 'min'=>0, 'max'=>1},
      'model' => {'type'=>'Library::Model', 'path'=>'Library.model', 'min'=>0, 'max'=>Float::INFINITY},
      'library' => {'type'=>'Library::Library', 'path'=>'Library.library', 'min'=>0, 'max'=>Float::INFINITY},
      'codeSystem' => {'type'=>'Library::Codesystem', 'path'=>'Library.codeSystem', 'min'=>0, 'max'=>Float::INFINITY},
      'valueSet' => {'type'=>'Library::Valueset', 'path'=>'Library.valueSet', 'min'=>0, 'max'=>Float::INFINITY},
      'parameter' => {'type'=>'ParameterDefinition', 'path'=>'Library.parameter', 'min'=>0, 'max'=>Float::INFINITY},
      'dataRequirement' => {'type'=>'DataRequirement', 'path'=>'Library.dataRequirement', 'min'=>0, 'max'=>Float::INFINITY},
      'document' => {'type'=>'Attachment', 'path'=>'Library.document', 'min'=>1, 'max'=>1}
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
        'identifier' => {'type'=>'string', 'path'=>'Library.identifier', 'min'=>1, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'Library.version', 'min'=>0, 'max'=>1},
        'documentAttachment' => {'type'=>'Attachment', 'path'=>'Library.document[x]', 'min'=>0, 'max'=>1},
        'documentReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ModuleDefinition'], 'type'=>'Reference', 'path'=>'Library.document[x]', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                 # 0-1 id
      attr_accessor :extension          # 0-* [ Extension ]
      attr_accessor :modifierExtension  # 0-* [ Extension ]
      attr_accessor :name               # 0-1 string
      attr_accessor :identifier         # 1-1 string
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
        'name' => {'type'=>'string', 'path'=>'Codesystem.name', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'string', 'path'=>'Codesystem.identifier', 'min'=>1, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'Codesystem.version', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 0-1 string
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
        'name' => {'type'=>'string', 'path'=>'Valueset.name', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'string', 'path'=>'Valueset.identifier', 'min'=>1, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'Valueset.version', 'min'=>0, 'max'=>1},
        'codeSystem' => {'type'=>'string', 'path'=>'Valueset.codeSystem', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 0-1 string
      attr_accessor :identifier        # 1-1 string
      attr_accessor :version           # 0-1 string
      attr_accessor :codeSystem        # 0-* [ string ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :moduleMetadata    # 0-1 ModuleMetadata
    attr_accessor :model             # 0-* [ Library::Model ]
    attr_accessor :library           # 0-* [ Library::Library ]
    attr_accessor :codeSystem        # 0-* [ Library::Codesystem ]
    attr_accessor :valueSet          # 0-* [ Library::Valueset ]
    attr_accessor :parameter         # 0-* [ ParameterDefinition ]
    attr_accessor :dataRequirement   # 0-* [ DataRequirement ]
    attr_accessor :document          # 1-1 Attachment

    def resourceType
      'Library'
    end
  end
end