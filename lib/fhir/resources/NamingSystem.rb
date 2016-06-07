module FHIR
  class NamingSystem < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["contact", "context", "date", "id-type", "kind", "name", "period", "publisher", "replaced-by", "responsible", "status", "telecom", "type", "value"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'NamingSystem.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'NamingSystem.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'NamingSystem.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'NamingSystem.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'NamingSystem.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'NamingSystem.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'NamingSystem.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'NamingSystem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'name' => {'type'=>'string', 'path'=>'NamingSystem.name', 'min'=>1, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/conformance-resource-status'=>['draft', 'active', 'retired']}, 'type'=>'code', 'path'=>'NamingSystem.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conformance-resource-status'}},
      'kind' => {'valid_codes'=>{'http://hl7.org/fhir/namingsystem-type'=>['codesystem', 'identifier', 'root']}, 'type'=>'code', 'path'=>'NamingSystem.kind', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/namingsystem-type'}},
      'date' => {'type'=>'dateTime', 'path'=>'NamingSystem.date', 'min'=>1, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'NamingSystem.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'NamingSystem::Contact', 'path'=>'NamingSystem.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'responsible' => {'type'=>'string', 'path'=>'NamingSystem.responsible', 'min'=>0, 'max'=>1},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/v2/0203'=>['DL', 'PPN', 'BRN', 'MR', 'MCN', 'EN', 'TAX', 'NIIP', 'PRN', 'MD', 'DR'], 'http://hl7.org/fhir/identifier-type'=>['UDI', 'SNO', 'SB', 'PLAC', 'FILL']}, 'type'=>'CodeableConcept', 'path'=>'NamingSystem.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/identifier-type'}},
      'description' => {'type'=>'string', 'path'=>'NamingSystem.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'CodeableConcept', 'path'=>'NamingSystem.useContext', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/use-context'}},
      'usage' => {'type'=>'string', 'path'=>'NamingSystem.usage', 'min'=>0, 'max'=>1},
      'uniqueId' => {'type'=>'NamingSystem::Uniqueid', 'path'=>'NamingSystem.uniqueId', 'min'=>1, 'max'=>Float::INFINITY},
      'replacedBy' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/NamingSystem'], 'type'=>'Reference', 'path'=>'NamingSystem.replacedBy', 'min'=>0, 'max'=>1}
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

    class Uniqueid < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Uniqueid.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Uniqueid.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Uniqueid.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/namingsystem-identifier-type'=>['oid', 'uuid', 'uri', 'other']}, 'type'=>'code', 'path'=>'Uniqueid.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/namingsystem-identifier-type'}},
        'value' => {'type'=>'string', 'path'=>'Uniqueid.value', 'min'=>1, 'max'=>1},
        'preferred' => {'type'=>'boolean', 'path'=>'Uniqueid.preferred', 'min'=>0, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'Uniqueid.period', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 code
      attr_accessor :value             # 1-1 string
      attr_accessor :preferred         # 0-1 boolean
      attr_accessor :period            # 0-1 Period
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :name              # 1-1 string
    attr_accessor :status            # 1-1 code
    attr_accessor :kind              # 1-1 code
    attr_accessor :date              # 1-1 dateTime
    attr_accessor :publisher         # 0-1 string
    attr_accessor :contact           # 0-* [ NamingSystem::Contact ]
    attr_accessor :responsible       # 0-1 string
    attr_accessor :type              # 0-1 CodeableConcept
    attr_accessor :description       # 0-1 string
    attr_accessor :useContext        # 0-* [ CodeableConcept ]
    attr_accessor :usage             # 0-1 string
    attr_accessor :uniqueId          # 1-* [ NamingSystem::Uniqueid ]
    attr_accessor :replacedBy        # 0-1 Reference(NamingSystem)

    def resourceType
      'NamingSystem'
    end
  end
end