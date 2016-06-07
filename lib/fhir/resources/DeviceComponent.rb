module FHIR
  class DeviceComponent < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["parent", "source", "type"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'DeviceComponent.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'DeviceComponent.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'DeviceComponent.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'DeviceComponent.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'DeviceComponent.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'DeviceComponent.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'DeviceComponent.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'DeviceComponent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'type'=>'CodeableConcept', 'path'=>'DeviceComponent.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'https://rtmms.nist.gov/rtmms/index.htm#!hrosetta'}},
      'identifier' => {'type'=>'Identifier', 'path'=>'DeviceComponent.identifier', 'min'=>1, 'max'=>1},
      'lastSystemChange' => {'type'=>'instant', 'path'=>'DeviceComponent.lastSystemChange', 'min'=>1, 'max'=>1},
      'source' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'DeviceComponent.source', 'min'=>0, 'max'=>1},
      'parent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DeviceComponent'], 'type'=>'Reference', 'path'=>'DeviceComponent.parent', 'min'=>0, 'max'=>1},
      'operationalStatus' => {'type'=>'CodeableConcept', 'path'=>'DeviceComponent.operationalStatus', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'parameterGroup' => {'type'=>'CodeableConcept', 'path'=>'DeviceComponent.parameterGroup', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'measurementPrinciple' => {'valid_codes'=>{'http://hl7.org/fhir/measurement-principle'=>['other', 'chemical', 'electrical', 'impedance', 'nuclear', 'optical', 'thermal', 'biological', 'mechanical', 'acoustical', 'manual']}, 'type'=>'code', 'path'=>'DeviceComponent.measurementPrinciple', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/measurement-principle'}},
      'productionSpecification' => {'type'=>'DeviceComponent::Productionspecification', 'path'=>'DeviceComponent.productionSpecification', 'min'=>0, 'max'=>Float::INFINITY},
      'languageCode' => {'type'=>'CodeableConcept', 'path'=>'DeviceComponent.languageCode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}}
    }

    class Productionspecification < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Productionspecification.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Productionspecification.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Productionspecification.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'specType' => {'type'=>'CodeableConcept', 'path'=>'Productionspecification.specType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
        'componentId' => {'type'=>'Identifier', 'path'=>'Productionspecification.componentId', 'min'=>0, 'max'=>1},
        'productionSpec' => {'type'=>'string', 'path'=>'Productionspecification.productionSpec', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :specType          # 0-1 CodeableConcept
      attr_accessor :componentId       # 0-1 Identifier
      attr_accessor :productionSpec    # 0-1 string
    end

    attr_accessor :id                      # 0-1 id
    attr_accessor :meta                    # 0-1 Meta
    attr_accessor :implicitRules           # 0-1 uri
    attr_accessor :language                # 0-1 code
    attr_accessor :text                    # 0-1 Narrative
    attr_accessor :contained               # 0-* [ Resource ]
    attr_accessor :extension               # 0-* [ Extension ]
    attr_accessor :modifierExtension       # 0-* [ Extension ]
    attr_accessor :type                    # 1-1 CodeableConcept
    attr_accessor :identifier              # 1-1 Identifier
    attr_accessor :lastSystemChange        # 1-1 instant
    attr_accessor :source                  # 0-1 Reference(Device)
    attr_accessor :parent                  # 0-1 Reference(DeviceComponent)
    attr_accessor :operationalStatus       # 0-* [ CodeableConcept ]
    attr_accessor :parameterGroup          # 0-1 CodeableConcept
    attr_accessor :measurementPrinciple    # 0-1 code
    attr_accessor :productionSpecification # 0-* [ DeviceComponent::Productionspecification ]
    attr_accessor :languageCode            # 0-1 CodeableConcept

    def resourceType
      'DeviceComponent'
    end
  end
end