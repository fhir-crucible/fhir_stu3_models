module FHIR
  module STU3
    class BackboneElement < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      SEARCH_PARAMS = 
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'BackboneElement.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'BackboneElement.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'BackboneElement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
    end
  end
end