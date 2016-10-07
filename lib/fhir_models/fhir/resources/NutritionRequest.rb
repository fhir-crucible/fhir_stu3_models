module FHIR
  class NutritionRequest < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["additive", "datetime", "encounter", "formula", "identifier", "oraldiet", "patient", "provider", "status", "supplement"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'NutritionRequest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'NutritionRequest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'NutritionRequest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'NutritionRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'NutritionRequest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'NutritionRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'NutritionRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'NutritionRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'NutritionRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/nutrition-request-status'=>['proposed', 'draft', 'planned', 'requested', 'active', 'on-hold', 'completed', 'cancelled', 'entered-in-error', 'proposed', 'draft', 'planned', 'requested', 'active', 'on-hold', 'completed', 'cancelled', 'entered-in-error']}, 'type'=>'code', 'path'=>'NutritionRequest.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/nutrition-request-status'}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'NutritionRequest.patient', 'min'=>1, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'NutritionRequest.encounter', 'min'=>0, 'max'=>1},
      'dateTime' => {'type'=>'dateTime', 'path'=>'NutritionRequest.dateTime', 'min'=>1, 'max'=>1},
      'orderer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'NutritionRequest.orderer', 'min'=>0, 'max'=>1},
      'allergyIntolerance' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/AllergyIntolerance'], 'type'=>'Reference', 'path'=>'NutritionRequest.allergyIntolerance', 'min'=>0, 'max'=>Float::INFINITY},
      'foodPreferenceModifier' => {'valid_codes'=>{'http://hl7.org/fhir/diet'=>['vegetarian', 'dairy-free', 'nut-free', 'gluten-free', 'vegan', 'halal', 'kosher', 'vegetarian', 'dairy-free', 'nut-free', 'gluten-free', 'vegan', 'halal', 'kosher']}, 'type'=>'CodeableConcept', 'path'=>'NutritionRequest.foodPreferenceModifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-diet'}},
      'excludeFoodModifier' => {'valid_codes'=>{'http://snomed.info/sct'=>[]}, 'type'=>'CodeableConcept', 'path'=>'NutritionRequest.excludeFoodModifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/food-type'}},
      'oralDiet' => {'type'=>'NutritionRequest::OralDiet', 'path'=>'NutritionRequest.oralDiet', 'min'=>0, 'max'=>1},
      'supplement' => {'type'=>'NutritionRequest::Supplement', 'path'=>'NutritionRequest.supplement', 'min'=>0, 'max'=>Float::INFINITY},
      'enteralFormula' => {'type'=>'NutritionRequest::EnteralFormula', 'path'=>'NutritionRequest.enteralFormula', 'min'=>0, 'max'=>1}
    }

    class OralDiet < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'OralDiet.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'OralDiet.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'OralDiet.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://snomed.info/sct'=>['38903004', '50712000', '56948003', '61420007', '182954008', '182955009', '182956005', '182957001', '182958006', '182959003', '182960008', '183028005', '223456000', '225373002', '225374008', '229912004', '229913009', '229914003', '229915002', '229916001', '229917005', '284071006', '289133003', '310244003', '361231003', '386261001', '404919001', '422972009', '425458000', '1151000175103']}, 'type'=>'CodeableConcept', 'path'=>'OralDiet.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/diet-type'}},
        'schedule' => {'type'=>'Timing', 'path'=>'OralDiet.schedule', 'min'=>0, 'max'=>Float::INFINITY},
        'nutrient' => {'type'=>'NutritionRequest::OralDiet::Nutrient', 'path'=>'OralDiet.nutrient', 'min'=>0, 'max'=>Float::INFINITY},
        'texture' => {'type'=>'NutritionRequest::OralDiet::Texture', 'path'=>'OralDiet.texture', 'min'=>0, 'max'=>Float::INFINITY},
        'fluidConsistencyType' => {'valid_codes'=>{'http://snomed.info/sct'=>['439031000124108', '439021000124105', '439041000124103', '439081000124109']}, 'type'=>'CodeableConcept', 'path'=>'OralDiet.fluidConsistencyType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/consistency-type'}},
        'instruction' => {'type'=>'string', 'path'=>'OralDiet.instruction', 'min'=>0, 'max'=>1}
      }

      class Nutrient < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Nutrient.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Nutrient.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Nutrient.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifier' => {'valid_codes'=>{'http://snomed.info/sct'=>['33463005', '39972003', '88480006']}, 'type'=>'CodeableConcept', 'path'=>'Nutrient.modifier', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/nutrient-code'}},
          'amount' => {'type'=>'Quantity', 'path'=>'Nutrient.amount', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :modifier          # 0-1 CodeableConcept
        attr_accessor :amount            # 0-1 Quantity
      end

      class Texture < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Texture.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Texture.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Texture.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifier' => {'valid_codes'=>{'http://snomed.info/sct'=>['228053002', '439091000124107', '228049004', '441881000124103', '441761000124103', '441751000124100', '228059003', '441791000124106', '228055009', '228056005', '441771000124105', '228057001', '228058006', '228060008']}, 'type'=>'CodeableConcept', 'path'=>'Texture.modifier', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/texture-code'}},
          'foodType' => {'valid_codes'=>{'http://snomed.info/sct'=>['255620007', '28647000', '22836000', '72511004', '226760005', '226887002', '102263004', '74242007', '227415002', '264331002', '227518002', '44027008', '226529007', '227210005']}, 'type'=>'CodeableConcept', 'path'=>'Texture.foodType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/modified-foodtype'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :modifier          # 0-1 CodeableConcept
        attr_accessor :foodType          # 0-1 CodeableConcept
      end

      attr_accessor :id                   # 0-1 string
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :type                 # 0-* [ CodeableConcept ]
      attr_accessor :schedule             # 0-* [ Timing ]
      attr_accessor :nutrient             # 0-* [ NutritionRequest::OralDiet::Nutrient ]
      attr_accessor :texture              # 0-* [ NutritionRequest::OralDiet::Texture ]
      attr_accessor :fluidConsistencyType # 0-* [ CodeableConcept ]
      attr_accessor :instruction          # 0-1 string
    end

    class Supplement < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Supplement.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Supplement.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Supplement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://snomed.info/sct'=>['442901000124106', '443031000124106', '443051000124104', '442911000124109', '443021000124108', '442971000124100', '442981000124102', '442991000124104', '443011000124100', '442961000124107', '442951000124105', '442941000124108', '442921000124101', '442931000124103', '444331000124106', '443361000124100', '443391000124108', '443401000124105', '443491000124103', '443501000124106', '443421000124100', '443471000124104', '444431000124104', '443451000124109', '444321000124108', '441561000124106', '443461000124106', '441531000124102', '443561000124107', '443481000124101', '441571000124104', '441591000124103', '441601000124106', '443351000124102', '443771000124106', '441671000124100', '443111000124101', '443431000124102', '443411000124108', '444361000124102', '444401000124107', '444381000124107', '444371000124109', '443441000124107', '442651000124102']}, 'type'=>'CodeableConcept', 'path'=>'Supplement.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/supplement-type'}},
        'productName' => {'type'=>'string', 'path'=>'Supplement.productName', 'min'=>0, 'max'=>1},
        'schedule' => {'type'=>'Timing', 'path'=>'Supplement.schedule', 'min'=>0, 'max'=>Float::INFINITY},
        'quantity' => {'type'=>'Quantity', 'path'=>'Supplement.quantity', 'min'=>0, 'max'=>1},
        'instruction' => {'type'=>'string', 'path'=>'Supplement.instruction', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :productName       # 0-1 string
      attr_accessor :schedule          # 0-* [ Timing ]
      attr_accessor :quantity          # 0-1 Quantity
      attr_accessor :instruction       # 0-1 string
    end

    class EnteralFormula < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'EnteralFormula.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'EnteralFormula.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'EnteralFormula.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'baseFormulaType' => {'valid_codes'=>{'http://snomed.info/sct'=>['443031000124106', '443051000124104', '442911000124109', '443021000124108', '442971000124100', '442981000124102', '442991000124104', '443011000124100', '442961000124107', '442951000124105', '442941000124108', '442921000124101', '442931000124103', '443361000124100', '443401000124105', '443491000124103', '443501000124106', '443421000124100', '443471000124104', '444431000124104', '443451000124109', '441561000124106', '443461000124106', '441531000124102', '443561000124107', '443481000124101', '441571000124104', '441591000124103', '441601000124106', '443351000124102', '443771000124106', '441671000124100', '443111000124101', '443431000124102', '443411000124108', '442651000124102']}, 'type'=>'CodeableConcept', 'path'=>'EnteralFormula.baseFormulaType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/entformula-type'}},
        'baseFormulaProductName' => {'type'=>'string', 'path'=>'EnteralFormula.baseFormulaProductName', 'min'=>0, 'max'=>1},
        'additiveType' => {'valid_codes'=>{'http://hl7.org/fhir/entformula-additive'=>['lipid', 'protein', 'carbohydrate', 'fiber', 'water', 'lipid', 'protein', 'carbohydrate', 'fiber', 'water']}, 'type'=>'CodeableConcept', 'path'=>'EnteralFormula.additiveType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/entformula-additive'}},
        'additiveProductName' => {'type'=>'string', 'path'=>'EnteralFormula.additiveProductName', 'min'=>0, 'max'=>1},
        'caloricDensity' => {'type'=>'Quantity', 'path'=>'EnteralFormula.caloricDensity', 'min'=>0, 'max'=>1},
        'routeofAdministration' => {'valid_codes'=>{'http://hl7.org/fhir/v3/RouteOfAdministration'=>['PO', 'EFT', 'ENTINSTL', 'GT', 'NGT', 'OGT', 'GJT', 'JJTINSTL', 'OJJ']}, 'type'=>'CodeableConcept', 'path'=>'EnteralFormula.routeofAdministration', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/enteral-route'}},
        'administration' => {'type'=>'NutritionRequest::EnteralFormula::Administration', 'path'=>'EnteralFormula.administration', 'min'=>0, 'max'=>Float::INFINITY},
        'maxVolumeToDeliver' => {'type'=>'Quantity', 'path'=>'EnteralFormula.maxVolumeToDeliver', 'min'=>0, 'max'=>1},
        'administrationInstruction' => {'type'=>'string', 'path'=>'EnteralFormula.administrationInstruction', 'min'=>0, 'max'=>1}
      }

      class Administration < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'rate' => ['Quantity', 'Ratio']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Administration.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Administration.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Administration.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'schedule' => {'type'=>'Timing', 'path'=>'Administration.schedule', 'min'=>0, 'max'=>1},
          'quantity' => {'type'=>'Quantity', 'path'=>'Administration.quantity', 'min'=>0, 'max'=>1},
          'rateQuantity' => {'type'=>'Quantity', 'path'=>'Administration.rate[x]', 'min'=>0, 'max'=>1},
          'rateRatio' => {'type'=>'Ratio', 'path'=>'Administration.rate[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :schedule          # 0-1 Timing
        attr_accessor :quantity          # 0-1 Quantity
        attr_accessor :rateQuantity      # 0-1 Quantity
        attr_accessor :rateRatio         # 0-1 Ratio
      end

      attr_accessor :id                        # 0-1 string
      attr_accessor :extension                 # 0-* [ Extension ]
      attr_accessor :modifierExtension         # 0-* [ Extension ]
      attr_accessor :baseFormulaType           # 0-1 CodeableConcept
      attr_accessor :baseFormulaProductName    # 0-1 string
      attr_accessor :additiveType              # 0-1 CodeableConcept
      attr_accessor :additiveProductName       # 0-1 string
      attr_accessor :caloricDensity            # 0-1 Quantity
      attr_accessor :routeofAdministration     # 0-1 CodeableConcept
      attr_accessor :administration            # 0-* [ NutritionRequest::EnteralFormula::Administration ]
      attr_accessor :maxVolumeToDeliver        # 0-1 Quantity
      attr_accessor :administrationInstruction # 0-1 string
    end

    attr_accessor :id                     # 0-1 id
    attr_accessor :meta                   # 0-1 Meta
    attr_accessor :implicitRules          # 0-1 uri
    attr_accessor :language               # 0-1 code
    attr_accessor :text                   # 0-1 Narrative
    attr_accessor :contained              # 0-* [ Resource ]
    attr_accessor :extension              # 0-* [ Extension ]
    attr_accessor :modifierExtension      # 0-* [ Extension ]
    attr_accessor :identifier             # 0-* [ Identifier ]
    attr_accessor :status                 # 0-1 code
    attr_accessor :patient                # 1-1 Reference(Patient)
    attr_accessor :encounter              # 0-1 Reference(Encounter)
    attr_accessor :dateTime               # 1-1 dateTime
    attr_accessor :orderer                # 0-1 Reference(Practitioner)
    attr_accessor :allergyIntolerance     # 0-* [ Reference(AllergyIntolerance) ]
    attr_accessor :foodPreferenceModifier # 0-* [ CodeableConcept ]
    attr_accessor :excludeFoodModifier    # 0-* [ CodeableConcept ]
    attr_accessor :oralDiet               # 0-1 NutritionRequest::OralDiet
    attr_accessor :supplement             # 0-* [ NutritionRequest::Supplement ]
    attr_accessor :enteralFormula         # 0-1 NutritionRequest::EnteralFormula

    def resourceType
      'NutritionRequest'
    end
  end
end