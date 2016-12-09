module FHIR
  class StructureMap < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['date', 'description', 'identifier', 'jurisdiction', 'name', 'publisher', 'status', 'title', 'url', 'version']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'StructureMap.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'StructureMap.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'StructureMap.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'StructureMap.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'StructureMap.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'StructureMap.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'StructureMap.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'StructureMap.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'StructureMap.url', 'min'=>1, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'StructureMap.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'StructureMap.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'StructureMap.name', 'min'=>1, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'StructureMap.title', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'draft', 'active', 'retired']}, 'type'=>'code', 'path'=>'StructureMap.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'StructureMap.experimental', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'StructureMap.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactDetail', 'path'=>'StructureMap.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'date' => {'type'=>'dateTime', 'path'=>'StructureMap.date', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'markdown', 'path'=>'StructureMap.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'UsageContext', 'path'=>'StructureMap.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AN', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BU', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CS', 'CT', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DD', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DY', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FQ', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'HV', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'JT', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MI', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NH', 'NI', 'NL', 'NO', 'NP', 'NQ', 'NR', 'NT', 'NU', 'NZ', 'OM', 'PA', 'PC', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PU', 'PW', 'PY', 'PZ', 'QA', 'RE', 'RH', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SU', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TP', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VD', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WK', 'WS', 'YD', 'YE', 'YT', 'YU', 'ZA', 'ZM', 'ZR', 'ZW'], 'http://unstats.un.org/unsd/methods/m49/m49.htm'=>['004', '008', '012', '016', '020', '024', '028', '031', '032', '036', '040', '044', '048', '050', '051', '052', '056', '060', '064', '068', '070', '072', '076', '084', '090', '092', '096', '100', '104', '108', '112', '116', '120', '124', '132', '136', '140', '144', '148', '152', '156', '170', '174', '175', '178', '180', '184', '188', '191', '192', '196', '203', '204', '208', '212', '214', '218', '222', '226', '231', '232', '233', '234', '238', '242', '246', '248', '250', '254', '258', '262', '266', '268', '270', '275', '276', '288', '292', '296', '300', '304', '308', '312', '316', '320', '324', '328', '332', '336', '340', '344', '348', '352', '356', '360', '364', '368', '372', '376', '380', '384', '388', '392', '398', '400', '404', '408', '410', '414', '417', '418', '422', '426', '428', '430', '434', '438', '440', '442', '446', '450', '454', '458', '462', '466', '470', '474', '478', '480', '484', '492', '496', '498', '499', '500', '504', '508', '512', '516', '520', '524', '528', '531', '533', '534', '535', '540', '548', '554', '558', '562', '566', '570', '574', '578', '580', '583', '584', '585', '586', '591', '598', '600', '604', '608', '612', '616', '620', '624', '626', '630', '634', '638', '642', '643', '646', '652', '654', '659', '660', '662', '663', '666', '670', '674', '678', '680', '682', '686', '688', '690', '694', '702', '703', '704', '705', '706', '710', '716', '724', '728', '729', '732', '740', '744', '748', '752', '756', '760', '762', '764', '768', '772', '776', '780', '784', '788', '792', '795', '796', '798', '800', '804', '807', '818', '826', '830', '831', '832', '833', '834', '840', '850', '854', '858', '860', '862', '876', '882', '887', '894'], 'https://www.usps.com/'=>['AK', 'AL', 'AR', 'AS', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'FM', 'GA', 'GU', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MH', 'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'PW', 'RI', 'SC', 'SD', 'TN', 'TX', 'UM', 'UT', 'VA', 'VI', 'VT', 'WA', 'WI', 'WV', 'WY'], nil=>[]}, 'type'=>'CodeableConcept', 'path'=>'StructureMap.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
      'purpose' => {'type'=>'markdown', 'path'=>'StructureMap.purpose', 'min'=>0, 'max'=>1},
      'copyright' => {'type'=>'markdown', 'path'=>'StructureMap.copyright', 'min'=>0, 'max'=>1},
      'structure' => {'type'=>'StructureMap::Structure', 'path'=>'StructureMap.structure', 'min'=>0, 'max'=>Float::INFINITY},
      'import' => {'type'=>'uri', 'path'=>'StructureMap.import', 'min'=>0, 'max'=>Float::INFINITY},
      'group' => {'type'=>'StructureMap::Group', 'path'=>'StructureMap.group', 'min'=>1, 'max'=>Float::INFINITY}
    }

    class Structure < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Structure.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Structure.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Structure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'Structure.url', 'min'=>1, 'max'=>1},
        'mode' => {'valid_codes'=>{'http://hl7.org/fhir/map-model-mode'=>['source', 'queried', 'target', 'produced', 'source', 'queried', 'target', 'produced']}, 'type'=>'code', 'path'=>'Structure.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-model-mode'}},
        'documentation' => {'type'=>'string', 'path'=>'Structure.documentation', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :url               # 1-1 uri
      attr_accessor :mode              # 1-1 code
      attr_accessor :documentation     # 0-1 string
    end

    class Group < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Group.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Group.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Group.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'id', 'path'=>'Group.name', 'min'=>1, 'max'=>1},
        'extends' => {'type'=>'id', 'path'=>'Group.extends', 'min'=>0, 'max'=>1},
        'documentation' => {'type'=>'string', 'path'=>'Group.documentation', 'min'=>0, 'max'=>1},
        'input' => {'type'=>'StructureMap::Group::Input', 'path'=>'Group.input', 'min'=>1, 'max'=>Float::INFINITY},
        'rule' => {'type'=>'StructureMap::Group::Rule', 'path'=>'Group.rule', 'min'=>1, 'max'=>Float::INFINITY}
      }

      class Input < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Input.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Input.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Input.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'id', 'path'=>'Input.name', 'min'=>1, 'max'=>1},
          'type' => {'type'=>'string', 'path'=>'Input.type', 'min'=>0, 'max'=>1},
          'mode' => {'valid_codes'=>{'http://hl7.org/fhir/map-input-mode'=>['source', 'target', 'source', 'target']}, 'type'=>'code', 'path'=>'Input.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-input-mode'}},
          'documentation' => {'type'=>'string', 'path'=>'Input.documentation', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 1-1 id
        attr_accessor :type              # 0-1 string
        attr_accessor :mode              # 1-1 code
        attr_accessor :documentation     # 0-1 string
      end

      class Rule < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Rule.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Rule.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Rule.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'id', 'path'=>'Rule.name', 'min'=>1, 'max'=>1},
          'source' => {'type'=>'StructureMap::Group::Rule::Source', 'path'=>'Rule.source', 'min'=>1, 'max'=>Float::INFINITY},
          'target' => {'type'=>'StructureMap::Group::Rule::Target', 'path'=>'Rule.target', 'min'=>0, 'max'=>Float::INFINITY},
          'rule' => {'type'=>'StructureMap::Group::Rule', 'path'=>'Rule.rule', 'min'=>0, 'max'=>Float::INFINITY},
          'dependent' => {'type'=>'StructureMap::Group::Rule::Dependent', 'path'=>'Rule.dependent', 'min'=>0, 'max'=>Float::INFINITY},
          'documentation' => {'type'=>'string', 'path'=>'Rule.documentation', 'min'=>0, 'max'=>1}
        }

        class Source < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Source.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Source.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Source.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'required' => {'type'=>'boolean', 'path'=>'Source.required', 'min'=>1, 'max'=>1},
            'context' => {'type'=>'id', 'path'=>'Source.context', 'min'=>1, 'max'=>1},
            'contextType' => {'valid_codes'=>{'http://hl7.org/fhir/map-context-type'=>['type', 'variable', 'type', 'variable']}, 'type'=>'code', 'path'=>'Source.contextType', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-context-type'}},
            'min' => {'type'=>'integer', 'path'=>'Source.min', 'min'=>0, 'max'=>1},
            'max' => {'type'=>'string', 'path'=>'Source.max', 'min'=>0, 'max'=>1},
            'type' => {'type'=>'string', 'path'=>'Source.type', 'min'=>0, 'max'=>1},
            'element' => {'type'=>'string', 'path'=>'Source.element', 'min'=>0, 'max'=>1},
            'listMode' => {'valid_codes'=>{'http://hl7.org/fhir/map-list-mode'=>['first', 'share', 'last', 'first', 'share', 'last']}, 'type'=>'code', 'path'=>'Source.listMode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-list-mode'}},
            'variable' => {'type'=>'id', 'path'=>'Source.variable', 'min'=>0, 'max'=>1},
            'condition' => {'type'=>'string', 'path'=>'Source.condition', 'min'=>0, 'max'=>1},
            'check' => {'type'=>'string', 'path'=>'Source.check', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :required          # 1-1 boolean
          attr_accessor :context           # 1-1 id
          attr_accessor :contextType       # 1-1 code
          attr_accessor :min               # 0-1 integer
          attr_accessor :max               # 0-1 string
          attr_accessor :type              # 0-1 string
          attr_accessor :element           # 0-1 string
          attr_accessor :listMode          # 0-1 code
          attr_accessor :variable          # 0-1 id
          attr_accessor :condition         # 0-1 string
          attr_accessor :check             # 0-1 string
        end

        class Target < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Target.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Target.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Target.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'context' => {'type'=>'id', 'path'=>'Target.context', 'min'=>0, 'max'=>1},
            'contextType' => {'valid_codes'=>{'http://hl7.org/fhir/map-context-type'=>['type', 'variable', 'type', 'variable']}, 'type'=>'code', 'path'=>'Target.contextType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-context-type'}},
            'element' => {'type'=>'string', 'path'=>'Target.element', 'min'=>0, 'max'=>1},
            'variable' => {'type'=>'id', 'path'=>'Target.variable', 'min'=>0, 'max'=>1},
            'listMode' => {'valid_codes'=>{'http://hl7.org/fhir/map-list-mode'=>['first', 'share', 'last', 'first', 'share', 'last']}, 'type'=>'code', 'path'=>'Target.listMode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-list-mode'}},
            'listRuleId' => {'type'=>'id', 'path'=>'Target.listRuleId', 'min'=>0, 'max'=>1},
            'transform' => {'valid_codes'=>{'http://hl7.org/fhir/map-transform'=>['create', 'copy', 'truncate', 'escape', 'cast', 'append', 'translate', 'reference', 'dateOp', 'uuid', 'pointer', 'evaluate', 'cc', 'c', 'qty', 'id', 'cp', 'create', 'copy', 'truncate', 'escape', 'cast', 'append', 'translate', 'reference', 'dateOp', 'uuid', 'pointer', 'evaluate', 'cc', 'c', 'qty', 'id', 'cp']}, 'type'=>'code', 'path'=>'Target.transform', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-transform'}},
            'parameter' => {'type'=>'StructureMap::Group::Rule::Target::Parameter', 'path'=>'Target.parameter', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class Parameter < FHIR::Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            MULTIPLE_TYPES = {
              'value' => ['id', 'string', 'boolean', 'integer', 'decimal']
            }
            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Parameter.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Parameter.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Parameter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'valueId' => {'type'=>'id', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
              'valueString' => {'type'=>'string', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
              'valueBoolean' => {'type'=>'boolean', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
              'valueInteger' => {'type'=>'integer', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
              'valueDecimal' => {'type'=>'decimal', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1}
            }

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :valueId           # 1-1 id
            attr_accessor :valueString       # 1-1 string
            attr_accessor :valueBoolean      # 1-1 boolean
            attr_accessor :valueInteger      # 1-1 integer
            attr_accessor :valueDecimal      # 1-1 decimal
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :context           # 0-1 id
          attr_accessor :contextType       # 0-1 code
          attr_accessor :element           # 0-1 string
          attr_accessor :variable          # 0-1 id
          attr_accessor :listMode          # 0-* [ code ]
          attr_accessor :listRuleId        # 0-1 id
          attr_accessor :transform         # 0-1 code
          attr_accessor :parameter         # 0-* [ StructureMap::Group::Rule::Target::Parameter ]
        end

        class Dependent < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Dependent.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Dependent.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Dependent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'name' => {'type'=>'id', 'path'=>'Dependent.name', 'min'=>1, 'max'=>1},
            'variable' => {'type'=>'string', 'path'=>'Dependent.variable', 'min'=>1, 'max'=>Float::INFINITY}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :name              # 1-1 id
          attr_accessor :variable          # 1-* [ string ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 1-1 id
        attr_accessor :source            # 1-* [ StructureMap::Group::Rule::Source ]
        attr_accessor :target            # 0-* [ StructureMap::Group::Rule::Target ]
        attr_accessor :rule              # 0-* [ StructureMap::Group::Rule ]
        attr_accessor :dependent         # 0-* [ StructureMap::Group::Rule::Dependent ]
        attr_accessor :documentation     # 0-1 string
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :name              # 1-1 id
      attr_accessor :extends           # 0-1 id
      attr_accessor :documentation     # 0-1 string
      attr_accessor :input             # 1-* [ StructureMap::Group::Input ]
      attr_accessor :rule              # 1-* [ StructureMap::Group::Rule ]
    end

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :url               # 1-1 uri
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :version           # 0-1 string
    attr_accessor :name              # 1-1 string
    attr_accessor :title             # 0-1 string
    attr_accessor :status            # 1-1 code
    attr_accessor :experimental      # 0-1 boolean
    attr_accessor :publisher         # 0-1 string
    attr_accessor :contact           # 0-* [ ContactDetail ]
    attr_accessor :date              # 0-1 dateTime
    attr_accessor :description       # 0-1 markdown
    attr_accessor :useContext        # 0-* [ UsageContext ]
    attr_accessor :jurisdiction      # 0-* [ CodeableConcept ]
    attr_accessor :purpose           # 0-1 markdown
    attr_accessor :copyright         # 0-1 markdown
    attr_accessor :structure         # 0-* [ StructureMap::Structure ]
    attr_accessor :import            # 0-* [ uri ]
    attr_accessor :group             # 1-* [ StructureMap::Group ]

    def resourceType
      'StructureMap'
    end
  end
end