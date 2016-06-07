module FHIR
  class ConceptMap < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'source' => ['uri', 'Reference'],
      'target' => ['uri', 'Reference']
    }
    SEARCH_PARAMS = ["context", "date", "dependson", "description", "identifier", "name", "product", "publisher", "source", "source-code", "source-system", "source-uri", "status", "target", "target-code", "target-system", "url", "version"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ConceptMap.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ConceptMap.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ConceptMap.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ConceptMap.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'ConceptMap.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ConceptMap.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ConceptMap.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ConceptMap.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'ConceptMap.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'ConceptMap.identifier', 'min'=>0, 'max'=>1},
      'version' => {'type'=>'string', 'path'=>'ConceptMap.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'ConceptMap.name', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/conformance-resource-status'=>['draft', 'active', 'retired']}, 'type'=>'code', 'path'=>'ConceptMap.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conformance-resource-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'ConceptMap.experimental', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'ConceptMap.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ConceptMap::Contact', 'path'=>'ConceptMap.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'date' => {'type'=>'dateTime', 'path'=>'ConceptMap.date', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'ConceptMap.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'CodeableConcept', 'path'=>'ConceptMap.useContext', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/use-context'}},
      'requirements' => {'type'=>'string', 'path'=>'ConceptMap.requirements', 'min'=>0, 'max'=>1},
      'copyright' => {'type'=>'string', 'path'=>'ConceptMap.copyright', 'min'=>0, 'max'=>1},
      'sourceUri' => {'type'=>'uri', 'path'=>'ConceptMap.source[x]', 'min'=>1, 'max'=>1},
      'sourceReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ValueSet', 'http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'ConceptMap.source[x]', 'min'=>1, 'max'=>1},
      'targetUri' => {'type'=>'uri', 'path'=>'ConceptMap.target[x]', 'min'=>1, 'max'=>1},
      'targetReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ValueSet', 'http://hl7.org/fhir/StructureDefinition/StructureDefinition'], 'type'=>'Reference', 'path'=>'ConceptMap.target[x]', 'min'=>1, 'max'=>1},
      'element' => {'type'=>'ConceptMap::Element', 'path'=>'ConceptMap.element', 'min'=>0, 'max'=>Float::INFINITY}
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

    class Element < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Element.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Element.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Element.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'system' => {'type'=>'uri', 'path'=>'Element.system', 'min'=>0, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'Element.version', 'min'=>0, 'max'=>1},
        'code' => {'type'=>'code', 'path'=>'Element.code', 'min'=>0, 'max'=>1},
        'target' => {'type'=>'ConceptMap::Element::Target', 'path'=>'Element.target', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Target < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Target.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Target.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Target.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'system' => {'type'=>'uri', 'path'=>'Target.system', 'min'=>0, 'max'=>1},
          'version' => {'type'=>'string', 'path'=>'Target.version', 'min'=>0, 'max'=>1},
          'code' => {'type'=>'code', 'path'=>'Target.code', 'min'=>0, 'max'=>1},
          'equivalence' => {'valid_codes'=>{'http://hl7.org/fhir/concept-map-equivalence'=>['equivalent', 'equal', 'wider', 'subsumes', 'narrower', 'specializes', 'inexact', 'unmatched', 'disjoint']}, 'type'=>'code', 'path'=>'Target.equivalence', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/concept-map-equivalence'}},
          'comments' => {'type'=>'string', 'path'=>'Target.comments', 'min'=>0, 'max'=>1},
          'dependsOn' => {'type'=>'ConceptMap::Element::Target::Dependson', 'path'=>'Target.dependsOn', 'min'=>0, 'max'=>Float::INFINITY},
          'product' => {'type'=>'ConceptMap::Element::Target::Dependson', 'path'=>'Target.product', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Dependson < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Dependson.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Dependson.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Dependson.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'element' => {'type'=>'uri', 'path'=>'Dependson.element', 'min'=>1, 'max'=>1},
            'system' => {'type'=>'uri', 'path'=>'Dependson.system', 'min'=>1, 'max'=>1},
            'code' => {'type'=>'string', 'path'=>'Dependson.code', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :element           # 1-1 uri
          attr_accessor :system            # 1-1 uri
          attr_accessor :code              # 1-1 string
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :system            # 0-1 uri
        attr_accessor :version           # 0-1 string
        attr_accessor :code              # 0-1 code
        attr_accessor :equivalence       # 1-1 code
        attr_accessor :comments          # 0-1 string
        attr_accessor :dependsOn         # 0-* [ ConceptMap::Element::Target::Dependson ]
        attr_accessor :product           # 0-* [ ConceptMap::Element::Target::Dependson ]
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :system            # 0-1 uri
      attr_accessor :version           # 0-1 string
      attr_accessor :code              # 0-1 code
      attr_accessor :target            # 0-* [ ConceptMap::Element::Target ]
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
    attr_accessor :identifier        # 0-1 Identifier
    attr_accessor :version           # 0-1 string
    attr_accessor :name              # 0-1 string
    attr_accessor :status            # 1-1 code
    attr_accessor :experimental      # 0-1 boolean
    attr_accessor :publisher         # 0-1 string
    attr_accessor :contact           # 0-* [ ConceptMap::Contact ]
    attr_accessor :date              # 0-1 dateTime
    attr_accessor :description       # 0-1 string
    attr_accessor :useContext        # 0-* [ CodeableConcept ]
    attr_accessor :requirements      # 0-1 string
    attr_accessor :copyright         # 0-1 string
    attr_accessor :sourceUri         # 1-1 uri
    attr_accessor :sourceReference   # 1-1 Reference(ValueSet|StructureDefinition)
    attr_accessor :targetUri         # 1-1 uri
    attr_accessor :targetReference   # 1-1 Reference(ValueSet|StructureDefinition)
    attr_accessor :element           # 0-* [ ConceptMap::Element ]

    def resourceType
      'ConceptMap'
    end
  end
end