module FHIR
  module STU3
    class Contract < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      MULTIPLE_TYPES = {
        'binding' => ['Attachment', 'Reference']
      }
      SEARCH_PARAMS = ['agent', 'authority', 'domain', 'identifier', 'issued', 'patient', 'signer', 'subject', 'topic', 'ttopic']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Contract.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Contract.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Contract.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Contract.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
        'text' => {'type'=>'Narrative', 'path'=>'Contract.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Contract.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Contract.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Contract.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Contract.identifier', 'min'=>0, 'max'=>1},
        'issued' => {'type'=>'dateTime', 'path'=>'Contract.issued', 'min'=>0, 'max'=>1},
        'applies' => {'type'=>'Period', 'path'=>'Contract.applies', 'min'=>0, 'max'=>1},
        'subject' => {'type'=>'Reference', 'path'=>'Contract.subject', 'min'=>0, 'max'=>Float::INFINITY},
        'topic' => {'type'=>'Reference', 'path'=>'Contract.topic', 'min'=>0, 'max'=>Float::INFINITY},
        'authority' => {'type'=>'Reference', 'path'=>'Contract.authority', 'min'=>0, 'max'=>Float::INFINITY},
        'domain' => {'type'=>'Reference', 'path'=>'Contract.domain', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/contracttypecodes'=>['privacy', 'disclosure']}, 'type'=>'CodeableConcept', 'path'=>'Contract.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-type'}},
        'subType' => {'valid_codes'=>{'http://hl7.org/fhir/contractsubtypecodes'=>['disclosure-CA', 'disclosure-US']}, 'type'=>'CodeableConcept', 'path'=>'Contract.subType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-subtype'}},
        'action' => {'valid_codes'=>{'http://www.hl7.org/fhir/contractaction'=>['action-a', 'action-b']}, 'type'=>'CodeableConcept', 'path'=>'Contract.action', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-action'}},
        'actionReason' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH']}, 'type'=>'CodeableConcept', 'path'=>'Contract.actionReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-PurposeOfUse'}},
        'agent' => {'type'=>'Contract::Agent', 'path'=>'Contract.agent', 'min'=>0, 'max'=>Float::INFINITY},
        'signer' => {'type'=>'Contract::Signer', 'path'=>'Contract.signer', 'min'=>0, 'max'=>Float::INFINITY},
        'valuedItem' => {'type'=>'Contract::ValuedItem', 'path'=>'Contract.valuedItem', 'min'=>0, 'max'=>Float::INFINITY},
        'term' => {'type'=>'Contract::Term', 'path'=>'Contract.term', 'min'=>0, 'max'=>Float::INFINITY},
        'bindingAttachment' => {'type'=>'Attachment', 'path'=>'Contract.binding[x]', 'min'=>0, 'max'=>1},
        'bindingReference' => {'type'=>'Reference', 'path'=>'Contract.binding[x]', 'min'=>0, 'max'=>1},
        'friendly' => {'type'=>'Contract::Friendly', 'path'=>'Contract.friendly', 'min'=>0, 'max'=>Float::INFINITY},
        'legal' => {'type'=>'Contract::Legal', 'path'=>'Contract.legal', 'min'=>0, 'max'=>Float::INFINITY},
        'rule' => {'type'=>'Contract::Rule', 'path'=>'Contract.rule', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Agent < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Agent.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Agent.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Agent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'actor' => {'type'=>'Reference', 'path'=>'Agent.actor', 'min'=>1, 'max'=>1},
          'role' => {'valid_codes'=>{'http://www.hl7.org/fhir/contractactorrole'=>['practitioner', 'patient']}, 'type'=>'CodeableConcept', 'path'=>'Agent.role', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-actorrole'}}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :actor             # 1-1 Reference()
        attr_accessor :role              # 0-* [ CodeableConcept ]
      end

      class Signer < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Signer.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Signer.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Signer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://www.hl7.org/fhir/contractsignertypecodes'=>['AMENDER', 'AUTHN', 'AUT', 'AFFL', 'AGNT', 'ASSIGNED', 'CIT', 'CLAIMANT', 'COAUTH', 'CONSENTER', 'CONSWIT', 'CONT', 'COPART', 'COVPTY', 'DELEGATEE', 'delegator', 'DEPEND', 'DPOWATT', 'EMGCON', 'EVTWIT', 'EXCEST', 'GRANTEE', 'GRANTOR', 'GUAR', 'GUARD', 'GUADLTM', 'INF', 'INTPRT', 'INSBJ', 'HPOWATT', 'HPROV', 'LEGAUTHN', 'NMDINS', 'NOK', 'NOTARY', 'PAT', 'POWATT', 'PRIMAUTH', 'PRIRECIP', 'RECIP', 'RESPRSN', 'REVIEWER', 'TRANS', 'SOURCE', 'SPOWATT', 'VALID', 'VERF', 'WIT']}, 'type'=>'Coding', 'path'=>'Signer.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-signer-type'}},
          'party' => {'type'=>'Reference', 'path'=>'Signer.party', 'min'=>1, 'max'=>1},
          'signature' => {'type'=>'Signature', 'path'=>'Signer.signature', 'min'=>1, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 Coding
        attr_accessor :party             # 1-1 Reference()
        attr_accessor :signature         # 1-* [ Signature ]
      end

      class ValuedItem < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        MULTIPLE_TYPES = {
          'entity' => ['CodeableConcept', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'id', 'path'=>'ValuedItem.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ValuedItem.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'ValuedItem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'entityCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'ValuedItem.entity[x]', 'min'=>0, 'max'=>1},
          'entityReference' => {'type'=>'Reference', 'path'=>'ValuedItem.entity[x]', 'min'=>0, 'max'=>1},
          'identifier' => {'type'=>'Identifier', 'path'=>'ValuedItem.identifier', 'min'=>0, 'max'=>1},
          'effectiveTime' => {'type'=>'dateTime', 'path'=>'ValuedItem.effectiveTime', 'min'=>0, 'max'=>1},
          'quantity' => {'type'=>'Quantity', 'path'=>'ValuedItem.quantity', 'min'=>0, 'max'=>1},
          'unitPrice' => {'type'=>'Quantity', 'path'=>'ValuedItem.unitPrice', 'min'=>0, 'max'=>1},
          'factor' => {'type'=>'decimal', 'path'=>'ValuedItem.factor', 'min'=>0, 'max'=>1},
          'points' => {'type'=>'decimal', 'path'=>'ValuedItem.points', 'min'=>0, 'max'=>1},
          'net' => {'type'=>'Quantity', 'path'=>'ValuedItem.net', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                    # 0-1 id
        attr_accessor :extension             # 0-* [ Extension ]
        attr_accessor :modifierExtension     # 0-* [ Extension ]
        attr_accessor :entityCodeableConcept # 0-1 CodeableConcept
        attr_accessor :entityReference       # 0-1 Reference()
        attr_accessor :identifier            # 0-1 Identifier
        attr_accessor :effectiveTime         # 0-1 dateTime
        attr_accessor :quantity              # 0-1 Quantity
        attr_accessor :unitPrice             # 0-1 Quantity
        attr_accessor :factor                # 0-1 decimal
        attr_accessor :points                # 0-1 decimal
        attr_accessor :net                   # 0-1 Quantity
      end

      class Term < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Term.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Term.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Term.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'identifier' => {'type'=>'Identifier', 'path'=>'Term.identifier', 'min'=>0, 'max'=>1},
          'issued' => {'type'=>'dateTime', 'path'=>'Term.issued', 'min'=>0, 'max'=>1},
          'applies' => {'type'=>'Period', 'path'=>'Term.applies', 'min'=>0, 'max'=>1},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/contracttermtypecodes'=>['OralHealth', 'Vision']}, 'type'=>'CodeableConcept', 'path'=>'Term.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-term-type'}},
          'subType' => {'valid_codes'=>{'http://hl7.org/fhir/contracttermsubtypecodes'=>['OralHealth-Basic', 'OralHealth-Major', 'OralHealth-Orthodontic']}, 'type'=>'CodeableConcept', 'path'=>'Term.subType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-term-subtype'}},
          'topic' => {'type'=>'Reference', 'path'=>'Term.topic', 'min'=>0, 'max'=>Float::INFINITY},
          'action' => {'valid_codes'=>{'http://www.hl7.org/fhir/contractaction'=>['action-a', 'action-b']}, 'type'=>'CodeableConcept', 'path'=>'Term.action', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-action'}},
          'actionReason' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH']}, 'type'=>'CodeableConcept', 'path'=>'Term.actionReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-PurposeOfUse'}},
          'agent' => {'type'=>'Contract::Term::Agent', 'path'=>'Term.agent', 'min'=>0, 'max'=>Float::INFINITY},
          'text' => {'type'=>'string', 'path'=>'Term.text', 'min'=>0, 'max'=>1},
          'valuedItem' => {'type'=>'Contract::Term::ValuedItem', 'path'=>'Term.valuedItem', 'min'=>0, 'max'=>Float::INFINITY},
          'group' => {'type'=>'Term', 'path'=>'Term.group', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Agent < FHIR::STU3::Model
          include FHIR::STU3::Hashable
          include FHIR::STU3::Json
          include FHIR::STU3::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Agent.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Agent.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Agent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'actor' => {'type'=>'Reference', 'path'=>'Agent.actor', 'min'=>1, 'max'=>1},
            'role' => {'valid_codes'=>{'http://www.hl7.org/fhir/contractactorrole'=>['practitioner', 'patient']}, 'type'=>'CodeableConcept', 'path'=>'Agent.role', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-actorrole'}}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :actor             # 1-1 Reference()
          attr_accessor :role              # 0-* [ CodeableConcept ]
        end

        class ValuedItem < FHIR::STU3::Model
          include FHIR::STU3::Hashable
          include FHIR::STU3::Json
          include FHIR::STU3::Xml

          MULTIPLE_TYPES = {
            'entity' => ['CodeableConcept', 'Reference']
          }
          METADATA = {
            'id' => {'type'=>'id', 'path'=>'ValuedItem.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'ValuedItem.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'ValuedItem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'entityCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'ValuedItem.entity[x]', 'min'=>0, 'max'=>1},
            'entityReference' => {'type'=>'Reference', 'path'=>'ValuedItem.entity[x]', 'min'=>0, 'max'=>1},
            'identifier' => {'type'=>'Identifier', 'path'=>'ValuedItem.identifier', 'min'=>0, 'max'=>1},
            'effectiveTime' => {'type'=>'dateTime', 'path'=>'ValuedItem.effectiveTime', 'min'=>0, 'max'=>1},
            'quantity' => {'type'=>'Quantity', 'path'=>'ValuedItem.quantity', 'min'=>0, 'max'=>1},
            'unitPrice' => {'type'=>'Quantity', 'path'=>'ValuedItem.unitPrice', 'min'=>0, 'max'=>1},
            'factor' => {'type'=>'decimal', 'path'=>'ValuedItem.factor', 'min'=>0, 'max'=>1},
            'points' => {'type'=>'decimal', 'path'=>'ValuedItem.points', 'min'=>0, 'max'=>1},
            'net' => {'type'=>'Quantity', 'path'=>'ValuedItem.net', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                    # 0-1 id
          attr_accessor :extension             # 0-* [ Extension ]
          attr_accessor :modifierExtension     # 0-* [ Extension ]
          attr_accessor :entityCodeableConcept # 0-1 CodeableConcept
          attr_accessor :entityReference       # 0-1 Reference()
          attr_accessor :identifier            # 0-1 Identifier
          attr_accessor :effectiveTime         # 0-1 dateTime
          attr_accessor :quantity              # 0-1 Quantity
          attr_accessor :unitPrice             # 0-1 Quantity
          attr_accessor :factor                # 0-1 decimal
          attr_accessor :points                # 0-1 decimal
          attr_accessor :net                   # 0-1 Quantity
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :identifier        # 0-1 Identifier
        attr_accessor :issued            # 0-1 dateTime
        attr_accessor :applies           # 0-1 Period
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :subType           # 0-1 CodeableConcept
        attr_accessor :topic             # 0-* [ Reference() ]
        attr_accessor :action            # 0-* [ CodeableConcept ]
        attr_accessor :actionReason      # 0-* [ CodeableConcept ]
        attr_accessor :agent             # 0-* [ Contract::Term::Agent ]
        attr_accessor :text              # 0-1 string
        attr_accessor :valuedItem        # 0-* [ Contract::Term::ValuedItem ]
        attr_accessor :group             # 0-* [ Term ]
      end

      class Friendly < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        MULTIPLE_TYPES = {
          'content' => ['Attachment', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Friendly.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Friendly.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Friendly.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'contentAttachment' => {'type'=>'Attachment', 'path'=>'Friendly.content[x]', 'min'=>1, 'max'=>1},
          'contentReference' => {'type'=>'Reference', 'path'=>'Friendly.content[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :contentAttachment # 1-1 Attachment
        attr_accessor :contentReference  # 1-1 Reference()
      end

      class Legal < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        MULTIPLE_TYPES = {
          'content' => ['Attachment', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Legal.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Legal.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Legal.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'contentAttachment' => {'type'=>'Attachment', 'path'=>'Legal.content[x]', 'min'=>1, 'max'=>1},
          'contentReference' => {'type'=>'Reference', 'path'=>'Legal.content[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :contentAttachment # 1-1 Attachment
        attr_accessor :contentReference  # 1-1 Reference()
      end

      class Rule < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        MULTIPLE_TYPES = {
          'content' => ['Attachment', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Rule.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Rule.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Rule.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'contentAttachment' => {'type'=>'Attachment', 'path'=>'Rule.content[x]', 'min'=>1, 'max'=>1},
          'contentReference' => {'type'=>'Reference', 'path'=>'Rule.content[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :contentAttachment # 1-1 Attachment
        attr_accessor :contentReference  # 1-1 Reference()
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 0-1 Identifier
      attr_accessor :issued            # 0-1 dateTime
      attr_accessor :applies           # 0-1 Period
      attr_accessor :subject           # 0-* [ Reference() ]
      attr_accessor :topic             # 0-* [ Reference() ]
      attr_accessor :authority         # 0-* [ Reference() ]
      attr_accessor :domain            # 0-* [ Reference() ]
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :subType           # 0-* [ CodeableConcept ]
      attr_accessor :action            # 0-* [ CodeableConcept ]
      attr_accessor :actionReason      # 0-* [ CodeableConcept ]
      attr_accessor :agent             # 0-* [ Contract::Agent ]
      attr_accessor :signer            # 0-* [ Contract::Signer ]
      attr_accessor :valuedItem        # 0-* [ Contract::ValuedItem ]
      attr_accessor :term              # 0-* [ Contract::Term ]
      attr_accessor :bindingAttachment # 0-1 Attachment
      attr_accessor :bindingReference  # 0-1 Reference()
      attr_accessor :friendly          # 0-* [ Contract::Friendly ]
      attr_accessor :legal             # 0-* [ Contract::Legal ]
      attr_accessor :rule              # 0-* [ Contract::Rule ]

      def resourceType
        'Contract'
      end
    end
  end
end