module FHIR
  class DecisionSupportRule < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["description", "identifier", "status", "title", "topic", "version"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'DecisionSupportRule.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'DecisionSupportRule.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'DecisionSupportRule.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'DecisionSupportRule.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'DecisionSupportRule.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'DecisionSupportRule.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'DecisionSupportRule.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'DecisionSupportRule.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'moduleMetadata' => {'type'=>'ModuleMetadata', 'path'=>'DecisionSupportRule.moduleMetadata', 'min'=>0, 'max'=>1},
      'library' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Library'], 'type'=>'Reference', 'path'=>'DecisionSupportRule.library', 'min'=>0, 'max'=>Float::INFINITY},
      'trigger' => {'type'=>'TriggerDefinition', 'path'=>'DecisionSupportRule.trigger', 'min'=>0, 'max'=>Float::INFINITY},
      'condition' => {'type'=>'string', 'path'=>'DecisionSupportRule.condition', 'min'=>0, 'max'=>1},
      'action' => {'type'=>'ActionDefinition', 'path'=>'DecisionSupportRule.action', 'min'=>0, 'max'=>Float::INFINITY}
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
    attr_accessor :library           # 0-* [ Reference(Library) ]
    attr_accessor :trigger           # 0-* [ TriggerDefinition ]
    attr_accessor :condition         # 0-1 string
    attr_accessor :action            # 0-* [ ActionDefinition ]

    def resourceType
      'DecisionSupportRule'
    end
  end
end