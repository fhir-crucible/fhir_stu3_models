module FHIR
  class Media < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["created", "identifier", "operator", "patient", "subject", "subtype", "type", "view"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Media.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Media.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Media.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Media.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'Media.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Media.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Media.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Media.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Media.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/digital-media-type'=>['photo', 'video', 'audio']}, 'type'=>'code', 'path'=>'Media.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/digital-media-type'}},
      'subtype' => {'type'=>'CodeableConcept', 'path'=>'Media.subtype', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/digital-media-subtype'}},
      'view' => {'valid_codes'=>{'http://snomed.info/sct'=>['260421001', '260422008', '260424009', '260425005', '260426006', '260427002', '260428007', '260430009', '260431008', '260432001', '260434000', '260435004', '260436003', '260437007', '260438002', '260439005', '260440007', '260441006', '260442004', '260443009', '260444003', '260445002', '260446001', '260447005', '260450008', '260451007', '260452000', '260453005', '260454004', '260455003', '260458001', '260459009', '260460004', '260461000', '260463002', '260464008', '260465009', '260466005', '260467001', '260468006', '260469003', '260470002', '260471003', '260472005', '260473000', '260475007', '260476008', '260477004', '260478009', '260479001', '260481004', '260482006', '260483001', '260484007', '260485008', '260486009', '260487000', '260489002', '260490006', '260491005', '260492003', '260493008', '260494002', '260496000', '260497009', '260499007', '260500003', '260501004', '260502006', '260503001', '260504007', '260506009', '272455005', '272456006', '272457002', '272458007', '272459004', '272460009', '272461008', '272462001', '272464000', '272465004', '272466003', '272467007', '272468002', '272469005', '272470006', '272472003', '272473008', '272474002', '272475001', '272476000', '272478004', '272479007', '272480005', '272481009', '272482002', '272483007', '272484001', '278255003', '278267001', '278318001', '398996004', '399000008', '399001007', '399002000', '399003005', '399004004', '399005003', '399006002', '399011000', '399012007', '399013002', '399022001', '399024000', '399025004', '399026003', '399028002', '399033003', '399037002', '399038007', '399059000', '399061009', '399065000', '399067008', '399071006', '399073009', '399074003', '399075002', '399080006', '399082003', '399083008', '399089007', '399098005', '399099002', '399101009', '399103007', '399108003', '399110001', '399113004', '399118008', '399125001', '399127009', '399129007', '399130002', '399132005', '399135007', '399136008', '399138009', '399142007', '399146005', '399148006', '399152006', '399156009', '399157000', '399159002', '399160007', '399161006', '399162004', '399163009', '399168000', '399169008', '399171008', '399173006', '399179005', '399181007', '399182000', '399184004', '399188001', '399192008', '399196006', '399198007', '399199004', '399201002', '399206007', '399212002', '399215000', '399218003', '399225005', '399227002', '399234000', '399236003', '399237007', '399241006', '399242004', '399243009', '399245002', '399246001', '399247005', '399251007', '399255003', '399260004', '399263002', '399265009', '399268006', '399270002', '399272005', '399273000', '399277004', '399278009', '399280003', '399281004', '399284007', '399285008', '399288005', '399290006', '399292003', '399296000', '399297009', '399300004', '399303002', '399308006', '399311007', '399312000', '399313005', '399316002', '399318001', '399320003', '399321004', '399325008', '399327000', '399330007', '399332004', '399335002', '399341009', '399342002', '399344001', '399348003', '399349006', '399351005', '399352003', '399355001', '399356000', '399358004', '399360002', '399361003', '399362005', '399365007', '399368009', '399370000', '399372008', '408723005', '408724004', '408725003', '408726002', '422534007', '422568001', '422670003', '422795009', '422861003', '422954003', '422996004', '423091003', '423720000', '424086005', '424655003', '424811006', '424962005', '425030002', '425035007', '425042007', '425157002', '425188003', '441505008', '441555000', '441672003', '441753009', '442361004', '442441009', '442580003', '442581004', '442593008', '442594002', '442640004', '442653001', '442667005']}, 'type'=>'CodeableConcept', 'path'=>'Media.view', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/media-view'}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Specimen'], 'type'=>'Reference', 'path'=>'Media.subject', 'min'=>0, 'max'=>1},
      'operator' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Media.operator', 'min'=>0, 'max'=>1},
      'deviceName' => {'type'=>'string', 'path'=>'Media.deviceName', 'min'=>0, 'max'=>1},
      'height' => {'type'=>'positiveInt', 'path'=>'Media.height', 'min'=>0, 'max'=>1},
      'width' => {'type'=>'positiveInt', 'path'=>'Media.width', 'min'=>0, 'max'=>1},
      'frames' => {'type'=>'positiveInt', 'path'=>'Media.frames', 'min'=>0, 'max'=>1},
      'duration' => {'type'=>'unsignedInt', 'path'=>'Media.duration', 'min'=>0, 'max'=>1},
      'content' => {'type'=>'Attachment', 'path'=>'Media.content', 'min'=>1, 'max'=>1}
    }

    attr_accessor :id                # 0-1 id
    attr_accessor :meta              # 0-1 Meta
    attr_accessor :implicitRules     # 0-1 uri
    attr_accessor :language          # 0-1 code
    attr_accessor :text              # 0-1 Narrative
    attr_accessor :contained         # 0-* [ Resource ]
    attr_accessor :extension         # 0-* [ Extension ]
    attr_accessor :modifierExtension # 0-* [ Extension ]
    attr_accessor :identifier        # 0-* [ Identifier ]
    attr_accessor :type              # 1-1 code
    attr_accessor :subtype           # 0-1 CodeableConcept
    attr_accessor :view              # 0-1 CodeableConcept
    attr_accessor :subject           # 0-1 Reference(Patient|Practitioner|Group|Device|Specimen)
    attr_accessor :operator          # 0-1 Reference(Practitioner)
    attr_accessor :deviceName        # 0-1 string
    attr_accessor :height            # 0-1 positiveInt
    attr_accessor :width             # 0-1 positiveInt
    attr_accessor :frames            # 0-1 positiveInt
    attr_accessor :duration          # 0-1 unsignedInt
    attr_accessor :content           # 1-1 Attachment

    def resourceType
      'Media'
    end
  end
end