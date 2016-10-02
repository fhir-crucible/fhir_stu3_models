module FHIR
  class DiagnosticReport < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'effective' => ['dateTime', 'Period']
    }
    SEARCH_PARAMS = ["category", "code", "date", "diagnosis", "encounter", "identifier", "image", "issued", "patient", "performer", "request", "result", "specimen", "status", "subject"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'DiagnosticReport.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'DiagnosticReport.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'DiagnosticReport.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'DiagnosticReport.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'DiagnosticReport.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'DiagnosticReport.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'DiagnosticReport.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'DiagnosticReport.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'DiagnosticReport.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/diagnostic-report-status'=>['registered', 'partial', 'final', 'corrected', 'appended', 'cancelled', 'entered-in-error', 'registered', 'partial', 'final', 'corrected', 'appended', 'cancelled', 'entered-in-error']}, 'type'=>'code', 'path'=>'DiagnosticReport.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/diagnostic-report-status'}},
      'category' => {'valid_codes'=>{'http://hl7.org/fhir/v2/0074'=>['AU', 'BG', 'BLB', 'CG', 'CH', 'CP', 'CT', 'CTH', 'CUS', 'EC', 'EN', 'GE', 'HM', 'ICU', 'IMM', 'LAB', 'MB', 'MCB', 'MYC', 'NMR', 'NMS', 'NRS', 'OSL', 'OT', 'OTH', 'OUS', 'PF', 'PHR', 'PHY', 'PT', 'RAD', 'RC', 'RT', 'RUS', 'RX', 'SP', 'SR', 'TX', 'VR', 'VUS', 'XRC']}, 'type'=>'CodeableConcept', 'path'=>'DiagnosticReport.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/diagnostic-service-sections'}},
      'code' => {'valid_codes'=>{'http://loinc.org'=>[]}, 'type'=>'CodeableConcept', 'path'=>'DiagnosticReport.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/report-codes'}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'DiagnosticReport.subject', 'min'=>1, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'DiagnosticReport.encounter', 'min'=>0, 'max'=>1},
      'effectiveDateTime' => {'type'=>'dateTime', 'path'=>'DiagnosticReport.effective[x]', 'min'=>1, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'DiagnosticReport.effective[x]', 'min'=>1, 'max'=>1},
      'issued' => {'type'=>'instant', 'path'=>'DiagnosticReport.issued', 'min'=>1, 'max'=>1},
      'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'DiagnosticReport.performer', 'min'=>1, 'max'=>Float::INFINITY},
      'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DiagnosticRequest', 'http://hl7.org/fhir/StructureDefinition/ProcedureRequest', 'http://hl7.org/fhir/StructureDefinition/ReferralRequest'], 'type'=>'Reference', 'path'=>'DiagnosticReport.request', 'min'=>0, 'max'=>Float::INFINITY},
      'specimen' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Specimen'], 'type'=>'Reference', 'path'=>'DiagnosticReport.specimen', 'min'=>0, 'max'=>Float::INFINITY},
      'result' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'DiagnosticReport.result', 'min'=>0, 'max'=>Float::INFINITY},
      'imagingStudy' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ImagingStudy', 'http://hl7.org/fhir/StructureDefinition/ImagingManifest'], 'type'=>'Reference', 'path'=>'DiagnosticReport.imagingStudy', 'min'=>0, 'max'=>Float::INFINITY},
      'image' => {'type'=>'DiagnosticReport::Image', 'path'=>'DiagnosticReport.image', 'min'=>0, 'max'=>Float::INFINITY},
      'conclusion' => {'type'=>'string', 'path'=>'DiagnosticReport.conclusion', 'min'=>0, 'max'=>1},
      'codedDiagnosis' => {'valid_codes'=>{'http://snomed.info/sct'=>[]}, 'type'=>'CodeableConcept', 'path'=>'DiagnosticReport.codedDiagnosis', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/clinical-findings'}},
      'presentedForm' => {'type'=>'Attachment', 'path'=>'DiagnosticReport.presentedForm', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Image < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Image.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Image.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Image.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'comment' => {'type'=>'string', 'path'=>'Image.comment', 'min'=>0, 'max'=>1},
        'link' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Media'], 'type'=>'Reference', 'path'=>'Image.link', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :comment           # 0-1 string
      attr_accessor :link              # 1-1 Reference(Media)
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
    attr_accessor :status            # 1-1 code
    attr_accessor :category          # 0-1 CodeableConcept
    attr_accessor :code              # 1-1 CodeableConcept
    attr_accessor :subject           # 1-1 Reference(Patient|Group|Device|Location)
    attr_accessor :encounter         # 0-1 Reference(Encounter)
    attr_accessor :effectiveDateTime # 1-1 dateTime
    attr_accessor :effectivePeriod   # 1-1 Period
    attr_accessor :issued            # 1-1 instant
    attr_accessor :performer         # 1-* [ Reference(Practitioner|Organization) ]
    attr_accessor :request           # 0-* [ Reference(DiagnosticRequest|ProcedureRequest|ReferralRequest) ]
    attr_accessor :specimen          # 0-* [ Reference(Specimen) ]
    attr_accessor :result            # 0-* [ Reference(Observation) ]
    attr_accessor :imagingStudy      # 0-* [ Reference(ImagingStudy|ImagingManifest) ]
    attr_accessor :image             # 0-* [ DiagnosticReport::Image ]
    attr_accessor :conclusion        # 0-1 string
    attr_accessor :codedDiagnosis    # 0-* [ CodeableConcept ]
    attr_accessor :presentedForm     # 0-* [ Attachment ]

    def resourceType
      'DiagnosticReport'
    end
  end
end