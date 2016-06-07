module FHIR
  class Reference < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = []
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