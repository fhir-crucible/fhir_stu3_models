module FHIR
  class ServiceDefinition < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['composed-of', 'date', 'depends-on', 'derived-from', 'description', 'effective', 'identifier', 'jurisdiction', 'name', 'predecessor', 'publisher', 'status', 'successor', 'title', 'topic', 'url', 'version']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ServiceDefinition.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ServiceDefinition.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ServiceDefinition.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'ServiceDefinition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'ServiceDefinition.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ServiceDefinition.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ServiceDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ServiceDefinition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'ServiceDefinition.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'ServiceDefinition.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'ServiceDefinition.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'ServiceDefinition.name', 'min'=>0, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'ServiceDefinition.title', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown', 'draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'ServiceDefinition.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'ServiceDefinition.experimental', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'ServiceDefinition.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'ServiceDefinition.publisher', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'markdown', 'path'=>'ServiceDefinition.description', 'min'=>0, 'max'=>1},
      'purpose' => {'type'=>'markdown', 'path'=>'ServiceDefinition.purpose', 'min'=>0, 'max'=>1},
      'usage' => {'type'=>'string', 'path'=>'ServiceDefinition.usage', 'min'=>0, 'max'=>1},
      'approvalDate' => {'type'=>'date', 'path'=>'ServiceDefinition.approvalDate', 'min'=>0, 'max'=>1},
      'lastReviewDate' => {'type'=>'date', 'path'=>'ServiceDefinition.lastReviewDate', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'ServiceDefinition.effectivePeriod', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'UsageContext', 'path'=>'ServiceDefinition.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AN', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BU', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CS', 'CT', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DD', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DY', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FQ', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'HV', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'JT', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MI', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NH', 'NI', 'NL', 'NO', 'NP', 'NQ', 'NR', 'NT', 'NU', 'NZ', 'OM', 'PA', 'PC', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PU', 'PW', 'PY', 'PZ', 'QA', 'RE', 'RH', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SU', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TP', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VD', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WK', 'WS', 'YD', 'YE', 'YT', 'YU', 'ZA', 'ZM', 'ZR', 'ZW'], 'http://unstats.un.org/unsd/methods/m49/m49.htm'=>['001', '002', '014', '017', '015', '018', '011', '019', '419', '029', '013', '005', '021', '142', '143', '030', '034', '035', '145', '150', '151', '154', '039', '155', '009', '053', '054', '057', '061'], 'https://www.usps.com/'=>['AK', 'AL', 'AR', 'AS', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'FM', 'GA', 'GU', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MH', 'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'PW', 'RI', 'SC', 'SD', 'TN', 'TX', 'UM', 'UT', 'VA', 'VI', 'VT', 'WA', 'WI', 'WV', 'WY'], nil=>[]}, 'type'=>'CodeableConcept', 'path'=>'ServiceDefinition.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
      'topic' => {'valid_codes'=>{'http://hl7.org/fhir/definition-topic'=>['treatment', 'education', 'assessment', 'treatment', 'education', 'assessment']}, 'type'=>'CodeableConcept', 'path'=>'ServiceDefinition.topic', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/definition-topic'}},
      'contributor' => {'type'=>'Contributor', 'path'=>'ServiceDefinition.contributor', 'min'=>0, 'max'=>Float::INFINITY},
      'contact' => {'type'=>'ContactDetail', 'path'=>'ServiceDefinition.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'copyright' => {'type'=>'markdown', 'path'=>'ServiceDefinition.copyright', 'min'=>0, 'max'=>1},
      'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'ServiceDefinition.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
      'trigger' => {'type'=>'TriggerDefinition', 'path'=>'ServiceDefinition.trigger', 'min'=>0, 'max'=>Float::INFINITY},
      'dataRequirement' => {'type'=>'DataRequirement', 'path'=>'ServiceDefinition.dataRequirement', 'min'=>0, 'max'=>Float::INFINITY},
      'operationDefinition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/OperationDefinition'], 'type'=>'Reference', 'path'=>'ServiceDefinition.operationDefinition', 'min'=>0, 'max'=>1}
    }

    attr_accessor :id                  # 0-1 id
    attr_accessor :meta                # 0-1 Meta
    attr_accessor :implicitRules       # 0-1 uri
    attr_accessor :language            # 0-1 code
    attr_accessor :text                # 0-1 Narrative
    attr_accessor :contained           # 0-* [ Resource ]
    attr_accessor :extension           # 0-* [ Extension ]
    attr_accessor :modifierExtension   # 0-* [ Extension ]
    attr_accessor :url                 # 0-1 uri
    attr_accessor :identifier          # 0-* [ Identifier ]
    attr_accessor :version             # 0-1 string
    attr_accessor :name                # 0-1 string
    attr_accessor :title               # 0-1 string
    attr_accessor :status              # 1-1 code
    attr_accessor :experimental        # 0-1 boolean
    attr_accessor :date                # 0-1 dateTime
    attr_accessor :publisher           # 0-1 string
    attr_accessor :description         # 0-1 markdown
    attr_accessor :purpose             # 0-1 markdown
    attr_accessor :usage               # 0-1 string
    attr_accessor :approvalDate        # 0-1 date
    attr_accessor :lastReviewDate      # 0-1 date
    attr_accessor :effectivePeriod     # 0-1 Period
    attr_accessor :useContext          # 0-* [ UsageContext ]
    attr_accessor :jurisdiction        # 0-* [ CodeableConcept ]
    attr_accessor :topic               # 0-* [ CodeableConcept ]
    attr_accessor :contributor         # 0-* [ Contributor ]
    attr_accessor :contact             # 0-* [ ContactDetail ]
    attr_accessor :copyright           # 0-1 markdown
    attr_accessor :relatedArtifact     # 0-* [ RelatedArtifact ]
    attr_accessor :trigger             # 0-* [ TriggerDefinition ]
    attr_accessor :dataRequirement     # 0-* [ DataRequirement ]
    attr_accessor :operationDefinition # 0-1 Reference(OperationDefinition)

    def resourceType
      'ServiceDefinition'
    end
  end
end