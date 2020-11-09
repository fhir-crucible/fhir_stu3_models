module FHIR
  module STU3
    class Reference < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      SEARCH_PARAMS = ['authenticator', 'author', 'class', 'created', 'custodian', 'description', 'encounter', 'event', 'facility', 'format', 'identifier', 'indexed', 'language', 'location', 'patient', 'period', 'related-id', 'related-ref', 'relatesto', 'relation', 'securitylabel', 'setting', 'status', 'subject', 'type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Reference.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Reference.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'reference' => {'type'=>'string', 'path'=>'Reference.reference', 'min'=>0, 'max'=>1},
        'display' => {'type'=>'string', 'path'=>'Reference.display', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id        # 0-1 id
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :reference # 0-1 string
      attr_accessor :display   # 0-1 string
    end
  end
end