module FHIR
  class DataElement < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['code', 'date', 'description', 'identifier', 'jurisdiction', 'name', 'publisher', 'status', 'stringency', 'title', 'url', 'version']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'DataElement.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'DataElement.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'DataElement.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'DataElement.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'DataElement.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'DataElement.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'DataElement.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'DataElement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'DataElement.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'DataElement.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'DataElement.version', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown', 'draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'DataElement.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'DataElement.experimental', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'DataElement.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'DataElement.publisher', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'DataElement.name', 'min'=>0, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'DataElement.title', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactDetail', 'path'=>'DataElement.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'useContext' => {'type'=>'UsageContext', 'path'=>'DataElement.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AN', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BU', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CS', 'CT', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DD', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DY', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FQ', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'HV', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'JT', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MI', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NH', 'NI', 'NL', 'NO', 'NP', 'NQ', 'NR', 'NT', 'NU', 'NZ', 'OM', 'PA', 'PC', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PU', 'PW', 'PY', 'PZ', 'QA', 'RE', 'RH', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SU', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TP', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VD', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WK', 'WS', 'YD', 'YE', 'YT', 'YU', 'ZA', 'ZM', 'ZR', 'ZW'], 'http://unstats.un.org/unsd/methods/m49/m49.htm'=>['001', '002', '014', '017', '015', '018', '011', '019', '419', '029', '013', '005', '021', '142', '143', '030', '034', '035', '145', '150', '151', '154', '039', '155', '009', '053', '054', '057', '061'], 'https://www.usps.com/'=>['AK', 'AL', 'AR', 'AS', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'FM', 'GA', 'GU', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MH', 'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'PW', 'RI', 'SC', 'SD', 'TN', 'TX', 'UM', 'UT', 'VA', 'VI', 'VT', 'WA', 'WI', 'WV', 'WY'], nil=>[]}, 'type'=>'CodeableConcept', 'path'=>'DataElement.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
      'copyright' => {'type'=>'markdown', 'path'=>'DataElement.copyright', 'min'=>0, 'max'=>1},
      'stringency' => {'valid_codes'=>{'http://hl7.org/fhir/dataelement-stringency'=>['comparable', 'fully-specified', 'equivalent', 'convertable', 'scaleable', 'flexible', 'comparable', 'flexible']}, 'type'=>'code', 'path'=>'DataElement.stringency', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/dataelement-stringency'}},
      'mapping' => {'type'=>'DataElement::Mapping', 'path'=>'DataElement.mapping', 'min'=>0, 'max'=>Float::INFINITY},
      'element' => {'type'=>'ElementDefinition', 'path'=>'DataElement.element', 'min'=>1, 'max'=>Float::INFINITY}
    }

    class Mapping < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Mapping.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Mapping.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Mapping.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identity' => {'type'=>'id', 'path'=>'Mapping.identity', 'min'=>1, 'max'=>1},
        'uri' => {'type'=>'uri', 'path'=>'Mapping.uri', 'min'=>0, 'max'=>1},
        'name' => {'type'=>'string', 'path'=>'Mapping.name', 'min'=>0, 'max'=>1},
        'comment' => {'type'=>'string', 'path'=>'Mapping.comment', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identity          # 1-1 id
      attr_accessor :uri               # 0-1 uri
      attr_accessor :name              # 0-1 string
      attr_accessor :comment           # 0-1 string
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :url               # 0-1 uri
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :version           # 0-1 string
    attr_accessor :status            # 1-1 code
    attr_accessor :experimental      # 0-1 boolean
    attr_accessor :date              # 0-1 dateTime
    attr_accessor :publisher         # 0-1 string
    attr_accessor :name              # 0-1 string
    attr_accessor :title             # 0-1 string
    attr_accessor :contact           # 0-* [ ContactDetail ]
    attr_accessor :useContext        # 0-* [ UsageContext ]
    attr_accessor :jurisdiction      # 0-* [ CodeableConcept ]
    attr_accessor :copyright         # 0-1 markdown
    attr_accessor :stringency        # 0-1 code
    attr_accessor :mapping           # 0-* [ DataElement::Mapping ]
    attr_accessor :element           # 1-* [ ElementDefinition ]

    def resourceType
      'DataElement'
    end
  end
end