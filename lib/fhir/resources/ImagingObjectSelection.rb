module FHIR
  class ImagingObjectSelection < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["author", "authoring-time", "identifier", "patient", "selected-study", "title"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ImagingObjectSelection.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ImagingObjectSelection.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ImagingObjectSelection.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ImagingObjectSelection.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'ImagingObjectSelection.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ImagingObjectSelection.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ImagingObjectSelection.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ImagingObjectSelection.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'uid' => {'type'=>'oid', 'path'=>'ImagingObjectSelection.uid', 'min'=>1, 'max'=>1},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'ImagingObjectSelection.patient', 'min'=>1, 'max'=>1},
      'authoringTime' => {'type'=>'dateTime', 'path'=>'ImagingObjectSelection.authoringTime', 'min'=>0, 'max'=>1},
      'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'ImagingObjectSelection.author', 'min'=>0, 'max'=>1},
      'title' => {'valid_codes'=>{'http://nema.org/dicom/dicm'=>['113000', '113001', '113002', '113003', '113004', '113005', '113006', '113007', '113008', '113009', '113010', '113013', '113018', '113020', '113021', '113030', '113031', '113032', '113033', '113034', '113035', '113036', '113037', '113038', '113039']}, 'type'=>'CodeableConcept', 'path'=>'ImagingObjectSelection.title', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/kos-title'}},
      'description' => {'type'=>'string', 'path'=>'ImagingObjectSelection.description', 'min'=>0, 'max'=>1},
      'study' => {'type'=>'ImagingObjectSelection::Study', 'path'=>'ImagingObjectSelection.study', 'min'=>1, 'max'=>Float::INFINITY}
    }

    class Study < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Study.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Study.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Study.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'uid' => {'type'=>'oid', 'path'=>'Study.uid', 'min'=>1, 'max'=>1},
        'url' => {'type'=>'uri', 'path'=>'Study.url', 'min'=>0, 'max'=>1},
        'imagingStudy' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ImagingStudy'], 'type'=>'Reference', 'path'=>'Study.imagingStudy', 'min'=>0, 'max'=>1},
        'series' => {'type'=>'ImagingObjectSelection::Study::Series', 'path'=>'Study.series', 'min'=>1, 'max'=>Float::INFINITY}
      }

      class Series < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Series.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Series.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Series.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'uid' => {'type'=>'oid', 'path'=>'Series.uid', 'min'=>1, 'max'=>1},
          'url' => {'type'=>'uri', 'path'=>'Series.url', 'min'=>0, 'max'=>1},
          'instance' => {'type'=>'ImagingObjectSelection::Study::Series::Instance', 'path'=>'Series.instance', 'min'=>1, 'max'=>Float::INFINITY}
        }

        class Instance < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Instance.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Instance.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Instance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'sopClass' => {'type'=>'oid', 'path'=>'Instance.sopClass', 'min'=>1, 'max'=>1},
            'uid' => {'type'=>'oid', 'path'=>'Instance.uid', 'min'=>1, 'max'=>1},
            'url' => {'type'=>'uri', 'path'=>'Instance.url', 'min'=>1, 'max'=>1},
            'frame' => {'type'=>'ImagingObjectSelection::Study::Series::Instance::Frame', 'path'=>'Instance.frame', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class Frame < FHIR::Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'id', 'path'=>'Frame.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Frame.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Frame.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'number' => {'type'=>'unsignedInt', 'path'=>'Frame.number', 'min'=>1, 'max'=>Float::INFINITY},
              'url' => {'type'=>'uri', 'path'=>'Frame.url', 'min'=>1, 'max'=>1}
            }

            attr_accessor :id                # 0-1 id
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :number            # 1-* [ unsignedInt ]
            attr_accessor :url               # 1-1 uri
          end

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :sopClass          # 1-1 oid
          attr_accessor :uid               # 1-1 oid
          attr_accessor :url               # 1-1 uri
          attr_accessor :frame             # 0-* [ ImagingObjectSelection::Study::Series::Instance::Frame ]
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :uid               # 1-1 oid
        attr_accessor :url               # 0-1 uri
        attr_accessor :instance          # 1-* [ ImagingObjectSelection::Study::Series::Instance ]
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :uid               # 1-1 oid
      attr_accessor :url               # 0-1 uri
      attr_accessor :imagingStudy      # 0-1 Reference(ImagingStudy)
      attr_accessor :series            # 1-* [ ImagingObjectSelection::Study::Series ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :uid               # 1-1 oid
    attr_accessor :patient           # 1-1 Reference(Patient)
    attr_accessor :authoringTime     # 0-1 dateTime
    attr_accessor :author            # 0-1 Reference(Practitioner|Device|Organization|Patient|RelatedPerson)
    attr_accessor :title             # 1-1 CodeableConcept
    attr_accessor :description       # 0-1 string
    attr_accessor :study             # 1-* [ ImagingObjectSelection::Study ]

    def resourceType
      'ImagingObjectSelection'
    end
  end
end