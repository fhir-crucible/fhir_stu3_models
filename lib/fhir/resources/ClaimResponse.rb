module FHIR
  class ClaimResponse < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'request' => ['Identifier', 'Reference'],
      'organization' => ['Identifier', 'Reference'],
      'requestProvider' => ['Identifier', 'Reference'],
      'requestOrganization' => ['Identifier', 'Reference']
    }
    SEARCH_PARAMS = ["created", "disposition", "identifier", "organization-identifier", "organization-reference", "outcome", "paymentdate", "request-identifier", "request-reference"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ClaimResponse.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ClaimResponse.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ClaimResponse.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ClaimResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'ClaimResponse.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ClaimResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ClaimResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ClaimResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ClaimResponse.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/claimresponse-status'=>['active', 'cancelled', 'draft', 'entered-in-error', 'active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'ClaimResponse.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/claimresponse-status'}},
      'requestIdentifier' => {'type'=>'Identifier', 'path'=>'ClaimResponse.request[x]', 'min'=>0, 'max'=>1},
      'requestReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Claim'], 'type'=>'Reference', 'path'=>'ClaimResponse.request[x]', 'min'=>0, 'max'=>1},
      'ruleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3', 'x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'ClaimResponse.ruleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'originalRuleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3', 'x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'ClaimResponse.originalRuleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'created' => {'type'=>'dateTime', 'path'=>'ClaimResponse.created', 'min'=>0, 'max'=>1},
      'organizationIdentifier' => {'type'=>'Identifier', 'path'=>'ClaimResponse.organization[x]', 'min'=>0, 'max'=>1},
      'organizationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ClaimResponse.organization[x]', 'min'=>0, 'max'=>1},
      'requestProviderIdentifier' => {'type'=>'Identifier', 'path'=>'ClaimResponse.requestProvider[x]', 'min'=>0, 'max'=>1},
      'requestProviderReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'ClaimResponse.requestProvider[x]', 'min'=>0, 'max'=>1},
      'requestOrganizationIdentifier' => {'type'=>'Identifier', 'path'=>'ClaimResponse.requestOrganization[x]', 'min'=>0, 'max'=>1},
      'requestOrganizationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ClaimResponse.requestOrganization[x]', 'min'=>0, 'max'=>1},
      'outcome' => {'valid_codes'=>{'http://hl7.org/fhir/remittance-outcome'=>['complete', 'error', 'partial', 'complete', 'error', 'partial']}, 'type'=>'Coding', 'path'=>'ClaimResponse.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/remittance-outcome'}},
      'disposition' => {'type'=>'string', 'path'=>'ClaimResponse.disposition', 'min'=>0, 'max'=>1},
      'payeeType' => {'valid_codes'=>{'http://hl7.org/fhir/payeetype'=>['subscriber', 'provider', 'other', 'subscriber', 'provider', 'other']}, 'type'=>'Coding', 'path'=>'ClaimResponse.payeeType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/payeetype'}},
      'item' => {'type'=>'ClaimResponse::Item', 'path'=>'ClaimResponse.item', 'min'=>0, 'max'=>Float::INFINITY},
      'addItem' => {'type'=>'ClaimResponse::AddItem', 'path'=>'ClaimResponse.addItem', 'min'=>0, 'max'=>Float::INFINITY},
      'error' => {'type'=>'ClaimResponse::Error', 'path'=>'ClaimResponse.error', 'min'=>0, 'max'=>Float::INFINITY},
      'totalCost' => {'type'=>'Money', 'path'=>'ClaimResponse.totalCost', 'min'=>0, 'max'=>1},
      'unallocDeductable' => {'type'=>'Money', 'path'=>'ClaimResponse.unallocDeductable', 'min'=>0, 'max'=>1},
      'totalBenefit' => {'type'=>'Money', 'path'=>'ClaimResponse.totalBenefit', 'min'=>0, 'max'=>1},
      'payment' => {'type'=>'ClaimResponse::Payment', 'path'=>'ClaimResponse.payment', 'min'=>0, 'max'=>1},
      'reserved' => {'valid_codes'=>{'http://hl7.org/fhir/fundsreserve'=>['patient', 'provider', 'none', 'patient', 'provider', 'none']}, 'type'=>'Coding', 'path'=>'ClaimResponse.reserved', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/fundsreserve'}},
      'form' => {'valid_codes'=>{'http://hl7.org/fhir/forms-codes'=>['1', '2', '1', '2']}, 'type'=>'Coding', 'path'=>'ClaimResponse.form', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/forms'}},
      'note' => {'type'=>'ClaimResponse::Note', 'path'=>'ClaimResponse.note', 'min'=>0, 'max'=>Float::INFINITY},
      'coverage' => {'type'=>'ClaimResponse::Coverage', 'path'=>'ClaimResponse.coverage', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Item < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequenceLinkId' => {'type'=>'positiveInt', 'path'=>'Item.sequenceLinkId', 'min'=>1, 'max'=>1},
        'noteNumber' => {'type'=>'positiveInt', 'path'=>'Item.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
        'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'Item.adjudication', 'min'=>0, 'max'=>Float::INFINITY},
        'detail' => {'type'=>'ClaimResponse::Item::Detail', 'path'=>'Item.detail', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Adjudication < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Adjudication.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Adjudication.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Adjudication.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'category' => {'valid_codes'=>{'http://hl7.org/fhir/adjudication'=>['total', 'copay', 'eligible', 'deductible', 'eligpercent', 'tax', 'benefit', 'total', 'copay', 'eligible', 'deductible', 'eligpercent', 'tax', 'benefit']}, 'type'=>'Coding', 'path'=>'Adjudication.category', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/adjudication'}},
          'reason' => {'valid_codes'=>{'http://hl7.org/fhir/adjudication-reason'=>['ar001', 'ar002', 'ar001', 'ar002']}, 'type'=>'Coding', 'path'=>'Adjudication.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/adjudication-reason'}},
          'amount' => {'type'=>'Money', 'path'=>'Adjudication.amount', 'min'=>0, 'max'=>1},
          'value' => {'type'=>'decimal', 'path'=>'Adjudication.value', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :category          # 1-1 Coding
        attr_accessor :reason            # 0-1 Coding
        attr_accessor :amount            # 0-1 Money
        attr_accessor :value             # 0-1 decimal
      end

      class Detail < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequenceLinkId' => {'type'=>'positiveInt', 'path'=>'Detail.sequenceLinkId', 'min'=>1, 'max'=>1},
          'noteNumber' => {'type'=>'positiveInt', 'path'=>'Detail.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
          'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'Detail.adjudication', 'min'=>0, 'max'=>Float::INFINITY},
          'subDetail' => {'type'=>'ClaimResponse::Item::Detail::SubDetail', 'path'=>'Detail.subDetail', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class SubDetail < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'SubDetail.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'SubDetail.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'SubDetail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'sequenceLinkId' => {'type'=>'positiveInt', 'path'=>'SubDetail.sequenceLinkId', 'min'=>1, 'max'=>1},
            'noteNumber' => {'type'=>'positiveInt', 'path'=>'SubDetail.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
            'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'SubDetail.adjudication', 'min'=>0, 'max'=>Float::INFINITY}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :sequenceLinkId    # 1-1 positiveInt
          attr_accessor :noteNumber        # 0-* [ positiveInt ]
          attr_accessor :adjudication      # 0-* [ ClaimResponse::Item::Adjudication ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :sequenceLinkId    # 1-1 positiveInt
        attr_accessor :noteNumber        # 0-* [ positiveInt ]
        attr_accessor :adjudication      # 0-* [ ClaimResponse::Item::Adjudication ]
        attr_accessor :subDetail         # 0-* [ ClaimResponse::Item::Detail::SubDetail ]
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :sequenceLinkId    # 1-1 positiveInt
      attr_accessor :noteNumber        # 0-* [ positiveInt ]
      attr_accessor :adjudication      # 0-* [ ClaimResponse::Item::Adjudication ]
      attr_accessor :detail            # 0-* [ ClaimResponse::Item::Detail ]
    end

    class AddItem < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'AddItem.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'AddItem.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'AddItem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequenceLinkId' => {'type'=>'positiveInt', 'path'=>'AddItem.sequenceLinkId', 'min'=>0, 'max'=>Float::INFINITY},
        'revenue' => {'valid_codes'=>{'http://hl7.org/fhir/ex-revenue-center'=>['0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452', '0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452']}, 'type'=>'Coding', 'path'=>'AddItem.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center'}},
        'category' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-subcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6', '1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'Coding', 'path'=>'AddItem.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-subcategory'}},
        'service' => {'valid_codes'=>{'http://hl7.org/fhir/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555', '1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555']}, 'type'=>'Coding', 'path'=>'AddItem.service', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
        'modifier' => {'valid_codes'=>{'http://hl7.org/fhir/modifiers'=>['a', 'b', 'c', 'e', 'x', 'a', 'b', 'c', 'e', 'x']}, 'type'=>'Coding', 'path'=>'AddItem.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
        'fee' => {'type'=>'Money', 'path'=>'AddItem.fee', 'min'=>0, 'max'=>1},
        'noteNumber' => {'type'=>'positiveInt', 'path'=>'AddItem.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
        'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'AddItem.adjudication', 'min'=>0, 'max'=>Float::INFINITY},
        'detail' => {'type'=>'ClaimResponse::AddItem::Detail', 'path'=>'AddItem.detail', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Detail < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'revenue' => {'valid_codes'=>{'http://hl7.org/fhir/ex-revenue-center'=>['0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452', '0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452']}, 'type'=>'Coding', 'path'=>'Detail.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center'}},
          'category' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-subcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6', '1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'Coding', 'path'=>'Detail.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-subcategory'}},
          'service' => {'valid_codes'=>{'http://hl7.org/fhir/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555', '1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555']}, 'type'=>'Coding', 'path'=>'Detail.service', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
          'modifier' => {'valid_codes'=>{'http://hl7.org/fhir/modifiers'=>['a', 'b', 'c', 'e', 'x', 'a', 'b', 'c', 'e', 'x']}, 'type'=>'Coding', 'path'=>'Detail.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
          'fee' => {'type'=>'Money', 'path'=>'Detail.fee', 'min'=>0, 'max'=>1},
          'noteNumber' => {'type'=>'positiveInt', 'path'=>'Detail.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
          'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'Detail.adjudication', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :revenue           # 0-1 Coding
        attr_accessor :category          # 0-1 Coding
        attr_accessor :service           # 0-1 Coding
        attr_accessor :modifier          # 0-* [ Coding ]
        attr_accessor :fee               # 0-1 Money
        attr_accessor :noteNumber        # 0-* [ positiveInt ]
        attr_accessor :adjudication      # 0-* [ ClaimResponse::Item::Adjudication ]
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :sequenceLinkId    # 0-* [ positiveInt ]
      attr_accessor :revenue           # 0-1 Coding
      attr_accessor :category          # 0-1 Coding
      attr_accessor :service           # 0-1 Coding
      attr_accessor :modifier          # 0-* [ Coding ]
      attr_accessor :fee               # 0-1 Money
      attr_accessor :noteNumber        # 0-* [ positiveInt ]
      attr_accessor :adjudication      # 0-* [ ClaimResponse::Item::Adjudication ]
      attr_accessor :detail            # 0-* [ ClaimResponse::AddItem::Detail ]
    end

    class Error < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Error.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Error.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Error.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequenceLinkId' => {'type'=>'positiveInt', 'path'=>'Error.sequenceLinkId', 'min'=>0, 'max'=>1},
        'detailSequenceLinkId' => {'type'=>'positiveInt', 'path'=>'Error.detailSequenceLinkId', 'min'=>0, 'max'=>1},
        'subdetailSequenceLinkId' => {'type'=>'positiveInt', 'path'=>'Error.subdetailSequenceLinkId', 'min'=>0, 'max'=>1},
        'code' => {'valid_codes'=>{'http://hl7.org/fhir/adjudication-error'=>['a001', 'a002', 'a001', 'a002']}, 'type'=>'Coding', 'path'=>'Error.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/adjudication-error'}}
      }

      attr_accessor :id                      # 0-1 string
      attr_accessor :extension               # 0-* [ Extension ]
      attr_accessor :modifierExtension       # 0-* [ Extension ]
      attr_accessor :sequenceLinkId          # 0-1 positiveInt
      attr_accessor :detailSequenceLinkId    # 0-1 positiveInt
      attr_accessor :subdetailSequenceLinkId # 0-1 positiveInt
      attr_accessor :code                    # 1-1 Coding
    end

    class Payment < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Payment.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Payment.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Payment.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/ex-paymenttype'=>['complete', 'partial', 'complete', 'partial']}, 'type'=>'Coding', 'path'=>'Payment.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-paymenttype'}},
        'adjustment' => {'type'=>'Money', 'path'=>'Payment.adjustment', 'min'=>0, 'max'=>1},
        'adjustmentReason' => {'valid_codes'=>{'http://hl7.org/fhir/payment-adjustment-reason'=>['a001', 'a002', 'a001', 'a002']}, 'type'=>'Coding', 'path'=>'Payment.adjustmentReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/payment-adjustment-reason'}},
        'date' => {'type'=>'date', 'path'=>'Payment.date', 'min'=>0, 'max'=>1},
        'amount' => {'type'=>'Money', 'path'=>'Payment.amount', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'Payment.identifier', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-1 Coding
      attr_accessor :adjustment        # 0-1 Money
      attr_accessor :adjustmentReason  # 0-1 Coding
      attr_accessor :date              # 0-1 date
      attr_accessor :amount            # 0-1 Money
      attr_accessor :identifier        # 0-1 Identifier
    end

    class Note < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Note.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Note.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Note.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'number' => {'type'=>'positiveInt', 'path'=>'Note.number', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/note-type'=>['display', 'print', 'printoper', 'display', 'print', 'printoper']}, 'type'=>'Coding', 'path'=>'Note.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/note-type'}},
        'text' => {'type'=>'string', 'path'=>'Note.text', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'Coding', 'path'=>'Note.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :number            # 0-1 positiveInt
      attr_accessor :type              # 0-1 Coding
      attr_accessor :text              # 0-1 string
      attr_accessor :language          # 0-1 Coding
    end

    class Coverage < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'coverage' => ['Identifier', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Coverage.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Coverage.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Coverage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Coverage.sequence', 'min'=>1, 'max'=>1},
        'focal' => {'type'=>'boolean', 'path'=>'Coverage.focal', 'min'=>1, 'max'=>1},
        'coverageIdentifier' => {'type'=>'Identifier', 'path'=>'Coverage.coverage[x]', 'min'=>1, 'max'=>1},
        'coverageReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage'], 'type'=>'Reference', 'path'=>'Coverage.coverage[x]', 'min'=>1, 'max'=>1},
        'businessArrangement' => {'type'=>'string', 'path'=>'Coverage.businessArrangement', 'min'=>0, 'max'=>1},
        'preAuthRef' => {'type'=>'string', 'path'=>'Coverage.preAuthRef', 'min'=>0, 'max'=>Float::INFINITY},
        'claimResponse' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ClaimResponse'], 'type'=>'Reference', 'path'=>'Coverage.claimResponse', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                  # 0-1 string
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :sequence            # 1-1 positiveInt
      attr_accessor :focal               # 1-1 boolean
      attr_accessor :coverageIdentifier  # 1-1 Identifier
      attr_accessor :coverageReference   # 1-1 Reference(Coverage)
      attr_accessor :businessArrangement # 0-1 string
      attr_accessor :preAuthRef          # 0-* [ string ]
      attr_accessor :claimResponse       # 0-1 Reference(ClaimResponse)
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
    attr_accessor :status                        # 1-1 code
    attr_accessor :requestIdentifier             # 0-1 Identifier
    attr_accessor :requestReference              # 0-1 Reference(Claim)
    attr_accessor :ruleset                       # 0-1 Coding
    attr_accessor :originalRuleset               # 0-1 Coding
    attr_accessor :created                       # 0-1 dateTime
    attr_accessor :organizationIdentifier        # 0-1 Identifier
    attr_accessor :organizationReference         # 0-1 Reference(Organization)
    attr_accessor :requestProviderIdentifier     # 0-1 Identifier
    attr_accessor :requestProviderReference      # 0-1 Reference(Practitioner)
    attr_accessor :requestOrganizationIdentifier # 0-1 Identifier
    attr_accessor :requestOrganizationReference  # 0-1 Reference(Organization)
    attr_accessor :outcome                       # 0-1 Coding
    attr_accessor :disposition                   # 0-1 string
    attr_accessor :payeeType                     # 0-1 Coding
    attr_accessor :item                          # 0-* [ ClaimResponse::Item ]
    attr_accessor :addItem                       # 0-* [ ClaimResponse::AddItem ]
    attr_accessor :error                         # 0-* [ ClaimResponse::Error ]
    attr_accessor :totalCost                     # 0-1 Money
    attr_accessor :unallocDeductable             # 0-1 Money
    attr_accessor :totalBenefit                  # 0-1 Money
    attr_accessor :payment                       # 0-1 ClaimResponse::Payment
    attr_accessor :reserved                      # 0-1 Coding
    attr_accessor :form                          # 0-1 Coding
    attr_accessor :note                          # 0-* [ ClaimResponse::Note ]
    attr_accessor :coverage                      # 0-* [ ClaimResponse::Coverage ]

    def resourceType
      'ClaimResponse'
    end
  end
end