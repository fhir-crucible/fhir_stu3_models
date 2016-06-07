module FHIR
  class ImagingExcerpt < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["author", "authoring-time", "identifier", "patient", "selected-study", "title"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ImagingExcerpt.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ImagingExcerpt.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ImagingExcerpt.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ImagingExcerpt.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'ImagingExcerpt.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ImagingExcerpt.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ImagingExcerpt.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ImagingExcerpt.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'uid' => {'type'=>'oid', 'path'=>'ImagingExcerpt.uid', 'min'=>1, 'max'=>1},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'ImagingExcerpt.patient', 'min'=>1, 'max'=>1},
      'authoringTime' => {'type'=>'dateTime', 'path'=>'ImagingExcerpt.authoringTime', 'min'=>0, 'max'=>1},
      'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'ImagingExcerpt.author', 'min'=>0, 'max'=>1},
      'title' => {'valid_codes'=>{'http://nema.org/dicom/dicm'=>['113000', '113001', '113002', '113003', '113004', '113005', '113006', '113007', '113008', '113009', '113010', '113013', '113018', '113020', '113021', '113030', '113031', '113032', '113033', '113034', '113035', '113036', '113037', '113038', '113039']}, 'type'=>'CodeableConcept', 'path'=>'ImagingExcerpt.title', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/kos-title'}},
      'description' => {'type'=>'string', 'path'=>'ImagingExcerpt.description', 'min'=>0, 'max'=>1},
      'study' => {'type'=>'ImagingExcerpt::Study', 'path'=>'ImagingExcerpt.study', 'min'=>1, 'max'=>Float::INFINITY}
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
        'imagingStudy' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ImagingStudy'], 'type'=>'Reference', 'path'=>'Study.imagingStudy', 'min'=>0, 'max'=>1},
        'dicom' => {'type'=>'ImagingExcerpt::Study::Dicom', 'path'=>'Study.dicom', 'min'=>0, 'max'=>Float::INFINITY},
        'viewable' => {'type'=>'ImagingExcerpt::Study::Viewable', 'path'=>'Study.viewable', 'min'=>0, 'max'=>Float::INFINITY},
        'series' => {'type'=>'ImagingExcerpt::Study::Series', 'path'=>'Study.series', 'min'=>1, 'max'=>Float::INFINITY}
      }

      class Dicom < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Dicom.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Dicom.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Dicom.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/dWebType'=>['WADO-RS', 'WADO-URI', 'IID', 'WADO-WS']}, 'type'=>'code', 'path'=>'Dicom.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/dWebType'}},
          'url' => {'type'=>'uri', 'path'=>'Dicom.url', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 code
        attr_accessor :url               # 1-1 uri
      end

      class Viewable < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Viewable.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Viewable.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Viewable.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'contentType' => {'type'=>'code', 'path'=>'Viewable.contentType', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://www.rfc-editor.org/bcp/bcp13.txt'}},
          'height' => {'type'=>'positiveInt', 'path'=>'Viewable.height', 'min'=>0, 'max'=>1},
          'width' => {'type'=>'positiveInt', 'path'=>'Viewable.width', 'min'=>0, 'max'=>1},
          'frames' => {'type'=>'positiveInt', 'path'=>'Viewable.frames', 'min'=>0, 'max'=>1},
          'duration' => {'type'=>'unsignedInt', 'path'=>'Viewable.duration', 'min'=>0, 'max'=>1},
          'size' => {'type'=>'unsignedInt', 'path'=>'Viewable.size', 'min'=>0, 'max'=>1},
          'title' => {'type'=>'string', 'path'=>'Viewable.title', 'min'=>0, 'max'=>1},
          'url' => {'type'=>'uri', 'path'=>'Viewable.url', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :contentType       # 1-1 code
        attr_accessor :height            # 0-1 positiveInt
        attr_accessor :width             # 0-1 positiveInt
        attr_accessor :frames            # 0-1 positiveInt
        attr_accessor :duration          # 0-1 unsignedInt
        attr_accessor :size              # 0-1 unsignedInt
        attr_accessor :title             # 0-1 string
        attr_accessor :url               # 1-1 uri
      end

      class Series < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Series.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Series.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Series.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'uid' => {'type'=>'oid', 'path'=>'Series.uid', 'min'=>1, 'max'=>1},
          'dicom' => {'type'=>'ImagingExcerpt::Study::Series::Dicom', 'path'=>'Series.dicom', 'min'=>0, 'max'=>Float::INFINITY},
          'instance' => {'type'=>'ImagingExcerpt::Study::Series::Instance', 'path'=>'Series.instance', 'min'=>1, 'max'=>Float::INFINITY}
        }

        class Dicom < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Dicom.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Dicom.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Dicom.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'type' => {'valid_codes'=>{'http://hl7.org/fhir/dWebType'=>['WADO-RS', 'WADO-URI', 'IID', 'WADO-WS']}, 'type'=>'code', 'path'=>'Dicom.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/dWebType'}},
            'url' => {'type'=>'uri', 'path'=>'Dicom.url', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :type              # 1-1 code
          attr_accessor :url               # 1-1 uri
        end

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
            'dicom' => {'type'=>'ImagingExcerpt::Study::Series::Instance::Dicom', 'path'=>'Instance.dicom', 'min'=>0, 'max'=>Float::INFINITY},
            'frameNumbers' => {'type'=>'unsignedInt', 'path'=>'Instance.frameNumbers', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class Dicom < FHIR::Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'id', 'path'=>'Dicom.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Dicom.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Dicom.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'type' => {'valid_codes'=>{'http://hl7.org/fhir/dWebType'=>['WADO-RS', 'WADO-URI', 'IID', 'WADO-WS']}, 'type'=>'code', 'path'=>'Dicom.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/dWebType'}},
              'url' => {'type'=>'uri', 'path'=>'Dicom.url', 'min'=>1, 'max'=>1}
            }

            attr_accessor :id                # 0-1 id
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :type              # 1-1 code
            attr_accessor :url               # 1-1 uri
          end

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :sopClass          # 1-1 oid
          attr_accessor :uid               # 1-1 oid
          attr_accessor :dicom             # 0-* [ ImagingExcerpt::Study::Series::Instance::Dicom ]
          attr_accessor :frameNumbers      # 0-* [ unsignedInt ]
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :uid               # 1-1 oid
        attr_accessor :dicom             # 0-* [ ImagingExcerpt::Study::Series::Dicom ]
        attr_accessor :instance          # 1-* [ ImagingExcerpt::Study::Series::Instance ]
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :uid               # 1-1 oid
      attr_accessor :imagingStudy      # 0-1 Reference(ImagingStudy)
      attr_accessor :dicom             # 0-* [ ImagingExcerpt::Study::Dicom ]
      attr_accessor :viewable          # 0-* [ ImagingExcerpt::Study::Viewable ]
      attr_accessor :series            # 1-* [ ImagingExcerpt::Study::Series ]
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
    attr_accessor :study             # 1-* [ ImagingExcerpt::Study ]

    def resourceType
      'ImagingExcerpt'
    end
  end
end