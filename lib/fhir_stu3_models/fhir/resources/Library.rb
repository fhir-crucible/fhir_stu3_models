module FHIR
  module STU3
    class Library < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      SEARCH_PARAMS = ['description', 'identifier', 'status', 'title', 'topic', 'version']
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
        'codeSystem' => {'type'=>'Library::CodeSystem', 'path'=>'Library.codeSystem', 'min'=>0, 'max'=>Float::INFINITY},
        'valueSet' => {'type'=>'Library::ValueSet', 'path'=>'Library.valueSet', 'min'=>0, 'max'=>Float::INFINITY},
        'parameter' => {'type'=>'ParameterDefinition', 'path'=>'Library.parameter', 'min'=>0, 'max'=>Float::INFINITY},
        'dataRequirement' => {'type'=>'DataRequirement', 'path'=>'Library.dataRequirement', 'min'=>0, 'max'=>Float::INFINITY},
        'document' => {'type'=>'Attachment', 'path'=>'Library.document', 'min'=>1, 'max'=>1}
      }

      class Model < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

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

      class Library < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

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
          'documentReference' => {'type'=>'Reference', 'path'=>'Library.document[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                 # 0-1 id
        attr_accessor :extension          # 0-* [ Extension ]
        attr_accessor :modifierExtension  # 0-* [ Extension ]
        attr_accessor :name               # 0-1 string
        attr_accessor :identifier         # 1-1 string
        attr_accessor :version            # 0-1 string
        attr_accessor :documentAttachment # 0-1 Attachment
        attr_accessor :documentReference  # 0-1 Reference()
      end

      class CodeSystem < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'CodeSystem.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'CodeSystem.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'CodeSystem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'CodeSystem.name', 'min'=>0, 'max'=>1},
          'identifier' => {'type'=>'string', 'path'=>'CodeSystem.identifier', 'min'=>1, 'max'=>1},
          'version' => {'type'=>'string', 'path'=>'CodeSystem.version', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 0-1 string
        attr_accessor :identifier        # 1-1 string
        attr_accessor :version           # 0-1 string
      end

      class ValueSet < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'ValueSet.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ValueSet.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'ValueSet.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'ValueSet.name', 'min'=>0, 'max'=>1},
          'identifier' => {'type'=>'string', 'path'=>'ValueSet.identifier', 'min'=>1, 'max'=>1},
          'version' => {'type'=>'string', 'path'=>'ValueSet.version', 'min'=>0, 'max'=>1},
          'codeSystem' => {'type'=>'string', 'path'=>'ValueSet.codeSystem', 'min'=>0, 'max'=>Float::INFINITY}
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
      attr_accessor :codeSystem        # 0-* [ Library::CodeSystem ]
      attr_accessor :valueSet          # 0-* [ Library::ValueSet ]
      attr_accessor :parameter         # 0-* [ ParameterDefinition ]
      attr_accessor :dataRequirement   # 0-* [ DataRequirement ]
      attr_accessor :document          # 1-1 Attachment

      def resourceType
        'Library'
      end
    end
  end
end