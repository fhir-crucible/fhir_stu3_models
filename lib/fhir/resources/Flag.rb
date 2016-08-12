module FHIR
  class Flag < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["author", "date", "encounter", "patient", "subject"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Flag.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Flag.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Flag.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Flag.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Flag.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Flag.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Flag.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Flag.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Flag.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'category' => {'valid_codes'=>{'http://hl7.org/fhir/flag-category'=>['diet', 'drug', 'lab', 'admin', 'contact', 'diet', 'drug', 'lab', 'admin', 'contact']}, 'type'=>'CodeableConcept', 'path'=>'Flag.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/flag-category'}},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/flag-status'=>['active', 'inactive', 'entered-in-error', 'active', 'inactive', 'entered-in-error']}, 'type'=>'code', 'path'=>'Flag.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/flag-status'}},
      'period' => {'type'=>'Period', 'path'=>'Flag.period', 'min'=>0, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PlanDefinition', 'http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/Procedure'], 'type'=>'Reference', 'path'=>'Flag.subject', 'min'=>1, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Flag.encounter', 'min'=>0, 'max'=>1},
      'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Flag.author', 'min'=>0, 'max'=>1},
      'code' => {'valid_codes'=>{'http://snomed.info/sct'=>[]}, 'type'=>'CodeableConcept', 'path'=>'Flag.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/flag-code'}}
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
    attr_accessor :category          # 0-1 CodeableConcept
    attr_accessor :status            # 1-1 code
    attr_accessor :period            # 0-1 Period
    attr_accessor :subject           # 1-1 Reference(Patient|Location|Group|Organization|Practitioner|PlanDefinition|Medication|Procedure)
    attr_accessor :encounter         # 0-1 Reference(Encounter)
    attr_accessor :author            # 0-1 Reference(Device|Organization|Patient|Practitioner)
    attr_accessor :code              # 1-1 CodeableConcept

    def resourceType
      'Flag'
    end
  end
end