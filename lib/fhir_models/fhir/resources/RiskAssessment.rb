module FHIR
  class RiskAssessment < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'occurrence' => ['dateTime', 'Period'],
      'reason' => ['CodeableConcept', 'Reference']
    }
    SEARCH_PARAMS = ['date', 'identifier', 'patient', 'encounter', 'condition', 'method', 'performer', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'RiskAssessment.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'RiskAssessment.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'RiskAssessment.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'RiskAssessment.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'RiskAssessment.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'RiskAssessment.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'RiskAssessment.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'RiskAssessment.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'RiskAssessment.identifier', 'min'=>0, 'max'=>1},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'RiskAssessment.basedOn', 'min'=>0, 'max'=>1},
      'parent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'RiskAssessment.parent', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/observation-status'=>['registered', 'preliminary', 'final', 'amended', 'cancelled', 'entered-in-error', 'unknown', 'registered', 'preliminary', 'final', 'amended', 'cancelled', 'entered-in-error', 'unknown']}, 'type'=>'code', 'path'=>'RiskAssessment.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/observation-status'}},
      'code' => {'type'=>'CodeableConcept', 'path'=>'RiskAssessment.code', 'min'=>0, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'RiskAssessment.subject', 'min'=>0, 'max'=>1},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'RiskAssessment.context', 'min'=>0, 'max'=>1},
      'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'RiskAssessment.occurrence[x]', 'min'=>0, 'max'=>1},
      'occurrencePeriod' => {'type'=>'Period', 'path'=>'RiskAssessment.occurrence[x]', 'min'=>0, 'max'=>1},
      'condition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition'], 'type'=>'Reference', 'path'=>'RiskAssessment.condition', 'min'=>0, 'max'=>1},
      'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'RiskAssessment.performer', 'min'=>0, 'max'=>1},
      'reasonCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'RiskAssessment.reason[x]', 'min'=>0, 'max'=>1},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'RiskAssessment.reason[x]', 'min'=>0, 'max'=>1},
      'method' => {'local_name'=>'local_method', 'type'=>'CodeableConcept', 'path'=>'RiskAssessment.method', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'basis' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'RiskAssessment.basis', 'min'=>0, 'max'=>Float::INFINITY},
      'prediction' => {'type'=>'RiskAssessment::Prediction', 'path'=>'RiskAssessment.prediction', 'min'=>0, 'max'=>Float::INFINITY},
      'mitigation' => {'type'=>'string', 'path'=>'RiskAssessment.mitigation', 'min'=>0, 'max'=>1},
      'note' => {'type'=>'Annotation', 'path'=>'RiskAssessment.note', 'min'=>0, 'max'=>1}
    }

    class Prediction < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'probability' => ['decimal', 'Range', 'CodeableConcept'],
        'when' => ['Period', 'Range']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Prediction.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Prediction.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Prediction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'outcome' => {'type'=>'CodeableConcept', 'path'=>'Prediction.outcome', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
        'probabilityDecimal' => {'type'=>'decimal', 'path'=>'Prediction.probability[x]', 'min'=>0, 'max'=>1},
        'probabilityRange' => {'type'=>'Range', 'path'=>'Prediction.probability[x]', 'min'=>0, 'max'=>1},
        'probabilityCodeableConcept' => {'valid_codes'=>{'http://hl7.org/fhir/risk-probability'=>['negligible', 'low', 'moderate', 'high', 'certain', 'negligible', 'low', 'moderate', 'high', 'certain']}, 'type'=>'CodeableConcept', 'path'=>'Prediction.probability[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/risk-probability'}},
        'relativeRisk' => {'type'=>'decimal', 'path'=>'Prediction.relativeRisk', 'min'=>0, 'max'=>1},
        'whenPeriod' => {'type'=>'Period', 'path'=>'Prediction.when[x]', 'min'=>0, 'max'=>1},
        'whenRange' => {'type'=>'Range', 'path'=>'Prediction.when[x]', 'min'=>0, 'max'=>1},
        'rationale' => {'type'=>'string', 'path'=>'Prediction.rationale', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                         # 0-1 string
      attr_accessor :extension                  # 0-* [ Extension ]
      attr_accessor :modifierExtension          # 0-* [ Extension ]
      attr_accessor :outcome                    # 1-1 CodeableConcept
      attr_accessor :probabilityDecimal         # 0-1 decimal
      attr_accessor :probabilityRange           # 0-1 Range
      attr_accessor :probabilityCodeableConcept # 0-1 CodeableConcept
      attr_accessor :relativeRisk               # 0-1 decimal
      attr_accessor :whenPeriod                 # 0-1 Period
      attr_accessor :whenRange                  # 0-1 Range
      attr_accessor :rationale                  # 0-1 string
    end

    attr_accessor :id                    # 0-1 id
    attr_accessor :meta                  # 0-1 Meta
    attr_accessor :implicitRules         # 0-1 uri
    attr_accessor :language              # 0-1 code
    attr_accessor :text                  # 0-1 Narrative
    attr_accessor :contained             # 0-* [ Resource ]
    attr_accessor :extension             # 0-* [ Extension ]
    attr_accessor :modifierExtension     # 0-* [ Extension ]
    attr_accessor :identifier            # 0-1 Identifier
    attr_accessor :basedOn               # 0-1 Reference(Resource)
    attr_accessor :parent                # 0-1 Reference(Resource)
    attr_accessor :status                # 1-1 code
    attr_accessor :code                  # 0-1 CodeableConcept
    attr_accessor :subject               # 0-1 Reference(Patient|Group)
    attr_accessor :context               # 0-1 Reference(Encounter|EpisodeOfCare)
    attr_accessor :occurrenceDateTime    # 0-1 dateTime
    attr_accessor :occurrencePeriod      # 0-1 Period
    attr_accessor :condition             # 0-1 Reference(Condition)
    attr_accessor :performer             # 0-1 Reference(Practitioner|Device)
    attr_accessor :reasonCodeableConcept # 0-1 CodeableConcept
    attr_accessor :reasonReference       # 0-1 Reference(Resource)
    attr_accessor :local_method          # 0-1 CodeableConcept
    attr_accessor :basis                 # 0-* [ Reference(Resource) ]
    attr_accessor :prediction            # 0-* [ RiskAssessment::Prediction ]
    attr_accessor :mitigation            # 0-1 string
    attr_accessor :note                  # 0-1 Annotation

    def resourceType
      'RiskAssessment'
    end
  end
end