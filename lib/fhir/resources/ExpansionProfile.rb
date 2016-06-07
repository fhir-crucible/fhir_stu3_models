module FHIR
  class ExpansionProfile < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["date", "description", "identifier", "name", "publisher", "status", "url", "version"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ExpansionProfile.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ExpansionProfile.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ExpansionProfile.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ExpansionProfile.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'ExpansionProfile.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ExpansionProfile.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ExpansionProfile.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ExpansionProfile.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'ExpansionProfile.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'ExpansionProfile.identifier', 'min'=>0, 'max'=>1},
      'version' => {'type'=>'string', 'path'=>'ExpansionProfile.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'ExpansionProfile.name', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/conformance-resource-status'=>['draft', 'active', 'retired']}, 'type'=>'code', 'path'=>'ExpansionProfile.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conformance-resource-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'ExpansionProfile.experimental', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'ExpansionProfile.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ExpansionProfile::Contact', 'path'=>'ExpansionProfile.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'date' => {'type'=>'dateTime', 'path'=>'ExpansionProfile.date', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'ExpansionProfile.description', 'min'=>0, 'max'=>1},
      'codeSystem' => {'type'=>'ExpansionProfile::Codesystem', 'path'=>'ExpansionProfile.codeSystem', 'min'=>0, 'max'=>1},
      'includeDesignations' => {'type'=>'boolean', 'path'=>'ExpansionProfile.includeDesignations', 'min'=>0, 'max'=>1},
      'designation' => {'type'=>'ExpansionProfile::Designation', 'path'=>'ExpansionProfile.designation', 'min'=>0, 'max'=>1},
      'includeDefinition' => {'type'=>'boolean', 'path'=>'ExpansionProfile.includeDefinition', 'min'=>0, 'max'=>1},
      'includeInactive' => {'type'=>'boolean', 'path'=>'ExpansionProfile.includeInactive', 'min'=>0, 'max'=>1},
      'excludeNested' => {'type'=>'boolean', 'path'=>'ExpansionProfile.excludeNested', 'min'=>0, 'max'=>1},
      'excludeNotForUI' => {'type'=>'boolean', 'path'=>'ExpansionProfile.excludeNotForUI', 'min'=>0, 'max'=>1},
      'excludePostCoordinated' => {'type'=>'boolean', 'path'=>'ExpansionProfile.excludePostCoordinated', 'min'=>0, 'max'=>1},
      'displayLanguage' => {'type'=>'code', 'path'=>'ExpansionProfile.displayLanguage', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'limitedExpansion' => {'type'=>'boolean', 'path'=>'ExpansionProfile.limitedExpansion', 'min'=>0, 'max'=>1}
    }

    class Contact < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Contact.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Contact.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Contact.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Contact.name', 'min'=>0, 'max'=>1},
        'telecom' => {'type'=>'ContactPoint', 'path'=>'Contact.telecom', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 0-1 string
      attr_accessor :telecom           # 0-* [ ContactPoint ]
    end

    class Codesystem < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Codesystem.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Codesystem.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Codesystem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'include' => {'type'=>'ExpansionProfile::Codesystem::Include', 'path'=>'Codesystem.include', 'min'=>0, 'max'=>1},
        'exclude' => {'type'=>'ExpansionProfile::Codesystem::Exclude', 'path'=>'Codesystem.exclude', 'min'=>0, 'max'=>1}
      }

      class Include < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Include.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Include.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Include.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'codeSystem' => {'type'=>'ExpansionProfile::Codesystem::Include::Codesystem', 'path'=>'Include.codeSystem', 'min'=>1, 'max'=>Float::INFINITY}
        }

        class Codesystem < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Codesystem.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Codesystem.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Codesystem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'system' => {'type'=>'uri', 'path'=>'Codesystem.system', 'min'=>1, 'max'=>1},
            'version' => {'type'=>'string', 'path'=>'Codesystem.version', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :system            # 1-1 uri
          attr_accessor :version           # 0-1 string
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :codeSystem        # 1-* [ ExpansionProfile::Codesystem::Include::Codesystem ]
      end

      class Exclude < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Exclude.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Exclude.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Exclude.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'codeSystem' => {'type'=>'ExpansionProfile::Codesystem::Exclude::Codesystem', 'path'=>'Exclude.codeSystem', 'min'=>1, 'max'=>Float::INFINITY}
        }

        class Codesystem < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Codesystem.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Codesystem.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Codesystem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'system' => {'type'=>'uri', 'path'=>'Codesystem.system', 'min'=>1, 'max'=>1},
            'version' => {'type'=>'string', 'path'=>'Codesystem.version', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :system            # 1-1 uri
          attr_accessor :version           # 0-1 string
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :codeSystem        # 1-* [ ExpansionProfile::Codesystem::Exclude::Codesystem ]
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :include           # 0-1 ExpansionProfile::Codesystem::Include
      attr_accessor :exclude           # 0-1 ExpansionProfile::Codesystem::Exclude
    end

    class Designation < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Designation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Designation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Designation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'include' => {'type'=>'ExpansionProfile::Designation::Include', 'path'=>'Designation.include', 'min'=>0, 'max'=>1},
        'exclude' => {'type'=>'ExpansionProfile::Designation::Exclude', 'path'=>'Designation.exclude', 'min'=>0, 'max'=>1}
      }

      class Include < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Include.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Include.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Include.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'designation' => {'type'=>'ExpansionProfile::Designation::Include::Designation', 'path'=>'Include.designation', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Designation < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Designation.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Designation.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Designation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'language' => {'type'=>'code', 'path'=>'Designation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
            'use' => {'valid_codes'=>{'http://snomed.info/sct'=>['900000000000003001', '900000000000013009', '900000000000550004']}, 'type'=>'Coding', 'path'=>'Designation.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/designation-use'}}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :language          # 0-1 code
          attr_accessor :use               # 0-1 Coding
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :designation       # 0-* [ ExpansionProfile::Designation::Include::Designation ]
      end

      class Exclude < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Exclude.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Exclude.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Exclude.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'designation' => {'type'=>'ExpansionProfile::Designation::Exclude::Designation', 'path'=>'Exclude.designation', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Designation < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Designation.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Designation.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Designation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'language' => {'type'=>'code', 'path'=>'Designation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
            'use' => {'valid_codes'=>{'http://snomed.info/sct'=>['900000000000003001', '900000000000013009', '900000000000550004']}, 'type'=>'Coding', 'path'=>'Designation.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/designation-use'}}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :language          # 0-1 code
          attr_accessor :use               # 0-1 Coding
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :designation       # 0-* [ ExpansionProfile::Designation::Exclude::Designation ]
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :include           # 0-1 ExpansionProfile::Designation::Include
      attr_accessor :exclude           # 0-1 ExpansionProfile::Designation::Exclude
    end

    attr_accessor :id                     # 0-1 id
    attr_accessor :meta                   # 0-1 Meta
    attr_accessor :implicitRules          # 0-1 uri
    attr_accessor :language               # 0-1 code
    attr_accessor :text                   # 0-1 Narrative
    attr_accessor :contained              # 0-* [ Resource ]
    attr_accessor :extension              # 0-* [ Extension ]
    attr_accessor :modifierExtension      # 0-* [ Extension ]
    attr_accessor :url                    # 0-1 uri
    attr_accessor :identifier             # 0-1 Identifier
    attr_accessor :version                # 0-1 string
    attr_accessor :name                   # 0-1 string
    attr_accessor :status                 # 1-1 code
    attr_accessor :experimental           # 0-1 boolean
    attr_accessor :publisher              # 0-1 string
    attr_accessor :contact                # 0-* [ ExpansionProfile::Contact ]
    attr_accessor :date                   # 0-1 dateTime
    attr_accessor :description            # 0-1 string
    attr_accessor :codeSystem             # 0-1 ExpansionProfile::Codesystem
    attr_accessor :includeDesignations    # 0-1 boolean
    attr_accessor :designation            # 0-1 ExpansionProfile::Designation
    attr_accessor :includeDefinition      # 0-1 boolean
    attr_accessor :includeInactive        # 0-1 boolean
    attr_accessor :excludeNested          # 0-1 boolean
    attr_accessor :excludeNotForUI        # 0-1 boolean
    attr_accessor :excludePostCoordinated # 0-1 boolean
    attr_accessor :displayLanguage        # 0-1 code
    attr_accessor :limitedExpansion       # 0-1 boolean

    def resourceType
      'ExpansionProfile'
    end
  end
end