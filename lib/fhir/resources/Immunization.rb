module FHIR
  class Immunization < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["date", "dose-sequence", "identifier", "location", "lot-number", "manufacturer", "notgiven", "patient", "performer", "reaction", "reaction-date", "reason", "reason-not-given", "requester", "status", "vaccine-code"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Immunization.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Immunization.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Immunization.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Immunization.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'Immunization.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Immunization.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Immunization.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Immunization.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Immunization.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/medication-admin-status'=>['in-progress', 'on-hold', 'completed', 'entered-in-error', 'stopped']}, 'type'=>'code', 'path'=>'Immunization.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/medication-admin-status'}},
      'date' => {'type'=>'dateTime', 'path'=>'Immunization.date', 'min'=>0, 'max'=>1},
      'vaccineCode' => {'type'=>'CodeableConcept', 'path'=>'Immunization.vaccineCode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/vaccine-code'}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Immunization.patient', 'min'=>1, 'max'=>1},
      'wasNotGiven' => {'type'=>'boolean', 'path'=>'Immunization.wasNotGiven', 'min'=>1, 'max'=>1},
      'reported' => {'type'=>'boolean', 'path'=>'Immunization.reported', 'min'=>1, 'max'=>1},
      'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Immunization.performer', 'min'=>0, 'max'=>1},
      'requester' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Immunization.requester', 'min'=>0, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Immunization.encounter', 'min'=>0, 'max'=>1},
      'manufacturer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Immunization.manufacturer', 'min'=>0, 'max'=>1},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Immunization.location', 'min'=>0, 'max'=>1},
      'lotNumber' => {'type'=>'string', 'path'=>'Immunization.lotNumber', 'min'=>0, 'max'=>1},
      'expirationDate' => {'type'=>'date', 'path'=>'Immunization.expirationDate', 'min'=>0, 'max'=>1},
      'site' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActSite'=>['LA', 'RA']}, 'type'=>'CodeableConcept', 'path'=>'Immunization.site', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-site'}},
      'route' => {'valid_codes'=>{'http://hl7.org/fhir/v3/RouteOfAdministration'=>['IM', 'PO', 'NASINHL']}, 'type'=>'CodeableConcept', 'path'=>'Immunization.route', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-route'}},
      'doseQuantity' => {'type'=>'Quantity', 'path'=>'Immunization.doseQuantity', 'min'=>0, 'max'=>1},
      'note' => {'type'=>'Annotation', 'path'=>'Immunization.note', 'min'=>0, 'max'=>Float::INFINITY},
      'explanation' => {'type'=>'Immunization::Explanation', 'path'=>'Immunization.explanation', 'min'=>0, 'max'=>1},
      'reaction' => {'type'=>'Immunization::Reaction', 'path'=>'Immunization.reaction', 'min'=>0, 'max'=>Float::INFINITY},
      'vaccinationProtocol' => {'type'=>'Immunization::Vaccinationprotocol', 'path'=>'Immunization.vaccinationProtocol', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Explanation < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Explanation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Explanation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Explanation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'reason' => {'valid_codes'=>{'http://snomed.info/sct'=>['429060002', '281657000']}, 'type'=>'CodeableConcept', 'path'=>'Explanation.reason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-reason'}},
        'reasonNotGiven' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['IMMUNE', 'MEDPREC', 'OSTOCK', 'PATOBJ'], 'http://snomed.info/sct'=>['171257003', '171265000', '171266004', '171267008', '171268003', '171269006', '171270007', '171271006', '171272004', '171280006', '171283008', '171285001', '171286000', '171291004', '171292006', '171293001', '268559007', '310839003', '310840001', '314768003', '314769006', '314936001', '407598009']}, 'type'=>'CodeableConcept', 'path'=>'Explanation.reasonNotGiven', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/no-immunization-reason'}}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :reason            # 0-* [ CodeableConcept ]
      attr_accessor :reasonNotGiven    # 0-* [ CodeableConcept ]
    end

    class Reaction < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Reaction.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Reaction.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Reaction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'date' => {'type'=>'dateTime', 'path'=>'Reaction.date', 'min'=>0, 'max'=>1},
        'detail' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'Reaction.detail', 'min'=>0, 'max'=>1},
        'reported' => {'type'=>'boolean', 'path'=>'Reaction.reported', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :date              # 0-1 dateTime
      attr_accessor :detail            # 0-1 Reference(Observation)
      attr_accessor :reported          # 0-1 boolean
    end

    class Vaccinationprotocol < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Vaccinationprotocol.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Vaccinationprotocol.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Vaccinationprotocol.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'doseSequence' => {'type'=>'positiveInt', 'path'=>'Vaccinationprotocol.doseSequence', 'min'=>1, 'max'=>1},
        'description' => {'type'=>'string', 'path'=>'Vaccinationprotocol.description', 'min'=>0, 'max'=>1},
        'authority' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Vaccinationprotocol.authority', 'min'=>0, 'max'=>1},
        'series' => {'type'=>'string', 'path'=>'Vaccinationprotocol.series', 'min'=>0, 'max'=>1},
        'seriesDoses' => {'type'=>'positiveInt', 'path'=>'Vaccinationprotocol.seriesDoses', 'min'=>0, 'max'=>1},
        'targetDisease' => {'valid_codes'=>{'http://snomed.info/sct'=>['1857005', '397430003', '14189004', '36989005', '36653000', '76902006', '709410003', '27836007', '398102009']}, 'type'=>'CodeableConcept', 'path'=>'Vaccinationprotocol.targetDisease', 'min'=>1, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/vaccination-protocol-dose-target'}},
        'doseStatus' => {'valid_codes'=>{'http://hl7.org/fhir/vaccination-protocol-dose-status'=>['count', 'nocount']}, 'type'=>'CodeableConcept', 'path'=>'Vaccinationprotocol.doseStatus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/vaccination-protocol-dose-status'}},
        'doseStatusReason' => {'valid_codes'=>{'http://hl7.org/fhir/vaccination-protocol-dose-status-reason'=>['advstorage', 'coldchbrk', 'explot', 'outsidesched', 'prodrecall']}, 'type'=>'CodeableConcept', 'path'=>'Vaccinationprotocol.doseStatusReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/vaccination-protocol-dose-status-reason'}}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :doseSequence      # 1-1 positiveInt
      attr_accessor :description       # 0-1 string
      attr_accessor :authority         # 0-1 Reference(Organization)
      attr_accessor :series            # 0-1 string
      attr_accessor :seriesDoses       # 0-1 positiveInt
      attr_accessor :targetDisease     # 1-* [ CodeableConcept ]
      attr_accessor :doseStatus        # 1-1 CodeableConcept
      attr_accessor :doseStatusReason  # 0-1 CodeableConcept
    end

    attr_accessor :id                  # 0-1 id
    attr_accessor :meta                # 0-1 Meta
    attr_accessor :implicitRules       # 0-1 uri
    attr_accessor :language            # 0-1 code
    attr_accessor :text                # 0-1 Narrative
    attr_accessor :contained           # 0-* [ Resource ]
    attr_accessor :extension           # 0-* [ Extension ]
    attr_accessor :modifierExtension   # 0-* [ Extension ]
    attr_accessor :identifier          # 0-* [ Identifier ]
    attr_accessor :status              # 1-1 code
    attr_accessor :date                # 0-1 dateTime
    attr_accessor :vaccineCode         # 1-1 CodeableConcept
    attr_accessor :patient             # 1-1 Reference(Patient)
    attr_accessor :wasNotGiven         # 1-1 boolean
    attr_accessor :reported            # 1-1 boolean
    attr_accessor :performer           # 0-1 Reference(Practitioner)
    attr_accessor :requester           # 0-1 Reference(Practitioner)
    attr_accessor :encounter           # 0-1 Reference(Encounter)
    attr_accessor :manufacturer        # 0-1 Reference(Organization)
    attr_accessor :location            # 0-1 Reference(Location)
    attr_accessor :lotNumber           # 0-1 string
    attr_accessor :expirationDate      # 0-1 date
    attr_accessor :site                # 0-1 CodeableConcept
    attr_accessor :route               # 0-1 CodeableConcept
    attr_accessor :doseQuantity        # 0-1 Quantity
    attr_accessor :note                # 0-* [ Annotation ]
    attr_accessor :explanation         # 0-1 Immunization::Explanation
    attr_accessor :reaction            # 0-* [ Immunization::Reaction ]
    attr_accessor :vaccinationProtocol # 0-* [ Immunization::Vaccinationprotocol ]

    def resourceType
      'Immunization'
    end
  end
end