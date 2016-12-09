module FHIR
  class ResearchSubject < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['date', 'identifier', 'individual', 'patient', 'status']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ResearchSubject.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ResearchSubject.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ResearchSubject.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'ResearchSubject.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'ResearchSubject.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ResearchSubject.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ResearchSubject.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ResearchSubject.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ResearchSubject.identifier', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/research-subject-status'=>['candidate', 'enrolled', 'active', 'suspended', 'withdrawn', 'completed', 'candidate', 'enrolled', 'active', 'suspended', 'withdrawn', 'completed']}, 'type'=>'code', 'path'=>'ResearchSubject.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/research-subject-status'}},
      'period' => {'type'=>'Period', 'path'=>'ResearchSubject.period', 'min'=>0, 'max'=>1},
      'study' => {'type'=>'Reference', 'path'=>'ResearchSubject.study', 'min'=>1, 'max'=>1},
      'individual' => {'type'=>'Reference', 'path'=>'ResearchSubject.individual', 'min'=>1, 'max'=>1},
      'assignedArm' => {'type'=>'string', 'path'=>'ResearchSubject.assignedArm', 'min'=>0, 'max'=>1},
      'actualArm' => {'type'=>'string', 'path'=>'ResearchSubject.actualArm', 'min'=>0, 'max'=>1},
      'consent' => {'type'=>'Reference', 'path'=>'ResearchSubject.consent', 'min'=>0, 'max'=>1}
    }

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :identifier        # 0-1 Identifier
    attr_accessor :status            # 1-1 code
    attr_accessor :period            # 0-1 Period
    attr_accessor :study             # 1-1 Reference()
    attr_accessor :individual        # 1-1 Reference()
    attr_accessor :assignedArm       # 0-1 string
    attr_accessor :actualArm         # 0-1 string
    attr_accessor :consent           # 0-1 Reference()

    def resourceType
      'ResearchSubject'
    end
  end
end