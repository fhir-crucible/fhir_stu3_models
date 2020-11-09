module FHIR
  module STU3
    class DataElement < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      SEARCH_PARAMS = ['code', 'context', 'date', 'description', 'identifier', 'name', 'publisher', 'status', 'stringency', 'url', 'version']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'DataElement.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'DataElement.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'DataElement.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'DataElement.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
        'text' => {'type'=>'Narrative', 'path'=>'DataElement.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'DataElement.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'DataElement.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'DataElement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'DataElement.url', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'DataElement.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'version' => {'type'=>'string', 'path'=>'DataElement.version', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/conformance-resource-status'=>['draft', 'active', 'retired']}, 'type'=>'code', 'path'=>'DataElement.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conformance-resource-status'}},
        'experimental' => {'type'=>'boolean', 'path'=>'DataElement.experimental', 'min'=>0, 'max'=>1},
        'publisher' => {'type'=>'string', 'path'=>'DataElement.publisher', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'DataElement.date', 'min'=>0, 'max'=>1},
        'name' => {'type'=>'string', 'path'=>'DataElement.name', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'DataElement::Contact', 'path'=>'DataElement.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'useContext' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>[], 'http://unstats.un.org/unsd/methods/m49/m49.htm'=>[]}, 'type'=>'CodeableConcept', 'path'=>'DataElement.useContext', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/use-context'}},
        'copyright' => {'type'=>'string', 'path'=>'DataElement.copyright', 'min'=>0, 'max'=>1},
        'stringency' => {'valid_codes'=>{'http://hl7.org/fhir/dataelement-stringency'=>['comparable', 'fully-specified', 'equivalent', 'convertable', 'scaleable', 'flexible']}, 'type'=>'code', 'path'=>'DataElement.stringency', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/dataelement-stringency'}},
        'mapping' => {'type'=>'DataElement::Mapping', 'path'=>'DataElement.mapping', 'min'=>0, 'max'=>Float::INFINITY},
        'element' => {'type'=>'ElementDefinition', 'path'=>'DataElement.element', 'min'=>1, 'max'=>Float::INFINITY}
      }

      class Contact < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

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

      class Mapping < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Mapping.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Mapping.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Mapping.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'identity' => {'type'=>'id', 'path'=>'Mapping.identity', 'min'=>1, 'max'=>1},
          'uri' => {'type'=>'uri', 'path'=>'Mapping.uri', 'min'=>0, 'max'=>1},
          'name' => {'type'=>'string', 'path'=>'Mapping.name', 'min'=>0, 'max'=>1},
          'comment' => {'type'=>'string', 'path'=>'Mapping.comment', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :identity          # 1-1 id
        attr_accessor :uri               # 0-1 uri
        attr_accessor :name              # 0-1 string
        attr_accessor :comment           # 0-1 string
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
      attr_accessor :experimental      # 0-1 boolean
      attr_accessor :publisher         # 0-1 string
      attr_accessor :date              # 0-1 dateTime
      attr_accessor :name              # 0-1 string
      attr_accessor :contact           # 0-* [ DataElement::Contact ]
      attr_accessor :useContext        # 0-* [ CodeableConcept ]
      attr_accessor :copyright         # 0-1 string
      attr_accessor :stringency        # 0-1 code
      attr_accessor :mapping           # 0-* [ DataElement::Mapping ]
      attr_accessor :element           # 1-* [ ElementDefinition ]

      def resourceType
        'DataElement'
      end
    end
  end
end