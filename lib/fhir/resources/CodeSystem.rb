module FHIR
  class CodeSystem < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["code", "context", "date", "description", "identifier", "language", "name", "publisher", "status", "system", "url", "version"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'CodeSystem.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'CodeSystem.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'CodeSystem.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'CodeSystem.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'CodeSystem.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'CodeSystem.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'CodeSystem.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'CodeSystem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'CodeSystem.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'CodeSystem.identifier', 'min'=>0, 'max'=>1},
      'version' => {'type'=>'string', 'path'=>'CodeSystem.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'CodeSystem.name', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/conformance-resource-status'=>['draft', 'active', 'retired']}, 'type'=>'code', 'path'=>'CodeSystem.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conformance-resource-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'CodeSystem.experimental', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'CodeSystem.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'CodeSystem::Contact', 'path'=>'CodeSystem.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'date' => {'type'=>'dateTime', 'path'=>'CodeSystem.date', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'CodeSystem.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'CodeableConcept', 'path'=>'CodeSystem.useContext', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/use-context'}},
      'requirements' => {'type'=>'string', 'path'=>'CodeSystem.requirements', 'min'=>0, 'max'=>1},
      'copyright' => {'type'=>'string', 'path'=>'CodeSystem.copyright', 'min'=>0, 'max'=>1},
      'caseSensitive' => {'type'=>'boolean', 'path'=>'CodeSystem.caseSensitive', 'min'=>0, 'max'=>1},
      'valueSet' => {'type'=>'uri', 'path'=>'CodeSystem.valueSet', 'min'=>0, 'max'=>1},
      'compositional' => {'type'=>'boolean', 'path'=>'CodeSystem.compositional', 'min'=>0, 'max'=>1},
      'versionNeeded' => {'type'=>'boolean', 'path'=>'CodeSystem.versionNeeded', 'min'=>0, 'max'=>1},
      'content' => {'valid_codes'=>{'http://hl7.org/fhir/codesystem-content-mode'=>['not-present', 'examplar', 'fragment', 'complete']}, 'type'=>'code', 'path'=>'CodeSystem.content', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/codesystem-content-mode'}},
      'count' => {'type'=>'unsignedInt', 'path'=>'CodeSystem.count', 'min'=>0, 'max'=>1},
      'filter' => {'type'=>'CodeSystem::Filter', 'path'=>'CodeSystem.filter', 'min'=>0, 'max'=>Float::INFINITY},
      'property' => {'type'=>'CodeSystem::Property', 'path'=>'CodeSystem.property', 'min'=>0, 'max'=>Float::INFINITY},
      'concept' => {'type'=>'CodeSystem::Concept', 'path'=>'CodeSystem.concept', 'min'=>0, 'max'=>Float::INFINITY}
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

    class Filter < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Filter.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Filter.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Filter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'code', 'path'=>'Filter.code', 'min'=>1, 'max'=>1},
        'description' => {'type'=>'string', 'path'=>'Filter.description', 'min'=>0, 'max'=>1},
        'operator' => {'valid_codes'=>{'http://hl7.org/fhir/filter-operator'=>['=', 'is-a', 'is-not-a', 'regex', 'in', 'not-in']}, 'type'=>'code', 'path'=>'Filter.operator', 'min'=>1, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/filter-operator'}},
        'value' => {'type'=>'string', 'path'=>'Filter.value', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 1-1 code
      attr_accessor :description       # 0-1 string
      attr_accessor :operator          # 1-* [ code ]
      attr_accessor :value             # 1-1 string
    end

    class Property < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Property.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Property.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Property.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'code', 'path'=>'Property.code', 'min'=>1, 'max'=>1},
        'description' => {'type'=>'string', 'path'=>'Property.description', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/concept-property-type'=>['code', 'Coding', 'string', 'integer', 'boolean', 'dateTime']}, 'type'=>'code', 'path'=>'Property.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/concept-property-type'}}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 1-1 code
      attr_accessor :description       # 0-1 string
      attr_accessor :type              # 1-1 code
    end

    class Concept < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Concept.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Concept.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Concept.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'code', 'path'=>'Concept.code', 'min'=>1, 'max'=>1},
        'display' => {'type'=>'string', 'path'=>'Concept.display', 'min'=>0, 'max'=>1},
        'definition' => {'type'=>'string', 'path'=>'Concept.definition', 'min'=>0, 'max'=>1},
        'designation' => {'type'=>'CodeSystem::Concept::Designation', 'path'=>'Concept.designation', 'min'=>0, 'max'=>Float::INFINITY},
        'property' => {'type'=>'CodeSystem::Concept::Property', 'path'=>'Concept.property', 'min'=>0, 'max'=>Float::INFINITY},
        'concept' => {'type'=>'CodeSystem::Concept', 'path'=>'Concept.concept', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Designation < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Designation.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Designation.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Designation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'language' => {'type'=>'code', 'path'=>'Designation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
          'use' => {'valid_codes'=>{'http://snomed.info/sct'=>['900000000000003001', '900000000000013009', '900000000000550004']}, 'type'=>'Coding', 'path'=>'Designation.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/designation-use'}},
          'value' => {'type'=>'string', 'path'=>'Designation.value', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :language          # 0-1 code
        attr_accessor :use               # 0-1 Coding
        attr_accessor :value             # 1-1 string
      end

      class Property < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['code', 'Coding', 'string', 'integer', 'boolean', 'dateTime']
        }
        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Property.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Property.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Property.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'type'=>'code', 'path'=>'Property.code', 'min'=>1, 'max'=>1},
          'valueCode' => {'type'=>'code', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueCoding' => {'type'=>'Coding', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueString' => {'type'=>'string', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueInteger' => {'type'=>'integer', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueBoolean' => {'type'=>'boolean', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueDateTime' => {'type'=>'dateTime', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :code              # 1-1 code
        attr_accessor :valueCode         # 1-1 code
        attr_accessor :valueCoding       # 1-1 Coding
        attr_accessor :valueString       # 1-1 string
        attr_accessor :valueInteger      # 1-1 integer
        attr_accessor :valueBoolean      # 1-1 boolean
        attr_accessor :valueDateTime     # 1-1 dateTime
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 1-1 code
      attr_accessor :display           # 0-1 string
      attr_accessor :definition        # 0-1 string
      attr_accessor :designation       # 0-* [ CodeSystem::Concept::Designation ]
      attr_accessor :property          # 0-* [ CodeSystem::Concept::Property ]
      attr_accessor :concept           # 0-* [ CodeSystem::Concept ]
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
    attr_accessor :contact           # 0-* [ CodeSystem::Contact ]
    attr_accessor :date              # 0-1 dateTime
    attr_accessor :description       # 0-1 string
    attr_accessor :useContext        # 0-* [ CodeableConcept ]
    attr_accessor :requirements      # 0-1 string
    attr_accessor :copyright         # 0-1 string
    attr_accessor :caseSensitive     # 0-1 boolean
    attr_accessor :valueSet          # 0-1 uri
    attr_accessor :compositional     # 0-1 boolean
    attr_accessor :versionNeeded     # 0-1 boolean
    attr_accessor :content           # 1-1 code
    attr_accessor :count             # 0-1 unsignedInt
    attr_accessor :filter            # 0-* [ CodeSystem::Filter ]
    attr_accessor :property          # 0-* [ CodeSystem::Property ]
    attr_accessor :concept           # 0-* [ CodeSystem::Concept ]

    def resourceType
      'CodeSystem'
    end
  end
end