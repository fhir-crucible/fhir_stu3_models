module FHIR
  class GuidanceResponse < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'reason' => ['CodeableConcept', 'Reference']
    }
    SEARCH_PARAMS = ['patient', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'GuidanceResponse.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'GuidanceResponse.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'GuidanceResponse.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'GuidanceResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'GuidanceResponse.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'GuidanceResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'GuidanceResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'GuidanceResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'requestId' => {'type'=>'id', 'path'=>'GuidanceResponse.requestId', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'GuidanceResponse.identifier', 'min'=>0, 'max'=>1},
      'module' => {'type'=>'Reference', 'path'=>'GuidanceResponse.module', 'min'=>1, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/guidance-response-status'=>['success', 'data-requested', 'data-required', 'in-progress', 'failure', 'success', 'data-requested', 'data-required', 'in-progress', 'failure']}, 'type'=>'code', 'path'=>'GuidanceResponse.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/guidance-response-status'}},
      'subject' => {'type'=>'Reference', 'path'=>'GuidanceResponse.subject', 'min'=>0, 'max'=>1},
      'context' => {'type'=>'Reference', 'path'=>'GuidanceResponse.context', 'min'=>0, 'max'=>1},
      'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'GuidanceResponse.occurrenceDateTime', 'min'=>0, 'max'=>1},
      'performer' => {'type'=>'Reference', 'path'=>'GuidanceResponse.performer', 'min'=>0, 'max'=>1},
      'reasonCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'GuidanceResponse.reason[x]', 'min'=>0, 'max'=>1},
      'reasonReference' => {'type'=>'Reference', 'path'=>'GuidanceResponse.reason[x]', 'min'=>0, 'max'=>1},
      'note' => {'type'=>'Annotation', 'path'=>'GuidanceResponse.note', 'min'=>0, 'max'=>Float::INFINITY},
      'evaluationMessage' => {'type'=>'Reference', 'path'=>'GuidanceResponse.evaluationMessage', 'min'=>0, 'max'=>Float::INFINITY},
      'outputParameters' => {'type'=>'Reference', 'path'=>'GuidanceResponse.outputParameters', 'min'=>0, 'max'=>1},
      'result' => {'type'=>'Reference', 'path'=>'GuidanceResponse.result', 'min'=>0, 'max'=>1},
      'dataRequirement' => {'type'=>'DataRequirement', 'path'=>'GuidanceResponse.dataRequirement', 'min'=>0, 'max'=>Float::INFINITY}
    }

    attr_accessor :id                    # 0-1 id
    attr_accessor :meta                  # 0-1 Meta
    attr_accessor :implicitRules         # 0-1 uri
    attr_accessor :language              # 0-1 code
    attr_accessor :text                  # 0-1 Narrative
    attr_accessor :contained             # 0-* [ Resource ]
    attr_accessor :extension             # 0-* [ Extension ]
    attr_accessor :modifierExtension     # 0-* [ Extension ]
    attr_accessor :requestId             # 0-1 id
    attr_accessor :identifier            # 0-1 Identifier
    attr_accessor :module                # 1-1 Reference()
    attr_accessor :status                # 1-1 code
    attr_accessor :subject               # 0-1 Reference()
    attr_accessor :context               # 0-1 Reference()
    attr_accessor :occurrenceDateTime    # 0-1 dateTime
    attr_accessor :performer             # 0-1 Reference()
    attr_accessor :reasonCodeableConcept # 0-1 CodeableConcept
    attr_accessor :reasonReference       # 0-1 Reference()
    attr_accessor :note                  # 0-* [ Annotation ]
    attr_accessor :evaluationMessage     # 0-* [ Reference() ]
    attr_accessor :outputParameters      # 0-1 Reference()
    attr_accessor :result                # 0-1 Reference()
    attr_accessor :dataRequirement       # 0-* [ DataRequirement ]

    def resourceType
      'GuidanceResponse'
    end
  end
end