module FHIR
  class StructureMap < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["context", "date", "description", "experimental", "identifier", "name", "publisher", "status", "url", "version"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'StructureMap.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'StructureMap.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'StructureMap.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'StructureMap.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'StructureMap.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'StructureMap.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'StructureMap.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'StructureMap.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'StructureMap.url', 'min'=>1, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'StructureMap.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'StructureMap.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'StructureMap.name', 'min'=>1, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/conformance-resource-status'=>['draft', 'active', 'retired']}, 'type'=>'code', 'path'=>'StructureMap.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conformance-resource-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'StructureMap.experimental', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'StructureMap.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'StructureMap::Contact', 'path'=>'StructureMap.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'date' => {'type'=>'dateTime', 'path'=>'StructureMap.date', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'StructureMap.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'CodeableConcept', 'path'=>'StructureMap.useContext', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/use-context'}},
      'requirements' => {'type'=>'string', 'path'=>'StructureMap.requirements', 'min'=>0, 'max'=>1},
      'copyright' => {'type'=>'string', 'path'=>'StructureMap.copyright', 'min'=>0, 'max'=>1},
      'structure' => {'type'=>'StructureMap::Structure', 'path'=>'StructureMap.structure', 'min'=>0, 'max'=>Float::INFINITY},
      'import' => {'type'=>'uri', 'path'=>'StructureMap.import', 'min'=>0, 'max'=>Float::INFINITY},
      'group' => {'type'=>'StructureMap::Group', 'path'=>'StructureMap.group', 'min'=>1, 'max'=>Float::INFINITY}
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

    class Structure < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Structure.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Structure.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Structure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'Structure.url', 'min'=>1, 'max'=>1},
        'mode' => {'valid_codes'=>{'http://hl7.org/fhir/map-model-mode'=>['source', 'queried', 'target', 'produced']}, 'type'=>'code', 'path'=>'Structure.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-model-mode'}},
        'documentation' => {'type'=>'string', 'path'=>'Structure.documentation', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :url               # 1-1 uri
      attr_accessor :mode              # 1-1 code
      attr_accessor :documentation     # 0-1 string
    end

    class Group < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Group.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Group.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Group.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'id', 'path'=>'Group.name', 'min'=>1, 'max'=>1},
        'extends' => {'type'=>'id', 'path'=>'Group.extends', 'min'=>0, 'max'=>1},
        'documentation' => {'type'=>'string', 'path'=>'Group.documentation', 'min'=>0, 'max'=>1},
        'input' => {'type'=>'StructureMap::Group::Input', 'path'=>'Group.input', 'min'=>1, 'max'=>Float::INFINITY},
        'rule' => {'type'=>'StructureMap::Group::Rule', 'path'=>'Group.rule', 'min'=>1, 'max'=>Float::INFINITY}
      }

      class Input < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Input.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Input.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Input.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'id', 'path'=>'Input.name', 'min'=>1, 'max'=>1},
          'type' => {'type'=>'string', 'path'=>'Input.type', 'min'=>0, 'max'=>1},
          'mode' => {'valid_codes'=>{'http://hl7.org/fhir/map-input-mode'=>['source', 'target']}, 'type'=>'code', 'path'=>'Input.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-input-mode'}},
          'documentation' => {'type'=>'string', 'path'=>'Input.documentation', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 1-1 id
        attr_accessor :type              # 0-1 string
        attr_accessor :mode              # 1-1 code
        attr_accessor :documentation     # 0-1 string
      end

      class Rule < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Rule.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Rule.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Rule.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'id', 'path'=>'Rule.name', 'min'=>1, 'max'=>1},
          'source' => {'type'=>'StructureMap::Group::Rule::Source', 'path'=>'Rule.source', 'min'=>1, 'max'=>Float::INFINITY},
          'target' => {'type'=>'StructureMap::Group::Rule::Target', 'path'=>'Rule.target', 'min'=>0, 'max'=>Float::INFINITY},
          'rule' => {'type'=>'StructureMap::Group::Rule', 'path'=>'Rule.rule', 'min'=>0, 'max'=>Float::INFINITY},
          'dependent' => {'type'=>'StructureMap::Group::Rule::Dependent', 'path'=>'Rule.dependent', 'min'=>0, 'max'=>Float::INFINITY},
          'documentation' => {'type'=>'string', 'path'=>'Rule.documentation', 'min'=>0, 'max'=>1}
        }

        class Source < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Source.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Source.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Source.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'required' => {'type'=>'boolean', 'path'=>'Source.required', 'min'=>1, 'max'=>1},
            'context' => {'type'=>'id', 'path'=>'Source.context', 'min'=>1, 'max'=>1},
            'contextType' => {'valid_codes'=>{'http://hl7.org/fhir/map-context-type'=>['type', 'variable']}, 'type'=>'code', 'path'=>'Source.contextType', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-context-type'}},
            'element' => {'type'=>'string', 'path'=>'Source.element', 'min'=>0, 'max'=>1},
            'listMode' => {'valid_codes'=>{'http://hl7.org/fhir/map-list-mode'=>['first', 'share', 'last']}, 'type'=>'code', 'path'=>'Source.listMode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-list-mode'}},
            'variable' => {'type'=>'id', 'path'=>'Source.variable', 'min'=>0, 'max'=>1},
            'condition' => {'type'=>'string', 'path'=>'Source.condition', 'min'=>0, 'max'=>1},
            'check' => {'type'=>'string', 'path'=>'Source.check', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :required          # 1-1 boolean
          attr_accessor :context           # 1-1 id
          attr_accessor :contextType       # 1-1 code
          attr_accessor :element           # 0-1 string
          attr_accessor :listMode          # 0-1 code
          attr_accessor :variable          # 0-1 id
          attr_accessor :condition         # 0-1 string
          attr_accessor :check             # 0-1 string
        end

        class Target < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Target.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Target.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Target.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'context' => {'type'=>'id', 'path'=>'Target.context', 'min'=>1, 'max'=>1},
            'contextType' => {'valid_codes'=>{'http://hl7.org/fhir/map-context-type'=>['type', 'variable']}, 'type'=>'code', 'path'=>'Target.contextType', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-context-type'}},
            'element' => {'type'=>'string', 'path'=>'Target.element', 'min'=>0, 'max'=>1},
            'variable' => {'type'=>'id', 'path'=>'Target.variable', 'min'=>0, 'max'=>1},
            'listMode' => {'valid_codes'=>{'http://hl7.org/fhir/map-list-mode'=>['first', 'share', 'last']}, 'type'=>'code', 'path'=>'Target.listMode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-list-mode'}},
            'listRuleId' => {'type'=>'id', 'path'=>'Target.listRuleId', 'min'=>0, 'max'=>1},
            'transform' => {'valid_codes'=>{'http://hl7.org/fhir/map-transform'=>['create', 'copy', 'truncate', 'escape', 'cast', 'append', 'translate', 'reference']}, 'type'=>'code', 'path'=>'Target.transform', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-transform'}},
            'parameter' => {'type'=>'StructureMap::Group::Rule::Target::Parameter', 'path'=>'Target.parameter', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class Parameter < FHIR::Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            MULTIPLE_TYPES = {
              'value' => ['id', 'string', 'boolean', 'integer', 'decimal']
            }
            METADATA = {
              'id' => {'type'=>'id', 'path'=>'Parameter.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Parameter.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Parameter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'valueId' => {'type'=>'id', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
              'valueString' => {'type'=>'string', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
              'valueBoolean' => {'type'=>'boolean', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
              'valueInteger' => {'type'=>'integer', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
              'valueDecimal' => {'type'=>'decimal', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1}
            }

            attr_accessor :id                # 0-1 id
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :valueId           # 1-1 id
            attr_accessor :valueString       # 1-1 string
            attr_accessor :valueBoolean      # 1-1 boolean
            attr_accessor :valueInteger      # 1-1 integer
            attr_accessor :valueDecimal      # 1-1 decimal
          end

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :context           # 1-1 id
          attr_accessor :contextType       # 1-1 code
          attr_accessor :element           # 0-1 string
          attr_accessor :variable          # 0-1 id
          attr_accessor :listMode          # 0-* [ code ]
          attr_accessor :listRuleId        # 0-1 id
          attr_accessor :transform         # 0-1 code
          attr_accessor :parameter         # 0-* [ StructureMap::Group::Rule::Target::Parameter ]
        end

        class Dependent < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Dependent.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Dependent.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Dependent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'name' => {'type'=>'id', 'path'=>'Dependent.name', 'min'=>1, 'max'=>1},
            'variable' => {'type'=>'string', 'path'=>'Dependent.variable', 'min'=>1, 'max'=>Float::INFINITY}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :name              # 1-1 id
          attr_accessor :variable          # 1-* [ string ]
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 1-1 id
        attr_accessor :source            # 1-* [ StructureMap::Group::Rule::Source ]
        attr_accessor :target            # 0-* [ StructureMap::Group::Rule::Target ]
        attr_accessor :rule              # 0-* [ StructureMap::Group::Rule ]
        attr_accessor :dependent         # 0-* [ StructureMap::Group::Rule::Dependent ]
        attr_accessor :documentation     # 0-1 string
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 1-1 id
      attr_accessor :extends           # 0-1 id
      attr_accessor :documentation     # 0-1 string
      attr_accessor :input             # 1-* [ StructureMap::Group::Input ]
      attr_accessor :rule              # 1-* [ StructureMap::Group::Rule ]
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
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :version           # 0-1 string
    attr_accessor :name              # 1-1 string
    attr_accessor :status            # 1-1 code
    attr_accessor :experimental      # 0-1 boolean
    attr_accessor :publisher         # 0-1 string
    attr_accessor :contact           # 0-* [ StructureMap::Contact ]
    attr_accessor :date              # 0-1 dateTime
    attr_accessor :description       # 0-1 string
    attr_accessor :useContext        # 0-* [ CodeableConcept ]
    attr_accessor :requirements      # 0-1 string
    attr_accessor :copyright         # 0-1 string
    attr_accessor :structure         # 0-* [ StructureMap::Structure ]
    attr_accessor :import            # 0-* [ uri ]
    attr_accessor :group             # 1-* [ StructureMap::Group ]

    def resourceType
      'StructureMap'
    end
  end
end