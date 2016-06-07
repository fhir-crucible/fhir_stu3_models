module FHIR
  class DetectedIssue < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["author", "category", "date", "identifier", "implicated", "patient"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'DetectedIssue.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'DetectedIssue.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'DetectedIssue.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'DetectedIssue.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'DetectedIssue.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'DetectedIssue.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'DetectedIssue.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'DetectedIssue.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'DetectedIssue.patient', 'min'=>0, 'max'=>1},
      'category' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActCode'=>['_AdministrationDetectedIssueCode', '_AppropriatenessDetectedIssueCode', '_InteractionDetectedIssueCode', 'FOOD', 'TPROD', 'DRG', 'NHP', 'NONRX', 'PREVINEF', 'DACT', 'TIME', 'ALRTENDLATE', 'ALRTSTRTLATE', '_TimingDetectedIssueCode', 'ENDLATE', 'STRTLATE', '_SupplyDetectedIssueCode', 'ALLDONE', 'FULFIL', 'NOTACTN', 'NOTEQUIV', 'NOTEQUIVGEN', 'NOTEQUIVTHER', 'TIMING', 'INTERVAL', 'MINFREQ', 'HELD', 'TOOLATE', 'TOOSOON']}, 'type'=>'CodeableConcept', 'path'=>'DetectedIssue.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/detectedissue-category'}},
      'severity' => {'valid_codes'=>{'http://hl7.org/fhir/detectedissue-severity'=>['high', 'moderate', 'low']}, 'type'=>'code', 'path'=>'DetectedIssue.severity', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/detectedissue-severity'}},
      'implicated' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'DetectedIssue.implicated', 'min'=>0, 'max'=>Float::INFINITY},
      'detail' => {'type'=>'string', 'path'=>'DetectedIssue.detail', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'DetectedIssue.date', 'min'=>0, 'max'=>1},
      'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'DetectedIssue.author', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'DetectedIssue.identifier', 'min'=>0, 'max'=>1},
      'reference' => {'type'=>'uri', 'path'=>'DetectedIssue.reference', 'min'=>0, 'max'=>1},
      'mitigation' => {'type'=>'DetectedIssue::Mitigation', 'path'=>'DetectedIssue.mitigation', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Mitigation < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Mitigation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Mitigation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Mitigation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'action' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActCode'=>['_ActDetectedIssueManagementCode', '_ActAdministrativeDetectedIssueManagementCode', '_AuthorizationIssueManagementCode', 'EMAUTH', '21', '1', '19', '2', '22', '23', '3', '4', '5', '6', '7', '14', '15', '16', '17', '18', '20', '8', '10', '11', '12', '13', '9']}, 'type'=>'CodeableConcept', 'path'=>'Mitigation.action', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/detectedissue-mitigation-action'}},
        'date' => {'type'=>'dateTime', 'path'=>'Mitigation.date', 'min'=>0, 'max'=>1},
        'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Mitigation.author', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :action            # 1-1 CodeableConcept
      attr_accessor :date              # 0-1 dateTime
      attr_accessor :author            # 0-1 Reference(Practitioner)
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :patient           # 0-1 Reference(Patient)
    attr_accessor :category          # 0-1 CodeableConcept
    attr_accessor :severity          # 0-1 code
    attr_accessor :implicated        # 0-* [ Reference(Resource) ]
    attr_accessor :detail            # 0-1 string
    attr_accessor :date              # 0-1 dateTime
    attr_accessor :author            # 0-1 Reference(Practitioner|Device)
    attr_accessor :identifier        # 0-1 Identifier
    attr_accessor :reference         # 0-1 uri
    attr_accessor :mitigation        # 0-* [ DetectedIssue::Mitigation ]

    def resourceType
      'DetectedIssue'
    end
  end
end