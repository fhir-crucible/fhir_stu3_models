module FHIR
  class MeasureReport < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["patient"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'MeasureReport.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'MeasureReport.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'MeasureReport.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'MeasureReport.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'MeasureReport.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'MeasureReport.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'MeasureReport.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'MeasureReport.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'measure' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Measure'], 'type'=>'Reference', 'path'=>'MeasureReport.measure', 'min'=>1, 'max'=>1},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/measure-report-type'=>['individual', 'patient-list', 'summary']}, 'type'=>'code', 'path'=>'MeasureReport.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-report-type'}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'MeasureReport.patient', 'min'=>0, 'max'=>1},
      'period' => {'type'=>'Period', 'path'=>'MeasureReport.period', 'min'=>1, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/measure-report-status'=>['complete', 'pending', 'error']}, 'type'=>'code', 'path'=>'MeasureReport.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-report-status'}},
      'date' => {'type'=>'dateTime', 'path'=>'MeasureReport.date', 'min'=>0, 'max'=>1},
      'reportingOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'MeasureReport.reportingOrganization', 'min'=>0, 'max'=>1},
      'group' => {'type'=>'MeasureReport::Group', 'path'=>'MeasureReport.group', 'min'=>0, 'max'=>Float::INFINITY},
      'evaluatedResources' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Bundle'], 'type'=>'Reference', 'path'=>'MeasureReport.evaluatedResources', 'min'=>0, 'max'=>1}
    }

    class Group < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Group.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Group.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Group.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Group.identifier', 'min'=>1, 'max'=>1},
        'population' => {'type'=>'MeasureReport::Group::Population', 'path'=>'Group.population', 'min'=>0, 'max'=>Float::INFINITY},
        'measureScore' => {'type'=>'decimal', 'path'=>'Group.measureScore', 'min'=>0, 'max'=>1},
        'stratifier' => {'type'=>'MeasureReport::Group::Stratifier', 'path'=>'Group.stratifier', 'min'=>0, 'max'=>Float::INFINITY},
        'supplementalData' => {'type'=>'MeasureReport::Group::Supplementaldata', 'path'=>'Group.supplementalData', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Population < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Population.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Population.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Population.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/measure-population'=>['initial-population', 'numerator', 'numerator-exclusion', 'denominator', 'denominator-exclusion', 'denominator-exception', 'measure-population', 'measure-population-exclusion', 'measure-score']}, 'type'=>'code', 'path'=>'Population.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-population'}},
          'count' => {'type'=>'integer', 'path'=>'Population.count', 'min'=>0, 'max'=>1},
          'patients' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/List'], 'type'=>'Reference', 'path'=>'Population.patients', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 code
        attr_accessor :count             # 0-1 integer
        attr_accessor :patients          # 0-1 Reference(List)
      end

      class Stratifier < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Stratifier.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Stratifier.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Stratifier.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'identifier' => {'type'=>'Identifier', 'path'=>'Stratifier.identifier', 'min'=>1, 'max'=>1},
          'group' => {'type'=>'MeasureReport::Group::Stratifier::Group', 'path'=>'Stratifier.group', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Group < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Group.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Group.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Group.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'value' => {'type'=>'string', 'path'=>'Group.value', 'min'=>1, 'max'=>1},
            'population' => {'type'=>'MeasureReport::Group::Stratifier::Group::Population', 'path'=>'Group.population', 'min'=>0, 'max'=>Float::INFINITY},
            'measureScore' => {'type'=>'decimal', 'path'=>'Group.measureScore', 'min'=>0, 'max'=>1}
          }

          class Population < FHIR::Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'id', 'path'=>'Population.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Population.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Population.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'type' => {'valid_codes'=>{'http://hl7.org/fhir/measure-population'=>['initial-population', 'numerator', 'numerator-exclusion', 'denominator', 'denominator-exclusion', 'denominator-exception', 'measure-population', 'measure-population-exclusion', 'measure-score']}, 'type'=>'code', 'path'=>'Population.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-population'}},
              'count' => {'type'=>'integer', 'path'=>'Population.count', 'min'=>0, 'max'=>1},
              'patients' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/List'], 'type'=>'Reference', 'path'=>'Population.patients', 'min'=>0, 'max'=>1}
            }

            attr_accessor :id                # 0-1 id
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :type              # 1-1 code
            attr_accessor :count             # 0-1 integer
            attr_accessor :patients          # 0-1 Reference(List)
          end

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :value             # 1-1 string
          attr_accessor :population        # 0-* [ MeasureReport::Group::Stratifier::Group::Population ]
          attr_accessor :measureScore      # 0-1 decimal
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :identifier        # 1-1 Identifier
        attr_accessor :group             # 0-* [ MeasureReport::Group::Stratifier::Group ]
      end

      class Supplementaldata < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Supplementaldata.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Supplementaldata.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Supplementaldata.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'identifier' => {'type'=>'Identifier', 'path'=>'Supplementaldata.identifier', 'min'=>1, 'max'=>1},
          'group' => {'type'=>'MeasureReport::Group::Supplementaldata::Group', 'path'=>'Supplementaldata.group', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Group < FHIR::Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'id', 'path'=>'Group.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Group.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Group.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'value' => {'type'=>'string', 'path'=>'Group.value', 'min'=>1, 'max'=>1},
            'count' => {'type'=>'integer', 'path'=>'Group.count', 'min'=>0, 'max'=>1},
            'patients' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/List'], 'type'=>'Reference', 'path'=>'Group.patients', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 id
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :value             # 1-1 string
          attr_accessor :count             # 0-1 integer
          attr_accessor :patients          # 0-1 Reference(List)
        end

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :identifier        # 1-1 Identifier
        attr_accessor :group             # 0-* [ MeasureReport::Group::Supplementaldata::Group ]
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 1-1 Identifier
      attr_accessor :population        # 0-* [ MeasureReport::Group::Population ]
      attr_accessor :measureScore      # 0-1 decimal
      attr_accessor :stratifier        # 0-* [ MeasureReport::Group::Stratifier ]
      attr_accessor :supplementalData  # 0-* [ MeasureReport::Group::Supplementaldata ]
    end

    attr_accessor :id                    # 0-1 id
    attr_accessor :meta                  # 0-1 Meta
    attr_accessor :implicitRules         # 0-1 uri
    attr_accessor :language              # 0-1 code
    attr_accessor :text                  # 0-1 Narrative
    attr_accessor :contained             # 0-* [ Resource ]
    attr_accessor :extension             # 0-* [ Extension ]
    attr_accessor :modifierExtension     # 0-* [ Extension ]
    attr_accessor :measure               # 1-1 Reference(Measure)
    attr_accessor :type                  # 1-1 code
    attr_accessor :patient               # 0-1 Reference(Patient)
    attr_accessor :period                # 1-1 Period
    attr_accessor :status                # 1-1 code
    attr_accessor :date                  # 0-1 dateTime
    attr_accessor :reportingOrganization # 0-1 Reference(Organization)
    attr_accessor :group                 # 0-* [ MeasureReport::Group ]
    attr_accessor :evaluatedResources    # 0-1 Reference(Bundle)

    def resourceType
      'MeasureReport'
    end
  end
end