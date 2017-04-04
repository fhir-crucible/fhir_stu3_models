module FHIR
  class PaymentNotice < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['created', 'identifier', 'organization', 'payment-status', 'provider', 'request', 'response', 'statusdate']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'PaymentNotice.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'PaymentNotice.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'PaymentNotice.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'PaymentNotice.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'PaymentNotice.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'PaymentNotice.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'PaymentNotice.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'PaymentNotice.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'PaymentNotice.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error', 'active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'PaymentNotice.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
      'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'PaymentNotice.request', 'min'=>0, 'max'=>1},
      'response' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'PaymentNotice.response', 'min'=>0, 'max'=>1},
      'statusDate' => {'type'=>'date', 'path'=>'PaymentNotice.statusDate', 'min'=>0, 'max'=>1},
      'created' => {'type'=>'dateTime', 'path'=>'PaymentNotice.created', 'min'=>0, 'max'=>1},
      'target' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PaymentNotice.target', 'min'=>0, 'max'=>1},
      'provider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'PaymentNotice.provider', 'min'=>0, 'max'=>1},
      'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PaymentNotice.organization', 'min'=>0, 'max'=>1},
      'paymentStatus' => {'valid_codes'=>{'http://hl7.org/fhir/paymentstatus'=>['paid', 'cleared', 'paid', 'cleared']}, 'type'=>'CodeableConcept', 'path'=>'PaymentNotice.paymentStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/payment-status'}}
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
    attr_accessor :status            # 0-1 code
    attr_accessor :request           # 0-1 Reference(Resource)
    attr_accessor :response          # 0-1 Reference(Resource)
    attr_accessor :statusDate        # 0-1 date
    attr_accessor :created           # 0-1 dateTime
    attr_accessor :target            # 0-1 Reference(Organization)
    attr_accessor :provider          # 0-1 Reference(Practitioner)
    attr_accessor :organization      # 0-1 Reference(Organization)
    attr_accessor :paymentStatus     # 0-1 CodeableConcept

    def resourceType
      'PaymentNotice'
    end
  end
end