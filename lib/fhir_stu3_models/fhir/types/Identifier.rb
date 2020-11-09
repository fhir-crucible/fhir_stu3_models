module FHIR
  module STU3
    class Identifier < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      SEARCH_PARAMS = 
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Identifier.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Identifier.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'use' => {'valid_codes'=>{'http://hl7.org/fhir/identifier-use'=>['usual', 'official', 'temp', 'secondary']}, 'type'=>'code', 'path'=>'Identifier.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/identifier-use'}},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/v2/0203'=>['DL', 'PPN', 'BRN', 'MR', 'MCN', 'EN', 'TAX', 'NIIP', 'PRN', 'MD', 'DR'], 'http://hl7.org/fhir/identifier-type'=>['UDI', 'SNO', 'SB', 'PLAC', 'FILL']}, 'type'=>'CodeableConcept', 'path'=>'Identifier.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/identifier-type'}},
        'system' => {'type'=>'uri', 'path'=>'Identifier.system', 'min'=>0, 'max'=>1},
        'value' => {'type'=>'string', 'path'=>'Identifier.value', 'min'=>0, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'Identifier.period', 'min'=>0, 'max'=>1},
        'assigner' => {'type'=>'Reference', 'path'=>'Identifier.assigner', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id        # 0-1 id
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :use       # 0-1 code
      attr_accessor :type      # 0-1 CodeableConcept
      attr_accessor :system    # 0-1 uri
      attr_accessor :value     # 0-1 string
      attr_accessor :period    # 0-1 Period
      attr_accessor :assigner  # 0-1 Reference()
    end
  end
end