module FHIR
  class Account < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['balance', 'identifier', 'name', 'owner', 'patient', 'period', 'status', 'subject', 'type']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Account.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Account.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Account.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Account.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Account.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Account.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Account.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Account.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Account.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'name' => {'type'=>'string', 'path'=>'Account.name', 'min'=>0, 'max'=>1},
      'type' => {'type'=>'CodeableConcept', 'path'=>'Account.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/account-status'=>['active', 'inactive', 'entered-in-error', 'active', 'inactive', 'entered-in-error']}, 'type'=>'code', 'path'=>'Account.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/account-status'}},
      'active' => {'type'=>'Period', 'path'=>'Account.active', 'min'=>0, 'max'=>1},
      'currency' => {'type'=>'Coding', 'path'=>'Account.currency', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://www.iso.org/iso/home/standards/currency_codes'}},
      'balance' => {'type'=>'Money', 'path'=>'Account.balance', 'min'=>0, 'max'=>1},
      'coverage' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage'], 'type'=>'Reference', 'path'=>'Account.coverage', 'min'=>0, 'max'=>Float::INFINITY},
      'coveragePeriod' => {'type'=>'Period', 'path'=>'Account.coveragePeriod', 'min'=>0, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Account.subject', 'min'=>0, 'max'=>1},
      'owner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Account.owner', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'Account.description', 'min'=>0, 'max'=>1},
      'guarantor' => {'type'=>'Account::Guarantor', 'path'=>'Account.guarantor', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Guarantor < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Guarantor.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Guarantor.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Guarantor.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'party' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Guarantor.party', 'min'=>1, 'max'=>1},
        'onHold' => {'type'=>'boolean', 'path'=>'Guarantor.onHold', 'min'=>0, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'Guarantor.period', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :party             # 1-1 Reference(Patient|RelatedPerson|Organization)
      attr_accessor :onHold            # 0-1 boolean
      attr_accessor :period            # 0-1 Period
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :name              # 0-1 string
    attr_accessor :type              # 0-1 CodeableConcept
    attr_accessor :status            # 0-1 code
    attr_accessor :active            # 0-1 Period
    attr_accessor :currency          # 0-1 Coding
    attr_accessor :balance           # 0-1 Money
    attr_accessor :coverage          # 0-* [ Reference(Coverage) ]
    attr_accessor :coveragePeriod    # 0-1 Period
    attr_accessor :subject           # 0-1 Reference(Patient|Device|Practitioner|Location|HealthcareService|Organization)
    attr_accessor :owner             # 0-1 Reference(Organization)
    attr_accessor :description       # 0-1 string
    attr_accessor :guarantor         # 0-* [ Account::Guarantor ]

    def resourceType
      'Account'
    end
  end
end