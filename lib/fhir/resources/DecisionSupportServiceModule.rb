module FHIR
  class DecisionSupportServiceModule < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["description", "identifier", "status", "title", "topic", "version"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'DecisionSupportServiceModule.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'DecisionSupportServiceModule.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'DecisionSupportServiceModule.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'DecisionSupportServiceModule.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'DecisionSupportServiceModule.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'DecisionSupportServiceModule.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'DecisionSupportServiceModule.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'DecisionSupportServiceModule.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'moduleMetadata' => {'type'=>'ModuleMetadata', 'path'=>'DecisionSupportServiceModule.moduleMetadata', 'min'=>0, 'max'=>1},
      'trigger' => {'type'=>'TriggerDefinition', 'path'=>'DecisionSupportServiceModule.trigger', 'min'=>0, 'max'=>Float::INFINITY},
      'parameter' => {'type'=>'ParameterDefinition', 'path'=>'DecisionSupportServiceModule.parameter', 'min'=>0, 'max'=>Float::INFINITY},
      'dataRequirement' => {'type'=>'DataRequirement', 'path'=>'DecisionSupportServiceModule.dataRequirement', 'min'=>0, 'max'=>Float::INFINITY}
    }

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :moduleMetadata    # 0-1 ModuleMetadata
    attr_accessor :trigger           # 0-* [ TriggerDefinition ]
    attr_accessor :parameter         # 0-* [ ParameterDefinition ]
    attr_accessor :dataRequirement   # 0-* [ DataRequirement ]

    def resourceType
      'DecisionSupportServiceModule'
    end
  end
end