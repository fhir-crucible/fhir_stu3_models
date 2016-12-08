module FHIR
  class MessageHeader < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = []
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'MessageHeader.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'MessageHeader.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'MessageHeader.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'MessageHeader.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'MessageHeader.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'MessageHeader.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'MessageHeader.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'MessageHeader.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'timestamp' => {'type'=>'instant', 'path'=>'MessageHeader.timestamp', 'min'=>1, 'max'=>1},
      'event' => {'valid_codes'=>{'http://hl7.org/fhir/message-events'=>['CodeSystem-expand', 'MedicationAdministration-Complete', 'MedicationAdministration-Nullification', 'MedicationAdministration-Recording', 'MedicationAdministration-Update', 'admin-notify', 'communication-request', 'diagnosticreport-provide', 'observation-provide', 'patient-link', 'patient-unlink', 'valueset-expand', 'CodeSystem-expand', 'MedicationAdministration-Complete', 'MedicationAdministration-Nullification', 'MedicationAdministration-Recording', 'MedicationAdministration-Update', 'admin-notify', 'communication-request', 'diagnosticreport-provide', 'observation-provide', 'patient-link', 'patient-unlink', 'valueset-expand']}, 'type'=>'Coding', 'path'=>'MessageHeader.event', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/message-events'}},
      'response' => {'type'=>'MessageHeader::Response', 'path'=>'MessageHeader.response', 'min'=>0, 'max'=>1},
      'source' => {'type'=>'MessageHeader::Source', 'path'=>'MessageHeader.source', 'min'=>1, 'max'=>1},
      'destination' => {'type'=>'MessageHeader::Destination', 'path'=>'MessageHeader.destination', 'min'=>0, 'max'=>Float::INFINITY},
      'enterer' => {'type'=>'Reference', 'path'=>'MessageHeader.enterer', 'min'=>0, 'max'=>1},
      'author' => {'type'=>'Reference', 'path'=>'MessageHeader.author', 'min'=>0, 'max'=>1},
      'receiver' => {'type'=>'Reference', 'path'=>'MessageHeader.receiver', 'min'=>0, 'max'=>1},
      'responsible' => {'type'=>'Reference', 'path'=>'MessageHeader.responsible', 'min'=>0, 'max'=>1},
      'reason' => {'valid_codes'=>{'http://hl7.org/fhir/message-reasons-encounter'=>['admit', 'discharge', 'absent', 'return', 'moved', 'edit', 'admit', 'discharge', 'absent', 'return', 'moved', 'edit']}, 'type'=>'CodeableConcept', 'path'=>'MessageHeader.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/message-reason-encounter'}},
      'data' => {'type'=>'Reference', 'path'=>'MessageHeader.data', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Response < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Response.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Response.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Response.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'id', 'path'=>'Response.identifier', 'min'=>1, 'max'=>1},
        'code' => {'valid_codes'=>{'http://hl7.org/fhir/response-code'=>['ok', 'transient-error', 'fatal-error', 'ok', 'transient-error', 'fatal-error']}, 'type'=>'code', 'path'=>'Response.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/response-code'}},
        'details' => {'type'=>'Reference', 'path'=>'Response.details', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 1-1 id
      attr_accessor :code              # 1-1 code
      attr_accessor :details           # 0-1 Reference()
    end

    class Source < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Source.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Source.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Source.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Source.name', 'min'=>0, 'max'=>1},
        'software' => {'type'=>'string', 'path'=>'Source.software', 'min'=>0, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'Source.version', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ContactPoint', 'path'=>'Source.contact', 'min'=>0, 'max'=>1},
        'endpoint' => {'type'=>'uri', 'path'=>'Source.endpoint', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 0-1 string
      attr_accessor :software          # 0-1 string
      attr_accessor :version           # 0-1 string
      attr_accessor :contact           # 0-1 ContactPoint
      attr_accessor :endpoint          # 1-1 uri
    end

    class Destination < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Destination.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Destination.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Destination.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Destination.name', 'min'=>0, 'max'=>1},
        'target' => {'type'=>'Reference', 'path'=>'Destination.target', 'min'=>0, 'max'=>1},
        'endpoint' => {'type'=>'uri', 'path'=>'Destination.endpoint', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 0-1 string
      attr_accessor :target            # 0-1 Reference()
      attr_accessor :endpoint          # 1-1 uri
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :timestamp         # 1-1 instant
    attr_accessor :event             # 1-1 Coding
    attr_accessor :response          # 0-1 MessageHeader::Response
    attr_accessor :source            # 1-1 MessageHeader::Source
    attr_accessor :destination       # 0-* [ MessageHeader::Destination ]
    attr_accessor :enterer           # 0-1 Reference()
    attr_accessor :author            # 0-1 Reference()
    attr_accessor :receiver          # 0-1 Reference()
    attr_accessor :responsible       # 0-1 Reference()
    attr_accessor :reason            # 0-1 CodeableConcept
    attr_accessor :data              # 0-* [ Reference() ]

    def resourceType
      'MessageHeader'
    end
  end
end