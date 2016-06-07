module FHIR
  class ProcessResponse < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'request' => ['Identifier', 'Reference'],
      'organization' => ['Identifier', 'Reference'],
      'requestProvider' => ['Identifier', 'Reference'],
      'requestOrganization' => ['Identifier', 'Reference']
    }
    SEARCH_PARAMS = ["identifier", "organizationidentifier", "organizationreference", "requestidentifier", "requestorganizationidentifier", "requestorganizationreference", "requestprovideridentifier", "requestproviderreference", "requestreference"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ProcessResponse.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ProcessResponse.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ProcessResponse.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'ProcessResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'ProcessResponse.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ProcessResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ProcessResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ProcessResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ProcessResponse.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'requestIdentifier' => {'type'=>'Identifier', 'path'=>'ProcessResponse.request[x]', 'min'=>0, 'max'=>1},
      'requestReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'ProcessResponse.request[x]', 'min'=>0, 'max'=>1},
      'outcome' => {'valid_codes'=>{'http://hl7.org/fhir/processoutcomecodes'=>['complete', 'pended', 'error']}, 'type'=>'Coding', 'path'=>'ProcessResponse.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/process-outcome'}},
      'disposition' => {'type'=>'string', 'path'=>'ProcessResponse.disposition', 'min'=>0, 'max'=>1},
      'ruleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'ProcessResponse.ruleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'originalRuleset' => {'valid_codes'=>{'http://hl7.org/fhir/ruleset'=>['x12-4010', 'x12-5010', 'x12-7010', 'cdanet-v2', 'cdanet-v4', 'cpha-3']}, 'type'=>'Coding', 'path'=>'ProcessResponse.originalRuleset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ruleset'}},
      'created' => {'type'=>'dateTime', 'path'=>'ProcessResponse.created', 'min'=>0, 'max'=>1},
      'organizationIdentifier' => {'type'=>'Identifier', 'path'=>'ProcessResponse.organization[x]', 'min'=>0, 'max'=>1},
      'organizationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ProcessResponse.organization[x]', 'min'=>0, 'max'=>1},
      'requestProviderIdentifier' => {'type'=>'Identifier', 'path'=>'ProcessResponse.requestProvider[x]', 'min'=>0, 'max'=>1},
      'requestProviderReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'ProcessResponse.requestProvider[x]', 'min'=>0, 'max'=>1},
      'requestOrganizationIdentifier' => {'type'=>'Identifier', 'path'=>'ProcessResponse.requestOrganization[x]', 'min'=>0, 'max'=>1},
      'requestOrganizationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ProcessResponse.requestOrganization[x]', 'min'=>0, 'max'=>1},
      'form' => {'valid_codes'=>{'http://hl7.org/fhir/forms-codes'=>['1', '2']}, 'type'=>'Coding', 'path'=>'ProcessResponse.form', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/forms'}},
      'notes' => {'type'=>'ProcessResponse::Notes', 'path'=>'ProcessResponse.notes', 'min'=>0, 'max'=>Float::INFINITY},
      'error' => {'valid_codes'=>{'http://hl7.org/fhir/adjudication-error'=>['a001', 'a002']}, 'type'=>'Coding', 'path'=>'ProcessResponse.error', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/adjudication-error'}}
    }

    class Notes < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Notes.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Notes.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Notes.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/note-type'=>['display', 'print', 'printoper']}, 'type'=>'Coding', 'path'=>'Notes.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/note-type'}},
        'text' => {'type'=>'string', 'path'=>'Notes.text', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 0-1 Coding
      attr_accessor :text              # 0-1 string
    end

    attr_accessor :id                            # 0-1 id
    attr_accessor :meta                          # 0-1 Meta
    attr_accessor :implicitRules                 # 0-1 uri
    attr_accessor :language                      # 0-1 code
    attr_accessor :text                          # 0-1 Narrative
    attr_accessor :contained                     # 0-* [ Resource ]
    attr_accessor :extension                     # 0-* [ Extension ]
    attr_accessor :modifierExtension             # 0-* [ Extension ]
    attr_accessor :identifier                    # 0-* [ Identifier ]
    attr_accessor :requestIdentifier             # 0-1 Identifier
    attr_accessor :requestReference              # 0-1 Reference(Resource)
    attr_accessor :outcome                       # 0-1 Coding
    attr_accessor :disposition                   # 0-1 string
    attr_accessor :ruleset                       # 0-1 Coding
    attr_accessor :originalRuleset               # 0-1 Coding
    attr_accessor :created                       # 0-1 dateTime
    attr_accessor :organizationIdentifier        # 0-1 Identifier
    attr_accessor :organizationReference         # 0-1 Reference(Organization)
    attr_accessor :requestProviderIdentifier     # 0-1 Identifier
    attr_accessor :requestProviderReference      # 0-1 Reference(Practitioner)
    attr_accessor :requestOrganizationIdentifier # 0-1 Identifier
    attr_accessor :requestOrganizationReference  # 0-1 Reference(Organization)
    attr_accessor :form                          # 0-1 Coding
    attr_accessor :notes                         # 0-* [ ProcessResponse::Notes ]
    attr_accessor :error                         # 0-* [ Coding ]

    def resourceType
      'ProcessResponse'
    end
  end
end