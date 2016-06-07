module FHIR
  class ModuleMetadata < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = []
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ModuleMetadata.id', 'min'=>0, 'max'=>1},
      'extension' => {'type'=>'Extension', 'path'=>'ModuleMetadata.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'ModuleMetadata.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'ModuleMetadata.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'ModuleMetadata.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'ModuleMetadata.name', 'min'=>0, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'ModuleMetadata.title', 'min'=>0, 'max'=>1},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/module-metadata-type'=>['module', 'library', 'decision-support-rule', 'documentation-template', 'order-set']}, 'type'=>'code', 'path'=>'ModuleMetadata.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/module-metadata-type'}},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/module-metadata-status'=>['draft', 'active', 'inactive']}, 'type'=>'code', 'path'=>'ModuleMetadata.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/module-metadata-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'ModuleMetadata.experimental', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'ModuleMetadata.description', 'min'=>0, 'max'=>1},
      'purpose' => {'type'=>'string', 'path'=>'ModuleMetadata.purpose', 'min'=>0, 'max'=>1},
      'usage' => {'type'=>'string', 'path'=>'ModuleMetadata.usage', 'min'=>0, 'max'=>1},
      'publicationDate' => {'type'=>'date', 'path'=>'ModuleMetadata.publicationDate', 'min'=>0, 'max'=>1},
      'lastReviewDate' => {'type'=>'date', 'path'=>'ModuleMetadata.lastReviewDate', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'ModuleMetadata.effectivePeriod', 'min'=>0, 'max'=>1},
      'coverage' => {'type'=>'ModuleMetadata::Coverage', 'path'=>'ModuleMetadata.coverage', 'min'=>0, 'max'=>Float::INFINITY},
      'topic' => {'type'=>'CodeableConcept', 'path'=>'ModuleMetadata.topic', 'min'=>0, 'max'=>Float::INFINITY},
      'contributor' => {'type'=>'ModuleMetadata::Contributor', 'path'=>'ModuleMetadata.contributor', 'min'=>0, 'max'=>Float::INFINITY},
      'publisher' => {'type'=>'string', 'path'=>'ModuleMetadata.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ModuleMetadata::Contact', 'path'=>'ModuleMetadata.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'copyright' => {'type'=>'string', 'path'=>'ModuleMetadata.copyright', 'min'=>0, 'max'=>1},
      'relatedResource' => {'type'=>'ModuleMetadata::Relatedresource', 'path'=>'ModuleMetadata.relatedResource', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Coverage < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Coverage.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Coverage.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'focus' => {'valid_codes'=>{'http://hl7.org/fhir/module-metadata-focus-type'=>['patient-gender', 'patient-age-group', 'clinical-focus', 'target-user', 'workflow-setting', 'workflow-task', 'clinical-venue', 'jurisdiction']}, 'type'=>'Coding', 'path'=>'Coverage.focus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/module-metadata-focus-type'}},
        'value' => {'type'=>'CodeableConcept', 'path'=>'Coverage.value', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id        # 0-1 id
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :focus     # 1-1 Coding
      attr_accessor :value     # 1-1 CodeableConcept
    end

    class Contributor < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Contributor.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Contributor.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/module-metadata-contributor'=>['author', 'editor', 'reviewer', 'endorser']}, 'type'=>'code', 'path'=>'Contributor.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/module-metadata-contributor'}},
        'name' => {'type'=>'string', 'path'=>'Contributor.name', 'min'=>1, 'max'=>1},
        'contact' => {'type'=>'ModuleMetadata::Contributor::Contact', 'path'=>'Contributor.contact', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Contact < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Contact.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Contact.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'Contact.name', 'min'=>0, 'max'=>1},
          'telecom' => {'type'=>'ContactPoint', 'path'=>'Contact.telecom', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id        # 0-1 id
        attr_accessor :extension # 0-* [ Extension ]
        attr_accessor :name      # 0-1 string
        attr_accessor :telecom   # 0-* [ ContactPoint ]
      end

      attr_accessor :id        # 0-1 id
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :type      # 1-1 code
      attr_accessor :name      # 1-1 string
      attr_accessor :contact   # 0-* [ ModuleMetadata::Contributor::Contact ]
    end

    class Contact < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Contact.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Contact.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Contact.name', 'min'=>0, 'max'=>1},
        'telecom' => {'type'=>'ContactPoint', 'path'=>'Contact.telecom', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id        # 0-1 id
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :name      # 0-1 string
      attr_accessor :telecom   # 0-* [ ContactPoint ]
    end

    class Relatedresource < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Relatedresource.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Relatedresource.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/module-metadata-resource-type'=>['documentation', 'justification', 'citation', 'predecessor', 'successor', 'derived-from']}, 'type'=>'code', 'path'=>'Relatedresource.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/module-metadata-resource-type'}},
        'document' => {'type'=>'Attachment', 'path'=>'Relatedresource.document', 'min'=>0, 'max'=>1},
        'resource' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Relatedresource.resource', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id        # 0-1 id
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :type      # 1-1 code
      attr_accessor :document  # 0-1 Attachment
      attr_accessor :resource  # 0-1 Reference(Resource)
    end

    attr_accessor :id              # 0-1 id
    attr_accessor :extension       # 0-* [ Extension ]
    attr_accessor :url             # 0-1 uri
    attr_accessor :identifier      # 0-* [ Identifier ]
    attr_accessor :version         # 0-1 string
    attr_accessor :name            # 0-1 string
    attr_accessor :title           # 0-1 string
    attr_accessor :type            # 1-1 code
    attr_accessor :status          # 1-1 code
    attr_accessor :experimental    # 0-1 boolean
    attr_accessor :description     # 0-1 string
    attr_accessor :purpose         # 0-1 string
    attr_accessor :usage           # 0-1 string
    attr_accessor :publicationDate # 0-1 date
    attr_accessor :lastReviewDate  # 0-1 date
    attr_accessor :effectivePeriod # 0-1 Period
    attr_accessor :coverage        # 0-* [ ModuleMetadata::Coverage ]
    attr_accessor :topic           # 0-* [ CodeableConcept ]
    attr_accessor :contributor     # 0-* [ ModuleMetadata::Contributor ]
    attr_accessor :publisher       # 0-1 string
    attr_accessor :contact         # 0-* [ ModuleMetadata::Contact ]
    attr_accessor :copyright       # 0-1 string
    attr_accessor :relatedResource # 0-* [ ModuleMetadata::Relatedresource ]
  end
end