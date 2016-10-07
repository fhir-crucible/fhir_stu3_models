module FHIR
  class Device < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["identifier", "location", "manufacturer", "model", "organization", "patient", "type", "udicarrier", "url"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Device.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Device.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Device.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Device.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Device.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Device.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Device.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Device.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Device.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'udiCarrier' => {'type'=>'Identifier', 'path'=>'Device.udiCarrier', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/devicestatus'=>['available', 'not-available', 'entered-in-error', 'available', 'not-available', 'entered-in-error']}, 'type'=>'code', 'path'=>'Device.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/devicestatus'}},
      'type' => {'valid_codes'=>{'http://snomed.info/sct'=>[]}, 'type'=>'CodeableConcept', 'path'=>'Device.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/device-kind'}},
      'lotNumber' => {'type'=>'string', 'path'=>'Device.lotNumber', 'min'=>0, 'max'=>1},
      'manufacturer' => {'type'=>'string', 'path'=>'Device.manufacturer', 'min'=>0, 'max'=>1},
      'manufactureDate' => {'type'=>'dateTime', 'path'=>'Device.manufactureDate', 'min'=>0, 'max'=>1},
      'expirationDate' => {'type'=>'dateTime', 'path'=>'Device.expirationDate', 'min'=>0, 'max'=>1},
      'model' => {'type'=>'string', 'path'=>'Device.model', 'min'=>0, 'max'=>1},
      'version' => {'type'=>'string', 'path'=>'Device.version', 'min'=>0, 'max'=>1},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Device.patient', 'min'=>0, 'max'=>1},
      'owner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Device.owner', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactPoint', 'path'=>'Device.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Device.location', 'min'=>0, 'max'=>1},
      'url' => {'type'=>'uri', 'path'=>'Device.url', 'min'=>0, 'max'=>1},
      'note' => {'type'=>'Annotation', 'path'=>'Device.note', 'min'=>0, 'max'=>Float::INFINITY}
    }

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :udiCarrier        # 0-1 Identifier
    attr_accessor :status            # 0-1 code
    attr_accessor :type              # 1-1 CodeableConcept
    attr_accessor :lotNumber         # 0-1 string
    attr_accessor :manufacturer      # 0-1 string
    attr_accessor :manufactureDate   # 0-1 dateTime
    attr_accessor :expirationDate    # 0-1 dateTime
    attr_accessor :model             # 0-1 string
    attr_accessor :version           # 0-1 string
    attr_accessor :patient           # 0-1 Reference(Patient)
    attr_accessor :owner             # 0-1 Reference(Organization)
    attr_accessor :contact           # 0-* [ ContactPoint ]
    attr_accessor :location          # 0-1 Reference(Location)
    attr_accessor :url               # 0-1 uri
    attr_accessor :note              # 0-* [ Annotation ]

    def resourceType
      'Device'
    end
  end
end