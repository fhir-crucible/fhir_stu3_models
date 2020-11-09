module FHIR
  module STU3
    class Element < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      SEARCH_PARAMS = ['code', 'context', 'date', 'description', 'identifier', 'name', 'publisher', 'status', 'stringency', 'url', 'version']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Element.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Element.extension', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id        # 0-1 id
      attr_accessor :extension # 0-* [ Extension ]
    end
  end
end