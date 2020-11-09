module FHIR
  module STU3
    class Coding < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      SEARCH_PARAMS = 
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Coding.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Coding.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'system' => {'type'=>'uri', 'path'=>'Coding.system', 'min'=>0, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'Coding.version', 'min'=>0, 'max'=>1},
        'code' => {'type'=>'code', 'path'=>'Coding.code', 'min'=>0, 'max'=>1},
        'display' => {'type'=>'string', 'path'=>'Coding.display', 'min'=>0, 'max'=>1},
        'userSelected' => {'type'=>'boolean', 'path'=>'Coding.userSelected', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id           # 0-1 id
      attr_accessor :extension    # 0-* [ Extension ]
      attr_accessor :system       # 0-1 uri
      attr_accessor :version      # 0-1 string
      attr_accessor :code         # 0-1 code
      attr_accessor :display      # 0-1 string
      attr_accessor :userSelected # 0-1 boolean
    end
  end
end