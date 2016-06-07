module FHIR
  class PaymentReconciliation < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'request' => ['Identifier', 'Reference'],
      'organization' => ['Identifier', 'Reference'],
      'requestProvider' => ['Identifier', 'Reference'],
      'requestOrganization' => ['Identifier', 'Reference']
    }
    SEARCH_PARAMS = ["created", "disposition", "identifier", "organizationidentifier", "organizationreference", "outcome", "requestidentifier", "requestorganizationidentifier", "requestorganizationreference", "requestprovideridentifier", "requestproviderreference", "requestreference"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'PaymentReconciliation.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'PaymentReconciliation.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'PaymentReconciliation.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'PaymentReconciliation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'PaymentReconciliation.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'PaymentReconciliation.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'PaymentReconciliation.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'PaymentReconciliation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'PaymentReconciliation.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'requestIdentifier' => {'type'=>'Identifier', 'path'=>'PaymentReconciliation.request[x]', 'min'=>0, 'max'=>1},
      'requestReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ProcessRequest'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.request[x]', 'min'=>0, 'max'=>1},
      'outcome' => {'valid_codes'=>{'http://hl7.org/fhir/remittance-outcome'=>['complete', 'error']}, 'type'=>'code', 'path'=>'PaymentReconciliation.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/remittance-outcome'}},
      'disposition' => {'type'=>'string', 'path'=>'PaymentReconciliation.disposition', 'min'=>0, 'max'=>1},
      'ruleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'PaymentReconciliation.ruleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'originalRuleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'PaymentReconciliation.originalRuleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'created' => {'type'=>'dateTime', 'path'=>'PaymentReconciliation.created', 'min'=>0, 'max'=>1},
      'period' => {'type'=>'Period', 'path'=>'PaymentReconciliation.period', 'min'=>0, 'max'=>1},
      'organizationIdentifier' => {'type'=>'Identifier', 'path'=>'PaymentReconciliation.organization[x]', 'min'=>0, 'max'=>1},
      'organizationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.organization[x]', 'min'=>0, 'max'=>1},
      'requestProviderIdentifier' => {'type'=>'Identifier', 'path'=>'PaymentReconciliation.requestProvider[x]', 'min'=>0, 'max'=>1},
      'requestProviderReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.requestProvider[x]', 'min'=>0, 'max'=>1},
      'requestOrganizationIdentifier' => {'type'=>'Identifier', 'path'=>'PaymentReconciliation.requestOrganization[x]', 'min'=>0, 'max'=>1},
      'requestOrganizationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.requestOrganization[x]', 'min'=>0, 'max'=>1},
      'detail' => {'type'=>'PaymentReconciliation::Detail', 'path'=>'PaymentReconciliation.detail', 'min'=>0, 'max'=>Float::INFINITY},
      'form' => {'valid_codes'=>{'http://hl7.org/fhir/forms-codes'=>['1', '2']}, 'type'=>'Coding', 'path'=>'PaymentReconciliation.form', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/forms'}},
      'total' => {'type'=>'Quantity', 'path'=>'PaymentReconciliation.total', 'min'=>1, 'max'=>1},
      'note' => {'type'=>'PaymentReconciliation::Note', 'path'=>'PaymentReconciliation.note', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Detail < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'request' => ['Identifier', 'Reference'],
        'responce' => ['Identifier', 'Reference'],
        'submitter' => ['Identifier', 'Reference'],
        'payee' => ['Identifier', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/payment-type'=>['payment', 'adjustment', 'advance']}, 'type'=>'Coding', 'path'=>'Detail.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/payment-type'}},
        'requestIdentifier' => {'type'=>'Identifier', 'path'=>'Detail.request[x]', 'min'=>0, 'max'=>1},
        'requestReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Detail.request[x]', 'min'=>0, 'max'=>1},
        'responceIdentifier' => {'type'=>'Identifier', 'path'=>'Detail.responce[x]', 'min'=>0, 'max'=>1},
        'responceReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Detail.responce[x]', 'min'=>0, 'max'=>1},
        'submitterIdentifier' => {'type'=>'Identifier', 'path'=>'Detail.submitter[x]', 'min'=>0, 'max'=>1},
        'submitterReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Detail.submitter[x]', 'min'=>0, 'max'=>1},
        'payeeIdentifier' => {'type'=>'Identifier', 'path'=>'Detail.payee[x]', 'min'=>0, 'max'=>1},
        'payeeReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Detail.payee[x]', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'date', 'path'=>'Detail.date', 'min'=>0, 'max'=>1},
        'amount' => {'type'=>'Quantity', 'path'=>'Detail.amount', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                  # 0-1 id
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :type                # 1-1 Coding
      attr_accessor :requestIdentifier   # 0-1 Identifier
      attr_accessor :requestReference    # 0-1 Reference(Resource)
      attr_accessor :responceIdentifier  # 0-1 Identifier
      attr_accessor :responceReference   # 0-1 Reference(Resource)
      attr_accessor :submitterIdentifier # 0-1 Identifier
      attr_accessor :submitterReference  # 0-1 Reference(Organization)
      attr_accessor :payeeIdentifier     # 0-1 Identifier
      attr_accessor :payeeReference      # 0-1 Reference(Organization)
      attr_accessor :date                # 0-1 date
      attr_accessor :amount              # 0-1 Quantity
    end

    class Note < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Note.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Note.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Note.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/note-type'=>['display', 'print', 'printoper']}, 'type'=>'Coding', 'path'=>'Note.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/note-type'}},
        'text' => {'type'=>'string', 'path'=>'Note.text', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-1 Coding
      attr_accessor :text              # 0-1 string
    end

    attr_accessor :id                            # 0-1 id
    attr_accessor :meta                          # 0-1 Meta
    attr_accessor :implicitRules                 # 0-1 uri
    attr_accessor :language                      # 0-1 code
    attr_accessor :text                          # 0-1 Narrative
    attr_accessor :contained                     # 0-* [ Resource ]
    attr_accessor :extension                     # 0-* [ Extension ]
    attr_accessor :modifierExtension             # 0-* [ Extension ]
    attr_accessor :identifier                    # 0-* [ Identifier ]
    attr_accessor :requestIdentifier             # 0-1 Identifier
    attr_accessor :requestReference              # 0-1 Reference(ProcessRequest)
    attr_accessor :outcome                       # 0-1 code
    attr_accessor :disposition                   # 0-1 string
    attr_accessor :ruleset                       # 0-1 Coding
    attr_accessor :originalRuleset               # 0-1 Coding
    attr_accessor :created                       # 0-1 dateTime
    attr_accessor :period                        # 0-1 Period
    attr_accessor :organizationIdentifier        # 0-1 Identifier
    attr_accessor :organizationReference         # 0-1 Reference(Organization)
    attr_accessor :requestProviderIdentifier     # 0-1 Identifier
    attr_accessor :requestProviderReference      # 0-1 Reference(Practitioner)
    attr_accessor :requestOrganizationIdentifier # 0-1 Identifier
    attr_accessor :requestOrganizationReference  # 0-1 Reference(Organization)
    attr_accessor :detail                        # 0-* [ PaymentReconciliation::Detail ]
    attr_accessor :form                          # 0-1 Coding
    attr_accessor :total                         # 1-1 Quantity
    attr_accessor :note                          # 0-* [ PaymentReconciliation::Note ]

    def resourceType
      'PaymentReconciliation'
    end
  end
end