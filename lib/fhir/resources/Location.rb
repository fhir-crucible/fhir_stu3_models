module FHIR
  class Location < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["address", "address-city", "address-country", "address-postalcode", "address-state", "address-use", "identifier", "name", "near", "near-distance", "organization", "partof", "status", "type"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Location.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Location.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Location.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Location.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'Location.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Location.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Location.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Location.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Location.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/location-status'=>['active', 'suspended', 'inactive']}, 'type'=>'code', 'path'=>'Location.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/location-status'}},
      'name' => {'type'=>'string', 'path'=>'Location.name', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'Location.description', 'min'=>0, 'max'=>1},
      'mode' => {'valid_codes'=>{'http://hl7.org/fhir/location-mode'=>['instance', 'kind']}, 'type'=>'code', 'path'=>'Location.mode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/location-mode'}},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/v3/RoleCode'=>['_DedicatedServiceDeliveryLocationRoleType', '_DedicatedClinicalLocationRoleType', 'DX', 'CVDX', 'CATH', 'ECHO', 'GIDX', 'ENDOS', 'RADDX', 'RADO', 'RNEU', 'HOSP', 'CHR', 'GACH', 'MHSP', 'PSYCHF', 'RH', 'RHAT', 'RHII', 'RHMAD', 'RHPI', 'RHPIH', 'RHPIMS', 'RHPIVS', 'RHYAD', 'HU', 'BMTU', 'CCU', 'CHEST', 'EPIL', 'ER', 'ETU', 'HD', 'HLAB', 'INLAB', 'OUTLAB', 'HRAD', 'HUSCS', 'ICU', 'PEDICU', 'PEDNICU', 'INPHARM', 'MBL', 'NCCS', 'NS', 'OUTPHARM', 'PEDU', 'PHU', 'RHU', 'SLEEP', 'NCCF', 'SNF', 'OF', 'ALL', 'AMPUT', 'BMTC', 'BREAST', 'CANC', 'CAPC', 'CARD', 'PEDCARD', 'COAG', 'CRS', 'DERM', 'ENDO', 'PEDE', 'ENT', 'FMC', 'GI', 'PEDGI', 'GIM', 'GYN', 'HEM', 'PEDHEM', 'HTN', 'IEC', 'INFD', 'PEDID', 'INV', 'LYMPH', 'MGEN', 'NEPH', 'PEDNEPH', 'NEUR', 'OB', 'OMS', 'ONCL', 'PEDHO', 'OPH', 'OPTC', 'ORTHO', 'HAND', 'PAINCL', 'PC', 'PEDC', 'PEDRHEUM', 'POD', 'PREV', 'PROCTO', 'PROFF', 'PROS', 'PSI', 'PSY', 'RHEUM', 'SPMED', 'SU', 'PLS', 'URO', 'TR', 'TRAVEL', 'WND', 'RTF', 'PRC', 'SURF', '_DedicatedNonClinicalLocationRoleType', 'DADDR', 'MOBL', 'AMB', 'PHARM', '_IncidentalServiceDeliveryLocationRoleType', 'ACC', 'COMM', 'CSC', 'PTRES', 'SCHOOL', 'UPC', 'WORK']}, 'type'=>'CodeableConcept', 'path'=>'Location.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ServiceDeliveryLocationRoleType'}},
      'telecom' => {'type'=>'ContactPoint', 'path'=>'Location.telecom', 'min'=>0, 'max'=>Float::INFINITY},
      'address' => {'type'=>'Address', 'path'=>'Location.address', 'min'=>0, 'max'=>1},
      'physicalType' => {'valid_codes'=>{'http://hl7.org/fhir/location-physical-type'=>['bu', 'wi', 'lvl', 'co', 'ro', 'bd', 've', 'ho', 'ca', 'rd', 'jdn', 'area']}, 'type'=>'CodeableConcept', 'path'=>'Location.physicalType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/location-physical-type'}},
      'position' => {'type'=>'Location::Position', 'path'=>'Location.position', 'min'=>0, 'max'=>1},
      'managingOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Location.managingOrganization', 'min'=>0, 'max'=>1},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Location.partOf', 'min'=>0, 'max'=>1}
    }

    class Position < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Position.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Position.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Position.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'longitude' => {'type'=>'decimal', 'path'=>'Position.longitude', 'min'=>1, 'max'=>1},
        'latitude' => {'type'=>'decimal', 'path'=>'Position.latitude', 'min'=>1, 'max'=>1},
        'altitude' => {'type'=>'decimal', 'path'=>'Position.altitude', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :longitude         # 1-1 decimal
      attr_accessor :latitude          # 1-1 decimal
      attr_accessor :altitude          # 0-1 decimal
    end

    attr_accessor :id                   # 0-1 id
    attr_accessor :meta                 # 0-1 Meta
    attr_accessor :implicitRules        # 0-1 uri
    attr_accessor :language             # 0-1 code
    attr_accessor :text                 # 0-1 Narrative
    attr_accessor :contained            # 0-* [ Resource ]
    attr_accessor :extension            # 0-* [ Extension ]
    attr_accessor :modifierExtension    # 0-* [ Extension ]
    attr_accessor :identifier           # 0-* [ Identifier ]
    attr_accessor :status               # 0-1 code
    attr_accessor :name                 # 0-1 string
    attr_accessor :description          # 0-1 string
    attr_accessor :mode                 # 0-1 code
    attr_accessor :type                 # 0-1 CodeableConcept
    attr_accessor :telecom              # 0-* [ ContactPoint ]
    attr_accessor :address              # 0-1 Address
    attr_accessor :physicalType         # 0-1 CodeableConcept
    attr_accessor :position             # 0-1 Location::Position
    attr_accessor :managingOrganization # 0-1 Reference(Organization)
    attr_accessor :partOf               # 0-1 Reference(Location)

    def resourceType
      'Location'
    end
  end
end