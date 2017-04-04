module FHIR
  class Measure < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['composed-of', 'date', 'depends-on', 'derived-from', 'description', 'effective', 'identifier', 'jurisdiction', 'name', 'predecessor', 'publisher', 'status', 'successor', 'title', 'topic', 'url', 'version']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Measure.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Measure.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Measure.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Measure.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Measure.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Measure.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Measure.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Measure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'url' => {'type'=>'uri', 'path'=>'Measure.url', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'Measure.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'version' => {'type'=>'string', 'path'=>'Measure.version', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'string', 'path'=>'Measure.name', 'min'=>0, 'max'=>1},
      'title' => {'type'=>'string', 'path'=>'Measure.title', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown', 'draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'Measure.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
      'experimental' => {'type'=>'boolean', 'path'=>'Measure.experimental', 'min'=>0, 'max'=>1},
      'date' => {'type'=>'dateTime', 'path'=>'Measure.date', 'min'=>0, 'max'=>1},
      'publisher' => {'type'=>'string', 'path'=>'Measure.publisher', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'markdown', 'path'=>'Measure.description', 'min'=>0, 'max'=>1},
      'purpose' => {'type'=>'markdown', 'path'=>'Measure.purpose', 'min'=>0, 'max'=>1},
      'usage' => {'type'=>'string', 'path'=>'Measure.usage', 'min'=>0, 'max'=>1},
      'approvalDate' => {'type'=>'date', 'path'=>'Measure.approvalDate', 'min'=>0, 'max'=>1},
      'lastReviewDate' => {'type'=>'date', 'path'=>'Measure.lastReviewDate', 'min'=>0, 'max'=>1},
      'effectivePeriod' => {'type'=>'Period', 'path'=>'Measure.effectivePeriod', 'min'=>0, 'max'=>1},
      'useContext' => {'type'=>'UsageContext', 'path'=>'Measure.useContext', 'min'=>0, 'max'=>Float::INFINITY},
      'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AN', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BU', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CS', 'CT', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DD', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DY', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FQ', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'HV', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'JT', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MI', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NH', 'NI', 'NL', 'NO', 'NP', 'NQ', 'NR', 'NT', 'NU', 'NZ', 'OM', 'PA', 'PC', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PU', 'PW', 'PY', 'PZ', 'QA', 'RE', 'RH', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SU', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TP', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VD', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WK', 'WS', 'YD', 'YE', 'YT', 'YU', 'ZA', 'ZM', 'ZR', 'ZW'], 'http://unstats.un.org/unsd/methods/m49/m49.htm'=>['001', '002', '014', '017', '015', '018', '011', '019', '419', '029', '013', '005', '021', '142', '143', '030', '034', '035', '145', '150', '151', '154', '039', '155', '009', '053', '054', '057', '061'], 'https://www.usps.com/'=>['AK', 'AL', 'AR', 'AS', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'FM', 'GA', 'GU', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MH', 'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'PW', 'RI', 'SC', 'SD', 'TN', 'TX', 'UM', 'UT', 'VA', 'VI', 'VT', 'WA', 'WI', 'WV', 'WY'], nil=>[]}, 'type'=>'CodeableConcept', 'path'=>'Measure.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
      'topic' => {'valid_codes'=>{'http://hl7.org/fhir/definition-topic'=>['treatment', 'education', 'assessment', 'treatment', 'education', 'assessment']}, 'type'=>'CodeableConcept', 'path'=>'Measure.topic', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/definition-topic'}},
      'contributor' => {'type'=>'Contributor', 'path'=>'Measure.contributor', 'min'=>0, 'max'=>Float::INFINITY},
      'contact' => {'type'=>'ContactDetail', 'path'=>'Measure.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'copyright' => {'type'=>'markdown', 'path'=>'Measure.copyright', 'min'=>0, 'max'=>1},
      'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'Measure.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
      'library' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Library'], 'type'=>'Reference', 'path'=>'Measure.library', 'min'=>0, 'max'=>Float::INFINITY},
      'disclaimer' => {'type'=>'markdown', 'path'=>'Measure.disclaimer', 'min'=>0, 'max'=>1},
      'scoring' => {'valid_codes'=>{'http://hl7.org/fhir/measure-scoring'=>['proportion', 'ratio', 'continuous-variable', 'cohort', 'proportion', 'ratio', 'continuous-variable', 'cohort']}, 'type'=>'CodeableConcept', 'path'=>'Measure.scoring', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-scoring'}},
      'compositeScoring' => {'valid_codes'=>{'http://hl7.org/fhir/composite-measure-scoring'=>['opportunity', 'all-or-nothing', 'linear', 'weighted', 'opportunity', 'all-or-nothing', 'linear', 'weighted']}, 'type'=>'CodeableConcept', 'path'=>'Measure.compositeScoring', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/composite-measure-scoring'}},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/measure-type'=>['process', 'outcome', 'structure', 'patient-reported-outcome', 'composite', 'process', 'outcome', 'structure', 'patient-reported-outcome', 'composite']}, 'type'=>'CodeableConcept', 'path'=>'Measure.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-type'}},
      'riskAdjustment' => {'type'=>'string', 'path'=>'Measure.riskAdjustment', 'min'=>0, 'max'=>1},
      'rateAggregation' => {'type'=>'string', 'path'=>'Measure.rateAggregation', 'min'=>0, 'max'=>1},
      'rationale' => {'type'=>'markdown', 'path'=>'Measure.rationale', 'min'=>0, 'max'=>1},
      'clinicalRecommendationStatement' => {'type'=>'markdown', 'path'=>'Measure.clinicalRecommendationStatement', 'min'=>0, 'max'=>1},
      'improvementNotation' => {'type'=>'string', 'path'=>'Measure.improvementNotation', 'min'=>0, 'max'=>1},
      'definition' => {'type'=>'markdown', 'path'=>'Measure.definition', 'min'=>0, 'max'=>Float::INFINITY},
      'guidance' => {'type'=>'markdown', 'path'=>'Measure.guidance', 'min'=>0, 'max'=>1},
      'set' => {'type'=>'string', 'path'=>'Measure.set', 'min'=>0, 'max'=>1},
      'group' => {'type'=>'Measure::Group', 'path'=>'Measure.group', 'min'=>0, 'max'=>Float::INFINITY},
      'supplementalData' => {'type'=>'Measure::SupplementalData', 'path'=>'Measure.supplementalData', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Group < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Group.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Group.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Group.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Group.identifier', 'min'=>1, 'max'=>1},
        'name' => {'type'=>'string', 'path'=>'Group.name', 'min'=>0, 'max'=>1},
        'description' => {'type'=>'string', 'path'=>'Group.description', 'min'=>0, 'max'=>1},
        'population' => {'type'=>'Measure::Group::Population', 'path'=>'Group.population', 'min'=>0, 'max'=>Float::INFINITY},
        'stratifier' => {'type'=>'Measure::Group::Stratifier', 'path'=>'Group.stratifier', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Population < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Population.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Population.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Population.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'identifier' => {'type'=>'Identifier', 'path'=>'Population.identifier', 'min'=>0, 'max'=>1},
          'code' => {'valid_codes'=>{'http://hl7.org/fhir/measure-population'=>['initial-population', 'numerator', 'numerator-exclusion', 'denominator', 'denominator-exclusion', 'denominator-exception', 'measure-population', 'measure-population-exclusion', 'measure-observation', 'initial-population', 'numerator', 'numerator-exclusion', 'denominator', 'denominator-exclusion', 'denominator-exception', 'measure-population', 'measure-population-exclusion', 'measure-observation']}, 'type'=>'CodeableConcept', 'path'=>'Population.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-population'}},
          'name' => {'type'=>'string', 'path'=>'Population.name', 'min'=>0, 'max'=>1},
          'description' => {'type'=>'string', 'path'=>'Population.description', 'min'=>0, 'max'=>1},
          'criteria' => {'type'=>'string', 'path'=>'Population.criteria', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :identifier        # 0-1 Identifier
        attr_accessor :code              # 0-1 CodeableConcept
        attr_accessor :name              # 0-1 string
        attr_accessor :description       # 0-1 string
        attr_accessor :criteria          # 1-1 string
      end

      class Stratifier < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Stratifier.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Stratifier.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Stratifier.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'identifier' => {'type'=>'Identifier', 'path'=>'Stratifier.identifier', 'min'=>0, 'max'=>1},
          'criteria' => {'type'=>'string', 'path'=>'Stratifier.criteria', 'min'=>0, 'max'=>1},
          'path' => {'type'=>'string', 'path'=>'Stratifier.path', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :identifier        # 0-1 Identifier
        attr_accessor :criteria          # 0-1 string
        attr_accessor :path              # 0-1 string
      end

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 1-1 Identifier
      attr_accessor :name              # 0-1 string
      attr_accessor :description       # 0-1 string
      attr_accessor :population        # 0-* [ Measure::Group::Population ]
      attr_accessor :stratifier        # 0-* [ Measure::Group::Stratifier ]
    end

    class SupplementalData < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'SupplementalData.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'SupplementalData.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'SupplementalData.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'SupplementalData.identifier', 'min'=>0, 'max'=>1},
        'usage' => {'valid_codes'=>{'http://hl7.org/fhir/measure-data-usage'=>['supplemental-data', 'risk-adjustment-factor', 'supplemental-data', 'risk-adjustment-factor']}, 'type'=>'CodeableConcept', 'path'=>'SupplementalData.usage', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-data-usage'}},
        'criteria' => {'type'=>'string', 'path'=>'SupplementalData.criteria', 'min'=>0, 'max'=>1},
        'path' => {'type'=>'string', 'path'=>'SupplementalData.path', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 0-1 Identifier
      attr_accessor :usage             # 0-* [ CodeableConcept ]
      attr_accessor :criteria          # 0-1 string
      attr_accessor :path              # 0-1 string
    end

    attr_accessor :id                              # 0-1 id
    attr_accessor :meta                            # 0-1 Meta
    attr_accessor :implicitRules                   # 0-1 uri
    attr_accessor :language                        # 0-1 code
    attr_accessor :text                            # 0-1 Narrative
    attr_accessor :contained                       # 0-* [ Resource ]
    attr_accessor :extension                       # 0-* [ Extension ]
    attr_accessor :modifierExtension               # 0-* [ Extension ]
    attr_accessor :url                             # 0-1 uri
    attr_accessor :identifier                      # 0-* [ Identifier ]
    attr_accessor :version                         # 0-1 string
    attr_accessor :name                            # 0-1 string
    attr_accessor :title                           # 0-1 string
    attr_accessor :status                          # 1-1 code
    attr_accessor :experimental                    # 0-1 boolean
    attr_accessor :date                            # 0-1 dateTime
    attr_accessor :publisher                       # 0-1 string
    attr_accessor :description                     # 0-1 markdown
    attr_accessor :purpose                         # 0-1 markdown
    attr_accessor :usage                           # 0-1 string
    attr_accessor :approvalDate                    # 0-1 date
    attr_accessor :lastReviewDate                  # 0-1 date
    attr_accessor :effectivePeriod                 # 0-1 Period
    attr_accessor :useContext                      # 0-* [ UsageContext ]
    attr_accessor :jurisdiction                    # 0-* [ CodeableConcept ]
    attr_accessor :topic                           # 0-* [ CodeableConcept ]
    attr_accessor :contributor                     # 0-* [ Contributor ]
    attr_accessor :contact                         # 0-* [ ContactDetail ]
    attr_accessor :copyright                       # 0-1 markdown
    attr_accessor :relatedArtifact                 # 0-* [ RelatedArtifact ]
    attr_accessor :library                         # 0-* [ Reference(Library) ]
    attr_accessor :disclaimer                      # 0-1 markdown
    attr_accessor :scoring                         # 0-1 CodeableConcept
    attr_accessor :compositeScoring                # 0-1 CodeableConcept
    attr_accessor :type                            # 0-* [ CodeableConcept ]
    attr_accessor :riskAdjustment                  # 0-1 string
    attr_accessor :rateAggregation                 # 0-1 string
    attr_accessor :rationale                       # 0-1 markdown
    attr_accessor :clinicalRecommendationStatement # 0-1 markdown
    attr_accessor :improvementNotation             # 0-1 string
    attr_accessor :definition                      # 0-* [ markdown ]
    attr_accessor :guidance                        # 0-1 markdown
    attr_accessor :set                             # 0-1 string
    attr_accessor :group                           # 0-* [ Measure::Group ]
    attr_accessor :supplementalData                # 0-* [ Measure::SupplementalData ]

    def resourceType
      'Measure'
    end
  end
end