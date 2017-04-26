module FHIR
  class ImagingManifest < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['patient', 'author', 'authoring-time', 'endpoint', 'identifier', 'imaging-study', 'selected-study']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ImagingManifest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ImagingManifest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ImagingManifest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'ImagingManifest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'ImagingManifest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ImagingManifest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ImagingManifest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ImagingManifest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ImagingManifest.identifier', 'min'=>0, 'max'=>1},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'ImagingManifest.patient', 'min'=>1, 'max'=>1},
      'authoringTime' => {'type'=>'dateTime', 'path'=>'ImagingManifest.authoringTime', 'min'=>0, 'max'=>1},
      'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'ImagingManifest.author', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'ImagingManifest.description', 'min'=>0, 'max'=>1},
      'study' => {'type'=>'ImagingManifest::Study', 'path'=>'ImagingManifest.study', 'min'=>1, 'max'=>Float::INFINITY}
    }

    class Study < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Study.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Study.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Study.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'uid' => {'type'=>'oid', 'path'=>'Study.uid', 'min'=>1, 'max'=>1},
        'imagingStudy' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ImagingStudy'], 'type'=>'Reference', 'path'=>'Study.imagingStudy', 'min'=>0, 'max'=>1},
        'endpoint' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'Study.endpoint', 'min'=>0, 'max'=>Float::INFINITY},
        'series' => {'type'=>'ImagingManifest::Study::Series', 'path'=>'Study.series', 'min'=>1, 'max'=>Float::INFINITY}
      }

      class Series < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Series.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Series.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Series.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'uid' => {'type'=>'oid', 'path'=>'Series.uid', 'min'=>1, 'max'=>1},
          'endpoint' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'Series.endpoint', 'min'=>0, 'max'=>Float::INFINITY},
          'instance' => {'type'=>'ImagingManifest::Study::Series::Instance', 'path'=>'Series.instance', 'min'=>1, 'max'=>Float::INFINITY}
        }

        class Instance < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Instance.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Instance.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Instance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'sopClass' => {'type'=>'oid', 'path'=>'Instance.sopClass', 'min'=>1, 'max'=>1},
            'uid' => {'type'=>'oid', 'path'=>'Instance.uid', 'min'=>1, 'max'=>1},
            'frameNumber' => {'type'=>'unsignedInt', 'path'=>'Instance.frameNumber', 'min'=>0, 'max'=>Float::INFINITY}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :sopClass          # 1-1 oid
          attr_accessor :uid               # 1-1 oid
          attr_accessor :frameNumber       # 0-* [ unsignedInt ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :uid               # 1-1 oid
        attr_accessor :endpoint          # 0-* [ Reference(Endpoint) ]
        attr_accessor :instance          # 1-* [ ImagingManifest::Study::Series::Instance ]
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :uid               # 1-1 oid
      attr_accessor :imagingStudy      # 0-1 Reference(ImagingStudy)
      attr_accessor :endpoint          # 0-* [ Reference(Endpoint) ]
      attr_accessor :series            # 1-* [ ImagingManifest::Study::Series ]
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
    attr_accessor :patient           # 1-1 Reference(Patient)
    attr_accessor :authoringTime     # 0-1 dateTime
    attr_accessor :author            # 0-1 Reference(Practitioner|Device|Organization|Patient|RelatedPerson)
    attr_accessor :description       # 0-1 string
    attr_accessor :study             # 1-* [ ImagingManifest::Study ]

    def resourceType
      'ImagingManifest'
    end
  end
end