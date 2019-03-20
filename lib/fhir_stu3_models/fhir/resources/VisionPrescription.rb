module FHIR
  module STU3
    class VisionPrescription < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      MULTIPLE_TYPES = {
        'reason' => ['CodeableConcept', 'Reference']
      }
      SEARCH_PARAMS = ['identifier', 'patient', 'encounter', 'datewritten', 'prescriber']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'VisionPrescription.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'VisionPrescription.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'VisionPrescription.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'VisionPrescription.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'VisionPrescription.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'VisionPrescription.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'VisionPrescription.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'VisionPrescription.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'VisionPrescription.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'VisionPrescription.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
        'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'VisionPrescription.patient', 'min'=>0, 'max'=>1},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'VisionPrescription.encounter', 'min'=>0, 'max'=>1},
        'dateWritten' => {'type'=>'dateTime', 'path'=>'VisionPrescription.dateWritten', 'min'=>0, 'max'=>1},
        'prescriber' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'VisionPrescription.prescriber', 'min'=>0, 'max'=>1},
        'reasonCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'VisionPrescription.reason[x]', 'min'=>0, 'max'=>1},
        'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition'], 'type'=>'Reference', 'path'=>'VisionPrescription.reason[x]', 'min'=>0, 'max'=>1},
        'dispense' => {'type'=>'VisionPrescription::Dispense', 'path'=>'VisionPrescription.dispense', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Dispense < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Dispense.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Dispense.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Dispense.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'product' => {'valid_codes'=>{'http://hl7.org/fhir/ex-visionprescriptionproduct'=>['lens', 'contact']}, 'type'=>'CodeableConcept', 'path'=>'Dispense.product', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/vision-product'}},
          'eye' => {'valid_codes'=>{'http://hl7.org/fhir/vision-eye-codes'=>['right', 'left']}, 'type'=>'code', 'path'=>'Dispense.eye', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/vision-eye-codes'}},
          'sphere' => {'type'=>'decimal', 'path'=>'Dispense.sphere', 'min'=>0, 'max'=>1},
          'cylinder' => {'type'=>'decimal', 'path'=>'Dispense.cylinder', 'min'=>0, 'max'=>1},
          'axis' => {'type'=>'integer', 'path'=>'Dispense.axis', 'min'=>0, 'max'=>1},
          'prism' => {'type'=>'decimal', 'path'=>'Dispense.prism', 'min'=>0, 'max'=>1},
          'base' => {'valid_codes'=>{'http://hl7.org/fhir/vision-base-codes'=>['up', 'down', 'in', 'out']}, 'type'=>'code', 'path'=>'Dispense.base', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/vision-base-codes'}},
          'add' => {'type'=>'decimal', 'path'=>'Dispense.add', 'min'=>0, 'max'=>1},
          'power' => {'type'=>'decimal', 'path'=>'Dispense.power', 'min'=>0, 'max'=>1},
          'backCurve' => {'type'=>'decimal', 'path'=>'Dispense.backCurve', 'min'=>0, 'max'=>1},
          'diameter' => {'type'=>'decimal', 'path'=>'Dispense.diameter', 'min'=>0, 'max'=>1},
          'duration' => {'type'=>'Quantity', 'path'=>'Dispense.duration', 'min'=>0, 'max'=>1},
          'color' => {'type'=>'string', 'path'=>'Dispense.color', 'min'=>0, 'max'=>1},
          'brand' => {'type'=>'string', 'path'=>'Dispense.brand', 'min'=>0, 'max'=>1},
          'note' => {'type'=>'Annotation', 'path'=>'Dispense.note', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :product           # 0-1 CodeableConcept
        attr_accessor :eye               # 0-1 code
        attr_accessor :sphere            # 0-1 decimal
        attr_accessor :cylinder          # 0-1 decimal
        attr_accessor :axis              # 0-1 integer
        attr_accessor :prism             # 0-1 decimal
        attr_accessor :base              # 0-1 code
        attr_accessor :add               # 0-1 decimal
        attr_accessor :power             # 0-1 decimal
        attr_accessor :backCurve         # 0-1 decimal
        attr_accessor :diameter          # 0-1 decimal
        attr_accessor :duration          # 0-1 Quantity
        attr_accessor :color             # 0-1 string
        attr_accessor :brand             # 0-1 string
        attr_accessor :note              # 0-* [ Annotation ]
      end

      attr_accessor :id                    # 0-1 id
      attr_accessor :meta                  # 0-1 Meta
      attr_accessor :implicitRules         # 0-1 uri
      attr_accessor :language              # 0-1 code
      attr_accessor :text                  # 0-1 Narrative
      attr_accessor :contained             # 0-* [ Resource ]
      attr_accessor :extension             # 0-* [ Extension ]
      attr_accessor :modifierExtension     # 0-* [ Extension ]
      attr_accessor :identifier            # 0-* [ Identifier ]
      attr_accessor :status                # 0-1 code
      attr_accessor :patient               # 0-1 Reference(Patient)
      attr_accessor :encounter             # 0-1 Reference(Encounter)
      attr_accessor :dateWritten           # 0-1 dateTime
      attr_accessor :prescriber            # 0-1 Reference(Practitioner)
      attr_accessor :reasonCodeableConcept # 0-1 CodeableConcept
      attr_accessor :reasonReference       # 0-1 Reference(Condition)
      attr_accessor :dispense              # 0-* [ VisionPrescription::Dispense ]

      def resourceType
        'VisionPrescription'
      end
    end
  end
end