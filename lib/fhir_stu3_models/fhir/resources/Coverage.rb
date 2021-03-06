module FHIR
  module STU3
    class Coverage < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      SEARCH_PARAMS = ['beneficiary', 'class', 'dependent', 'group', 'identifier', 'payor', 'plan', 'policy-holder', 'sequence', 'subclass', 'subgroup', 'subplan', 'subscriber', 'type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Coverage.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Coverage.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Coverage.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Coverage.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Coverage.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Coverage.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Coverage.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Coverage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Coverage.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'Coverage.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/coverage-selfpay'=>['pay'], 'http://hl7.org/fhir/v3/ActCode'=>['EHCPOL', 'HSAPOL', 'AUTOPOL', 'COL', 'UNINSMOT', 'PUBLICPOL', 'DENTPRG', 'DISEASEPRG', 'CANPRG', 'ENDRENAL', 'HIVAIDS', 'MANDPOL', 'MENTPRG', 'SAFNET', 'SUBPRG', 'SUBSIDIZ', 'SUBSIDMC', 'SUBSUPP', 'WCBPOL', 'DENTAL', 'DISEASE', 'DRUGPOL', 'HIP', 'LTC', 'MCPOL', 'POS', 'HMO', 'PPO', 'MENTPOL', 'SUBPOL', 'VISPOL', 'DIS', 'EWB', 'FLEXP', 'LIFE', 'ANNU', 'TLIFE', 'ULIFE', 'PNC', 'REI', 'SURPL', 'UMBRL', 'CHAR', 'CRIME', 'EAP', 'GOVEMP', 'HIRISK', 'IND', 'MILITARY', 'RETIRE', 'SOCIAL', 'VET'], nil=>[]}, 'type'=>'CodeableConcept', 'path'=>'Coverage.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/coverage-type'}},
        'policyHolder' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Coverage.policyHolder', 'min'=>0, 'max'=>1},
        'subscriber' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Coverage.subscriber', 'min'=>0, 'max'=>1},
        'subscriberId' => {'type'=>'string', 'path'=>'Coverage.subscriberId', 'min'=>0, 'max'=>1},
        'beneficiary' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Coverage.beneficiary', 'min'=>0, 'max'=>1},
        'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/policyholder-relationship'=>['child', 'parent', 'spouse', 'common', 'other', 'self']}, 'type'=>'CodeableConcept', 'path'=>'Coverage.relationship', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/policyholder-relationship'}},
        'period' => {'type'=>'Period', 'path'=>'Coverage.period', 'min'=>0, 'max'=>1},
        'payor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Coverage.payor', 'min'=>0, 'max'=>Float::INFINITY},
        'grouping' => {'type'=>'Coverage::Grouping', 'path'=>'Coverage.grouping', 'min'=>0, 'max'=>1},
        'dependent' => {'type'=>'string', 'path'=>'Coverage.dependent', 'min'=>0, 'max'=>1},
        'sequence' => {'type'=>'string', 'path'=>'Coverage.sequence', 'min'=>0, 'max'=>1},
        'order' => {'type'=>'positiveInt', 'path'=>'Coverage.order', 'min'=>0, 'max'=>1},
        'network' => {'type'=>'string', 'path'=>'Coverage.network', 'min'=>0, 'max'=>1},
        'contract' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Contract'], 'type'=>'Reference', 'path'=>'Coverage.contract', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Grouping < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Grouping.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Grouping.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Grouping.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'group' => {'type'=>'string', 'path'=>'Grouping.group', 'min'=>0, 'max'=>1},
          'groupDisplay' => {'type'=>'string', 'path'=>'Grouping.groupDisplay', 'min'=>0, 'max'=>1},
          'subGroup' => {'type'=>'string', 'path'=>'Grouping.subGroup', 'min'=>0, 'max'=>1},
          'subGroupDisplay' => {'type'=>'string', 'path'=>'Grouping.subGroupDisplay', 'min'=>0, 'max'=>1},
          'plan' => {'type'=>'string', 'path'=>'Grouping.plan', 'min'=>0, 'max'=>1},
          'planDisplay' => {'type'=>'string', 'path'=>'Grouping.planDisplay', 'min'=>0, 'max'=>1},
          'subPlan' => {'type'=>'string', 'path'=>'Grouping.subPlan', 'min'=>0, 'max'=>1},
          'subPlanDisplay' => {'type'=>'string', 'path'=>'Grouping.subPlanDisplay', 'min'=>0, 'max'=>1},
          'class' => {'local_name'=>'local_class', 'type'=>'string', 'path'=>'Grouping.class', 'min'=>0, 'max'=>1},
          'classDisplay' => {'type'=>'string', 'path'=>'Grouping.classDisplay', 'min'=>0, 'max'=>1},
          'subClass' => {'type'=>'string', 'path'=>'Grouping.subClass', 'min'=>0, 'max'=>1},
          'subClassDisplay' => {'type'=>'string', 'path'=>'Grouping.subClassDisplay', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :group             # 0-1 string
        attr_accessor :groupDisplay      # 0-1 string
        attr_accessor :subGroup          # 0-1 string
        attr_accessor :subGroupDisplay   # 0-1 string
        attr_accessor :plan              # 0-1 string
        attr_accessor :planDisplay       # 0-1 string
        attr_accessor :subPlan           # 0-1 string
        attr_accessor :subPlanDisplay    # 0-1 string
        attr_accessor :local_class       # 0-1 string
        attr_accessor :classDisplay      # 0-1 string
        attr_accessor :subClass          # 0-1 string
        attr_accessor :subClassDisplay   # 0-1 string
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 0-* [ Identifier ]
      attr_accessor :status            # 0-1 code
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :policyHolder      # 0-1 Reference(Patient|RelatedPerson|Organization)
      attr_accessor :subscriber        # 0-1 Reference(Patient|RelatedPerson)
      attr_accessor :subscriberId      # 0-1 string
      attr_accessor :beneficiary       # 0-1 Reference(Patient)
      attr_accessor :relationship      # 0-1 CodeableConcept
      attr_accessor :period            # 0-1 Period
      attr_accessor :payor             # 0-* [ Reference(Organization|Patient|RelatedPerson) ]
      attr_accessor :grouping          # 0-1 Coverage::Grouping
      attr_accessor :dependent         # 0-1 string
      attr_accessor :sequence          # 0-1 string
      attr_accessor :order             # 0-1 positiveInt
      attr_accessor :network           # 0-1 string
      attr_accessor :contract          # 0-* [ Reference(Contract) ]

      def resourceType
        'Coverage'
      end
    end
  end
end