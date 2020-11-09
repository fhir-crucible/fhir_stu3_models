module FHIR
  module STU3
    class Period < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      SEARCH_PARAMS = 
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Period.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Period.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'start' => {'type'=>'dateTime', 'path'=>'Period.start', 'min'=>0, 'max'=>1},
        'end' => {'type'=>'dateTime', 'path'=>'Period.end', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id        # 0-1 id
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :start     # 0-1 dateTime
      attr_accessor :end       # 0-1 dateTime
    end
  end
end