module FHIR
  class DeviceUseRequest < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'device' => ['Reference', 'CodeableConcept'],
      'occurrence' => ['dateTime', 'Period', 'Timing']
    }
    SEARCH_PARAMS = ["author-date", "based-on", "code", "definition", "device", "encounter", "event-date", "filler", "identifier", "patient", "replaces", "requester", "requisition", "stage", "status", "subject"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'DeviceUseRequest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'DeviceUseRequest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'DeviceUseRequest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'DeviceUseRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'DeviceUseRequest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'DeviceUseRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'DeviceUseRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'DeviceUseRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'DeviceUseRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'definition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'DeviceUseRequest.definition', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'DeviceUseRequest.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'replaces' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'DeviceUseRequest.replaces', 'min'=>0, 'max'=>Float::INFINITY},
      'requisition' => {'type'=>'Identifier', 'path'=>'DeviceUseRequest.requisition', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/request-status'=>['draft', 'active', 'suspended', 'completed', 'entered-in-error', 'cancelled', 'draft', 'active', 'suspended', 'completed', 'entered-in-error', 'cancelled']}, 'type'=>'code', 'path'=>'DeviceUseRequest.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/request-status'}},
      'stage' => {'valid_codes'=>{'http://hl7.org/fhir/request-stage'=>['proposal', 'plan', 'original-order', 'encoded', 'reflex-order', 'proposal', 'plan', 'original-order', 'encoded', 'reflex-order']}, 'type'=>'CodeableConcept', 'path'=>'DeviceUseRequest.stage', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/request-stage'}},
      'deviceReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'DeviceUseRequest.device[x]', 'min'=>1, 'max'=>1},
      'deviceCodeableConcept' => {'valid_codes'=>{'http://snomed.info/sct'=>[]}, 'type'=>'CodeableConcept', 'path'=>'DeviceUseRequest.device[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/device-kind'}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'DeviceUseRequest.subject', 'min'=>1, 'max'=>1},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'DeviceUseRequest.context', 'min'=>0, 'max'=>1},
      'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'DeviceUseRequest.occurrence[x]', 'min'=>0, 'max'=>1},
      'occurrencePeriod' => {'type'=>'Period', 'path'=>'DeviceUseRequest.occurrence[x]', 'min'=>0, 'max'=>1},
      'occurrenceTiming' => {'type'=>'Timing', 'path'=>'DeviceUseRequest.occurrence[x]', 'min'=>0, 'max'=>1},
      'authored' => {'type'=>'dateTime', 'path'=>'DeviceUseRequest.authored', 'min'=>0, 'max'=>1},
      'requester' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'DeviceUseRequest.requester', 'min'=>0, 'max'=>1},
      'performerType' => {'valid_codes'=>{'http://snomed.info/sct'=>['270002', '375005', '444000', '609005', '1354005', '2272004', '2316007', '2368000', '2481008', '2959006', '3425009', '3851003', '4577005', '6676009', '8458002', '8674003', '9306000', '9947008', '10896006', '10960006', '11286003', '11393001', '11434005', '11773006', '11993008', '12241003', '12629003', '13038009', '13157002', '13443008', '13646006', '14469008', '15130002', '17219007', '17925003', '17945006', '18205005', '18906004', '19343003', '19686009', '21093007', '21464003', '21506002', '22387007', '22573006', '22609000', '22963000', '25211005', '27508009', '27733009', '28010004', '29539002', '29644004', '29787005', '30578000', '31656007', '31831004', '33969000', '34581001', '34871008', '34972000', '38048003', '38248007', '38265003', '38312007', '39062003', '40683002', '41057000', '41795004', '41953004', '44181008', '45929001', '46363003', '47801002', '48385004', '48673000', '50058005', '50261002', '51616000', '53201003', '54056000', '55538000', '58293006', '58626002', '60614009', '62090008', '62296006', '64988008', '65412001', '65616008', '65656005', '65853000', '66089001', '66839005', '67005001', '67147004', '67822003', '68021009', '70578009', '70862002', '70924004', '72012000', '72705000', '73678001', '74128007', '74489007', '75226009', '75615008', '76022008', '76087000', '78194006', '78272007', '78652007', '78872000', '79508001', '79756005', '80386000', '80587008', '81173009', '81276006', '81467001', '81706006', '82101005', '83408003', '83420006', '83559000', '84390006', '85058002', '85411004', '85683001', '86372007', '86764008', '88510002', '89681006', '90921004', '105428002', '105429005', '105431001', '105436006', '105437002', '105438007', '105449001', '105450001', '105451002', '105452009', '105453004', '105454005', '105455006', '105456007', '105457003', '105458008', '105459000', '105460005', '105461009', '105462002', '105463007', '105464001', '105465000', '105466004', '105467008', '105468003', '105469006', '105470007', '105471006', '105472004', '105473009', '105474003', '113157001', '113158006', '113159003', '113160008', '113161007', '113163005', '116153009', '116154003', '125677006', '125678001', '125679009', '127848009', '127849001', '127850001', '127851002', '133931009', '133932002', '133933007', '133936004', '133937008', '160234004', '160498000', '160505009', '160506005', '160540005', '160542002', '160543007', '160544001', '160545000', '160549006', '160557009', '160558004', '160560002', '160562005', '160563000', '160566008', '160567004', '160772005', '161158003', '224080001', '224526002', '224527006', '224528001', '224619008', '224627004', '248544006', '255409004', '257497009', '257498004', '257499007', '257500003', '257501004', '257502006', '257503001', '257504007', '257505008', '257506009', '257508005', '257509002', '257510007', '257511006', '257512004', '257513009', '257514003', '257516001', '257517005', '257518000', '257519008', '257521003', '257522005', '257523000', '257524006', '257525007', '257526008', '262043009', '266943008', '268557009', '271448006', '276035002', '276036001', '276037005', '276119007', '303069001', '303071001', '303072008', '303073003', '303118004', '303119007', '303120001', '303121002', '303122009', '303977004', '303980003', '303981004', '303983001', '303984007', '303985008', '303986009', '303987000', '303988005', '303989002', '303990006', '303991005', '303992003', '303993008', '309456003', '309687009', '309884000', '309885004', '309886003', '310543008', '313415001', '313416000', '314712007', '314767008', '339947000', '360852005', '360863008', '360984002', '366740002', '373864002', '373929005', '385435006', '390790000', '394566006', '394567002', '394568007', '394571004', '394619001', '394738000', '394854006', '394855007', '394856008', '394857004', '394858009', '394859001', '394860006', '394861005', '394862003', '394863008', '394921008', '407542009', '407543004', '410597007', '410598002', '410599005', '410600008', '410601007', '410602000', '410603005', '410604004', '413327003', '414043009', '416034003', '416035002', '416625007', '416800000', '418119000', '419358007', '420058008', '420158005', '427568008', '427729003', '427754003', '427755002', '427874000', '427950002', '427963008', '427981006', '428024001', '428315004', '428347009', '428373004', '428376007', '428378008', '428407001', '428408006', '428410008', '428496003', '428503004', '428504005', '428506007', '428620006', '428666001', '428792000', '428801007', '428815009', '428816005', '428820009', '428821008', '429158002', '429171004', '429379008', '429509008', '429511004', '429527006', '429533002', '429534008', '429539003', '429543004', '429544005', '429545006', '429547003', '429577009', '429644000', '429708003', '429732005', '429787006', '429790000', '430098004', '430101000', '430792005', '430882007', '431549007', '433152004', '433475001', '438347000', '441463002', '441465009', '441468006', '444018008', '444052006', '444053001', '444054007', '444055008', '444145006', '444146007', '444147003', '444148008', '444168002', '444169005', '444191003', '444192005', '444193000', '444194006', '444199001', '444210007', '444211006', '444212004', '444213009', '444241008', '444242001', '444243006', '444244000', '444278006', '444279003', '444280000', '444292000', '444293005', '444294004', '444295003', '444301002', '444302009', '444303004', '444304005', '444464007', '444870008', '446654005', '450768005', '699110007', '699111006', '713176007', '713177003', '713178008', '713179000', '713183000', '713184006', '713352007', '713353002', '713369009', '32570881000036107']}, 'type'=>'CodeableConcept', 'path'=>'DeviceUseRequest.performerType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/participant-role'}},
      'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'DeviceUseRequest.performer', 'min'=>0, 'max'=>1},
      'reasonCode' => {'valid_codes'=>{'http://snomed.info/sct'=>[]}, 'type'=>'CodeableConcept', 'path'=>'DeviceUseRequest.reasonCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/condition-code'}},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'DeviceUseRequest.reasonReference', 'min'=>0, 'max'=>Float::INFINITY},
      'supportingInfo' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'DeviceUseRequest.supportingInfo', 'min'=>0, 'max'=>Float::INFINITY},
      'note' => {'type'=>'Annotation', 'path'=>'DeviceUseRequest.note', 'min'=>0, 'max'=>Float::INFINITY},
      'relevantHistory' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Provenance'], 'type'=>'Reference', 'path'=>'DeviceUseRequest.relevantHistory', 'min'=>0, 'max'=>Float::INFINITY}
    }

    attr_accessor :id                    # 0-1 id
    attr_accessor :meta                  # 0-1 Meta
    attr_accessor :implicitRules         # 0-1 uri
    attr_accessor :language              # 0-1 code
    attr_accessor :text                  # 0-1 Narrative
    attr_accessor :contained             # 0-* [ Resource ]
    attr_accessor :extension             # 0-* [ Extension ]
    attr_accessor :modifierExtension     # 0-* [ Extension ]
    attr_accessor :identifier            # 0-* [ Identifier ]
    attr_accessor :definition            # 0-* [ Reference(Resource) ]
    attr_accessor :basedOn               # 0-* [ Reference(Resource) ]
    attr_accessor :replaces              # 0-* [ Reference(Resource) ]
    attr_accessor :requisition           # 0-1 Identifier
    attr_accessor :status                # 0-1 code
    attr_accessor :stage                 # 1-1 CodeableConcept
    attr_accessor :deviceReference       # 1-1 Reference(Device)
    attr_accessor :deviceCodeableConcept # 1-1 CodeableConcept
    attr_accessor :subject               # 1-1 Reference(Patient|Group|Location|Device)
    attr_accessor :context               # 0-1 Reference(Encounter|EpisodeOfCare)
    attr_accessor :occurrenceDateTime    # 0-1 dateTime
    attr_accessor :occurrencePeriod      # 0-1 Period
    attr_accessor :occurrenceTiming      # 0-1 Timing
    attr_accessor :authored              # 0-1 dateTime
    attr_accessor :requester             # 0-1 Reference(Device|Practitioner|Organization)
    attr_accessor :performerType         # 0-1 CodeableConcept
    attr_accessor :performer             # 0-1 Reference(Practitioner|Organization|Patient|Device|RelatedPerson)
    attr_accessor :reasonCode            # 0-* [ CodeableConcept ]
    attr_accessor :reasonReference       # 0-* [ Reference(Resource) ]
    attr_accessor :supportingInfo        # 0-* [ Reference(Resource) ]
    attr_accessor :note                  # 0-* [ Annotation ]
    attr_accessor :relevantHistory       # 0-* [ Reference(Provenance) ]

    def resourceType
      'DeviceUseRequest'
    end
  end
end