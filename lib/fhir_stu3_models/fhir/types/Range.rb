module FHIR
  module STU3
    class Range < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      SEARCH_PARAMS = 
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Range.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Range.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'low' => {'type'=>'Quantity', 'path'=>'Range.low', 'min'=>0, 'max'=>1},
        'high' => {'type'=>'Quantity', 'path'=>'Range.high', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id        # 0-1 id
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :low       # 0-1 Quantity
      attr_accessor :high      # 0-1 Quantity
    end
  end
end