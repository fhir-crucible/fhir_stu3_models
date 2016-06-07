module FHIR
  class PaymentNotice < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'target' => ['Identifier', 'Reference'],
      'provider' => ['Identifier', 'Reference'],
      'organization' => ['Identifier', 'Reference'],
      'request' => ['Identifier', 'Reference'],
      'response' => ['Identifier', 'Reference']
    }
    SEARCH_PARAMS = ["created", "identifier", "organizationidentifier", "organizationreference", "paymentstatus", "provideridentifier", "providerreference", "requestidentifier", "requestreference", "responseidentifier", "responsereference", "statusdate"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'PaymentNotice.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'PaymentNotice.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'PaymentNotice.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'PaymentNotice.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'PaymentNotice.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'PaymentNotice.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'PaymentNotice.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'PaymentNotice.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'PaymentNotice.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'ruleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'PaymentNotice.ruleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'originalRuleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'PaymentNotice.originalRuleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'created' => {'type'=>'dateTime', 'path'=>'PaymentNotice.created', 'min'=>0, 'max'=>1},
      'targetIdentifier' => {'type'=>'Identifier', 'path'=>'PaymentNotice.target[x]', 'min'=>0, 'max'=>1},
      'targetReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PaymentNotice.target[x]', 'min'=>0, 'max'=>1},
      'providerIdentifier' => {'type'=>'Identifier', 'path'=>'PaymentNotice.provider[x]', 'min'=>0, 'max'=>1},
      'providerReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'PaymentNotice.provider[x]', 'min'=>0, 'max'=>1},
      'organizationIdentifier' => {'type'=>'Identifier', 'path'=>'PaymentNotice.organization[x]', 'min'=>0, 'max'=>1},
      'organizationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PaymentNotice.organization[x]', 'min'=>0, 'max'=>1},
      'requestIdentifier' => {'type'=>'Identifier', 'path'=>'PaymentNotice.request[x]', 'min'=>0, 'max'=>1},
      'requestReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'PaymentNotice.request[x]', 'min'=>0, 'max'=>1},
      'responseIdentifier' => {'type'=>'Identifier', 'path'=>'PaymentNotice.response[x]', 'min'=>0, 'max'=>1},
      'responseReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'PaymentNotice.response[x]', 'min'=>0, 'max'=>1},
      'paymentStatus' => {'valid_codes'=>{'http://hl7.org/fhir/paymentstatus'=>['paid', 'cleared']}, 'type'=>'Coding', 'path'=>'PaymentNotice.paymentStatus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/payment-status'}},
      'statusDate' => {'type'=>'date', 'path'=>'PaymentNotice.statusDate', 'min'=>0, 'max'=>1}
    }

    attr_accessor :id                     # 0-1 id
    attr_accessor :meta                   # 0-1 Meta
    attr_accessor :implicitRules          # 0-1 uri
    attr_accessor :language               # 0-1 code
    attr_accessor :text                   # 0-1 Narrative
    attr_accessor :contained              # 0-* [ Resource ]
    attr_accessor :extension              # 0-* [ Extension ]
    attr_accessor :modifierExtension      # 0-* [ Extension ]
    attr_accessor :identifier             # 0-* [ Identifier ]
    attr_accessor :ruleset                # 0-1 Coding
    attr_accessor :originalRuleset        # 0-1 Coding
    attr_accessor :created                # 0-1 dateTime
    attr_accessor :targetIdentifier       # 0-1 Identifier
    attr_accessor :targetReference        # 0-1 Reference(Organization)
    attr_accessor :providerIdentifier     # 0-1 Identifier
    attr_accessor :providerReference      # 0-1 Reference(Practitioner)
    attr_accessor :organizationIdentifier # 0-1 Identifier
    attr_accessor :organizationReference  # 0-1 Reference(Organization)
    attr_accessor :requestIdentifier      # 0-1 Identifier
    attr_accessor :requestReference       # 0-1 Reference(Resource)
    attr_accessor :responseIdentifier     # 0-1 Identifier
    attr_accessor :responseReference      # 0-1 Reference(Resource)
    attr_accessor :paymentStatus          # 1-1 Coding
    attr_accessor :statusDate             # 0-1 date

    def resourceType
      'PaymentNotice'
    end
  end
end