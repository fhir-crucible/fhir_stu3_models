module FHIR
  class ExpansionProfile < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['date', 'description', 'identifier', 'jurisdiction', 'name', 'publisher', 'status', 'url', 'version']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ExpansionProfile.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ExpansionProfile.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ExpansionProfile.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'ExpansionProfile.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'ExpansionProfile.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ExpansionProfile.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ExpansionProfile.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ExpansionProfile.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'ExpansionProfile.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'ExpansionProfile.identifier', 'min'=>0, 'max'=>1},
      'version' => {'type'=>'string', 'path'=>'ExpansionProfile.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'ExpansionProfile.name', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown', 'draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'ExpansionProfile.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'ExpansionProfile.experimental', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'ExpansionProfile.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'ExpansionProfile.publisher', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactDetail', 'path'=>'ExpansionProfile.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'markdown', 'path'=>'ExpansionProfile.description', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'UsageContext', 'path'=>'ExpansionProfile.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AN', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BU', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CS', 'CT', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DD', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DY', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FQ', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'HV', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'JT', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MI', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NH', 'NI', 'NL', 'NO', 'NP', 'NQ', 'NR', 'NT', 'NU', 'NZ', 'OM', 'PA', 'PC', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PU', 'PW', 'PY', 'PZ', 'QA', 'RE', 'RH', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SU', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TP', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VD', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WK', 'WS', 'YD', 'YE', 'YT', 'YU', 'ZA', 'ZM', 'ZR', 'ZW'], 'http://unstats.un.org/unsd/methods/m49/m49.htm'=>['001', '002', '014', '017', '015', '018', '011', '019', '419', '029', '013', '005', '021', '142', '143', '030', '034', '035', '145', '150', '151', '154', '039', '155', '009', '053', '054', '057', '061'], 'https://www.usps.com/'=>['AK', 'AL', 'AR', 'AS', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'FM', 'GA', 'GU', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MH', 'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'PW', 'RI', 'SC', 'SD', 'TN', 'TX', 'UM', 'UT', 'VA', 'VI', 'VT', 'WA', 'WI', 'WV', 'WY'], nil=>[]}, 'type'=>'CodeableConcept', 'path'=>'ExpansionProfile.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
      'fixedVersion' => {'type'=>'ExpansionProfile::FixedVersion', 'path'=>'ExpansionProfile.fixedVersion', 'min'=>0, 'max'=>Float::INFINITY},
      'excludedSystem' => {'type'=>'ExpansionProfile::ExcludedSystem', 'path'=>'ExpansionProfile.excludedSystem', 'min'=>0, 'max'=>1},
      'includeDesignations' => {'type'=>'boolean', 'path'=>'ExpansionProfile.includeDesignations', 'min'=>0, 'max'=>1},
      'designation' => {'type'=>'ExpansionProfile::Designation', 'path'=>'ExpansionProfile.designation', 'min'=>0, 'max'=>1},
      'includeDefinition' => {'type'=>'boolean', 'path'=>'ExpansionProfile.includeDefinition', 'min'=>0, 'max'=>1},
      'activeOnly' => {'type'=>'boolean', 'path'=>'ExpansionProfile.activeOnly', 'min'=>0, 'max'=>1},
      'excludeNested' => {'type'=>'boolean', 'path'=>'ExpansionProfile.excludeNested', 'min'=>0, 'max'=>1},
      'excludeNotForUI' => {'type'=>'boolean', 'path'=>'ExpansionProfile.excludeNotForUI', 'min'=>0, 'max'=>1},
      'excludePostCoordinated' => {'type'=>'boolean', 'path'=>'ExpansionProfile.excludePostCoordinated', 'min'=>0, 'max'=>1},
      'displayLanguage' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'ExpansionProfile.displayLanguage', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'limitedExpansion' => {'type'=>'boolean', 'path'=>'ExpansionProfile.limitedExpansion', 'min'=>0, 'max'=>1}
    }

    class FixedVersion < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'FixedVersion.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'FixedVersion.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'FixedVersion.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'system' => {'type'=>'uri', 'path'=>'FixedVersion.system', 'min'=>1, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'FixedVersion.version', 'min'=>1, 'max'=>1},
        'mode' => {'valid_codes'=>{'http://hl7.org/fhir/system-version-processing-mode'=>['default', 'check', 'override', 'default', 'check', 'override']}, 'type'=>'code', 'path'=>'FixedVersion.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/system-version-processing-mode'}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :system            # 1-1 uri
      attr_accessor :version           # 1-1 string
      attr_accessor :mode              # 1-1 code
    end

    class ExcludedSystem < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'ExcludedSystem.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'ExcludedSystem.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ExcludedSystem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'system' => {'type'=>'uri', 'path'=>'ExcludedSystem.system', 'min'=>1, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'ExcludedSystem.version', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :system            # 1-1 uri
      attr_accessor :version           # 0-1 string
    end

    class Designation < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Designation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Designation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Designation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'include' => {'type'=>'ExpansionProfile::Designation::Include', 'path'=>'Designation.include', 'min'=>0, 'max'=>1},
        'exclude' => {'type'=>'ExpansionProfile::Designation::Exclude', 'path'=>'Designation.exclude', 'min'=>0, 'max'=>1}
      }

      class Include < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Include.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Include.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Include.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'designation' => {'type'=>'ExpansionProfile::Designation::Include::Designation', 'path'=>'Include.designation', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Designation < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Designation.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Designation.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Designation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Designation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
            'use' => {'valid_codes'=>{'http://snomed.info/sct'=>['900000000000003001', '900000000000013009', '900000000000550004']}, 'type'=>'Coding', 'path'=>'Designation.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/designation-use'}}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :language          # 0-1 code
          attr_accessor :use               # 0-1 Coding
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :designation       # 0-* [ ExpansionProfile::Designation::Include::Designation ]
      end

      class Exclude < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Exclude.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Exclude.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Exclude.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'designation' => {'type'=>'ExpansionProfile::Designation::Exclude::Designation', 'path'=>'Exclude.designation', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Designation < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Designation.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Designation.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Designation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Designation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
            'use' => {'valid_codes'=>{'http://snomed.info/sct'=>['900000000000003001', '900000000000013009', '900000000000550004']}, 'type'=>'Coding', 'path'=>'Designation.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/designation-use'}}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :language          # 0-1 code
          attr_accessor :use               # 0-1 Coding
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :designation       # 0-* [ ExpansionProfile::Designation::Exclude::Designation ]
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :include           # 0-1 ExpansionProfile::Designation::Include
      attr_accessor :exclude           # 0-1 ExpansionProfile::Designation::Exclude
    end

    attr_accessor :id                     # 0-1 id
    attr_accessor :meta                   # 0-1 Meta
    attr_accessor :implicitRules          # 0-1 uri
    attr_accessor :language               # 0-1 code
    attr_accessor :text                   # 0-1 Narrative
    attr_accessor :contained              # 0-* [ Resource ]
    attr_accessor :extension              # 0-* [ Extension ]
    attr_accessor :modifierExtension      # 0-* [ Extension ]
    attr_accessor :url                    # 0-1 uri
    attr_accessor :identifier             # 0-1 Identifier
    attr_accessor :version                # 0-1 string
    attr_accessor :name                   # 0-1 string
    attr_accessor :status                 # 1-1 code
    attr_accessor :experimental           # 0-1 boolean
    attr_accessor :date                   # 0-1 dateTime
    attr_accessor :publisher              # 0-1 string
    attr_accessor :contact                # 0-* [ ContactDetail ]
    attr_accessor :description            # 0-1 markdown
    attr_accessor :useContext             # 0-* [ UsageContext ]
    attr_accessor :jurisdiction           # 0-* [ CodeableConcept ]
    attr_accessor :fixedVersion           # 0-* [ ExpansionProfile::FixedVersion ]
    attr_accessor :excludedSystem         # 0-1 ExpansionProfile::ExcludedSystem
    attr_accessor :includeDesignations    # 0-1 boolean
    attr_accessor :designation            # 0-1 ExpansionProfile::Designation
    attr_accessor :includeDefinition      # 0-1 boolean
    attr_accessor :activeOnly             # 0-1 boolean
    attr_accessor :excludeNested          # 0-1 boolean
    attr_accessor :excludeNotForUI        # 0-1 boolean
    attr_accessor :excludePostCoordinated # 0-1 boolean
    attr_accessor :displayLanguage        # 0-1 code
    attr_accessor :limitedExpansion       # 0-1 boolean

    def resourceType
      'ExpansionProfile'
    end
  end
end