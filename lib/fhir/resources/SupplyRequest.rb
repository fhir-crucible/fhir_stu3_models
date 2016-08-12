module FHIR
  class SupplyRequest < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'orderedItem' => ['CodeableConcept', 'Reference'],
      'reason' => ['CodeableConcept', 'Reference']
    }
    SEARCH_PARAMS = ["date", "identifier", "kind", "patient", "source", "status", "supplier"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'SupplyRequest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'SupplyRequest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'SupplyRequest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'SupplyRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'SupplyRequest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'SupplyRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'SupplyRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'SupplyRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'SupplyRequest.patient', 'min'=>0, 'max'=>1},
      'source' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'SupplyRequest.source', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'SupplyRequest.date', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'SupplyRequest.identifier', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/supplyrequest-status'=>['requested', 'completed', 'failed', 'cancelled', 'requested', 'completed', 'failed', 'cancelled']}, 'type'=>'code', 'path'=>'SupplyRequest.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/supplyrequest-status'}},
      'kind' => {'valid_codes'=>{'http://hl7.org/fhir/supply-kind'=>['central', 'nonstock', 'central', 'nonstock']}, 'type'=>'CodeableConcept', 'path'=>'SupplyRequest.kind', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/supplyrequest-kind'}},
      'orderedItemCodeableConcept' => {'valid_codes'=>{'http://snomed.info/sct'=>[]}, 'type'=>'CodeableConcept', 'path'=>'SupplyRequest.orderedItem[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/supply-item'}},
      'orderedItemReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/Substance', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'SupplyRequest.orderedItem[x]', 'min'=>0, 'max'=>1},
      'supplier' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'SupplyRequest.supplier', 'min'=>0, 'max'=>Float::INFINITY},
      'reasonCodeableConcept' => {'valid_codes'=>{'http://hl7.org/fhir/supplyrequest-reason'=>['patient-care', 'ward-stock', 'patient-care', 'ward-stock']}, 'type'=>'CodeableConcept', 'path'=>'SupplyRequest.reason[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/supplyrequest-reason'}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'SupplyRequest.reason[x]', 'min'=>0, 'max'=>1},
      'when' => {'type'=>'SupplyRequest::When', 'path'=>'SupplyRequest.when', 'min'=>0, 'max'=>1}
    }

    class When < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'When.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'When.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'When.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'valid_codes'=>{'http://snomed.info/sct'=>[]}, 'type'=>'CodeableConcept', 'path'=>'When.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/supplyrequest-when'}},
        'schedule' => {'type'=>'Timing', 'path'=>'When.schedule', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :code              # 0-1 CodeableConcept
      attr_accessor :schedule          # 0-1 Timing
    end

    attr_accessor :id                         # 0-1 id
    attr_accessor :meta                       # 0-1 Meta
    attr_accessor :implicitRules              # 0-1 uri
    attr_accessor :language                   # 0-1 code
    attr_accessor :text                       # 0-1 Narrative
    attr_accessor :contained                  # 0-* [ Resource ]
    attr_accessor :extension                  # 0-* [ Extension ]
    attr_accessor :modifierExtension          # 0-* [ Extension ]
    attr_accessor :patient                    # 0-1 Reference(Patient)
    attr_accessor :source                     # 0-1 Reference(Practitioner|Organization|Patient)
    attr_accessor :date                       # 0-1 dateTime
    attr_accessor :identifier                 # 0-1 Identifier
    attr_accessor :status                     # 0-1 code
    attr_accessor :kind                       # 0-1 CodeableConcept
    attr_accessor :orderedItemCodeableConcept # 0-1 CodeableConcept
    attr_accessor :orderedItemReference       # 0-1 Reference(Medication|Substance|Device)
    attr_accessor :supplier                   # 0-* [ Reference(Organization) ]
    attr_accessor :reasonCodeableConcept      # 0-1 CodeableConcept
    attr_accessor :reasonReference            # 0-1 Reference(Resource)
    attr_accessor :when                       # 0-1 SupplyRequest::When

    def resourceType
      'SupplyRequest'
    end
  end
end