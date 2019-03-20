module FHIR
  class Patient < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    MULTIPLE_TYPES = {
      'deceased' => ['boolean', 'dateTime'],
      'multipleBirth' => ['boolean', 'integer']
    }
    SEARCH_PARAMS = ['active', 'address', 'address-city', 'address-country', 'address-postalcode', 'address-state', 'address-use', 'animal-breed', 'animal-species', 'birthdate', 'death-date', 'deceased', 'email', 'family', 'gender', 'general-practitioner', 'given', 'identifier', 'language', 'link', 'name', 'organization', 'phone', 'phonetic', 'telecom']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Patient.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Patient.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Patient.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Patient.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Patient.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Patient.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Patient.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Patient.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Patient.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'active' => {'type'=>'boolean', 'path'=>'Patient.active', 'min'=>0, 'max'=>1},
      'name' => {'type'=>'HumanName', 'path'=>'Patient.name', 'min'=>0, 'max'=>Float::INFINITY},
      'telecom' => {'type'=>'ContactPoint', 'path'=>'Patient.telecom', 'min'=>0, 'max'=>Float::INFINITY},
      'gender' => {'valid_codes'=>{'http://hl7.org/fhir/administrative-gender'=>['male', 'female', 'other', 'unknown']}, 'type'=>'code', 'path'=>'Patient.gender', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/administrative-gender'}},
      'birthDate' => {'type'=>'date', 'path'=>'Patient.birthDate', 'min'=>0, 'max'=>1},
      'deceasedBoolean' => {'type'=>'boolean', 'path'=>'Patient.deceased[x]', 'min'=>0, 'max'=>1},
      'deceasedDateTime' => {'type'=>'dateTime', 'path'=>'Patient.deceased[x]', 'min'=>0, 'max'=>1},
      'address' => {'type'=>'Address', 'path'=>'Patient.address', 'min'=>0, 'max'=>Float::INFINITY},
      'maritalStatus' => {'valid_codes'=>{'http://hl7.org/fhir/v3/MaritalStatus'=>['A', 'D', 'I', 'L', 'M', 'P', 'S', 'T', 'U', 'W'], 'http://hl7.org/fhir/v3/NullFlavor'=>['UNK']}, 'type'=>'CodeableConcept', 'path'=>'Patient.maritalStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/marital-status'}},
      'multipleBirthBoolean' => {'type'=>'boolean', 'path'=>'Patient.multipleBirth[x]', 'min'=>0, 'max'=>1},
      'multipleBirthInteger' => {'type'=>'integer', 'path'=>'Patient.multipleBirth[x]', 'min'=>0, 'max'=>1},
      'photo' => {'type'=>'Attachment', 'path'=>'Patient.photo', 'min'=>0, 'max'=>Float::INFINITY},
      'contact' => {'type'=>'Patient::Contact', 'path'=>'Patient.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'animal' => {'type'=>'Patient::Animal', 'path'=>'Patient.animal', 'min'=>0, 'max'=>1},
      'communication' => {'type'=>'Patient::Communication', 'path'=>'Patient.communication', 'min'=>0, 'max'=>Float::INFINITY},
      'generalPractitioner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Patient.generalPractitioner', 'min'=>0, 'max'=>Float::INFINITY},
      'managingOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Patient.managingOrganization', 'min'=>0, 'max'=>1},
      'link' => {'type'=>'Patient::Link', 'path'=>'Patient.link', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Contact < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Contact.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Contact.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Contact.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/v2/0131'=>['BP', 'C', 'CP', 'E', 'EP', 'F', 'I', 'N', 'O', 'PR', 'S', 'U']}, 'type'=>'CodeableConcept', 'path'=>'Contact.relationship', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/v2-0131'}},
        'name' => {'type'=>'HumanName', 'path'=>'Contact.name', 'min'=>0, 'max'=>1},
        'telecom' => {'type'=>'ContactPoint', 'path'=>'Contact.telecom', 'min'=>0, 'max'=>Float::INFINITY},
        'address' => {'type'=>'Address', 'path'=>'Contact.address', 'min'=>0, 'max'=>1},
        'gender' => {'valid_codes'=>{'http://hl7.org/fhir/administrative-gender'=>['male', 'female', 'other', 'unknown']}, 'type'=>'code', 'path'=>'Contact.gender', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/administrative-gender'}},
        'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Contact.organization', 'min'=>0, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'Contact.period', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :relationship      # 0-* [ CodeableConcept ]
      attr_accessor :name              # 0-1 HumanName
      attr_accessor :telecom           # 0-* [ ContactPoint ]
      attr_accessor :address           # 0-1 Address
      attr_accessor :gender            # 0-1 code
      attr_accessor :organization      # 0-1 Reference(Organization)
      attr_accessor :period            # 0-1 Period
    end

    class Animal < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Animal.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Animal.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Animal.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'species' => {'valid_codes'=>{'http://snomed.info/sct'=>['125097000', '125099002', '34618005', '425134008', '47290002', '15778005', '396620009', '388445009', '85626006', '132950000']}, 'type'=>'CodeableConcept', 'path'=>'Animal.species', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/animal-species'}},
        'breed' => {'valid_codes'=>{'http://snomed.info/sct'=>['684003', '2124007', '3099004', '3566006', '4574003', '4880003', '5164003', '5345000', '5438004', '6431001', '7843000', '9230001', '9277006', '11967001', '13934009', '16015002', '16042001', '23469003', '24438005', '25660007', '28336001', '28360002', '30089001', '32145006', '39855006', '41706005', '44835005', '45690005', '46392004', '48697009', '50717006', '53360003', '55530007', '59210004', '64158000', '64591001', '65187008', '65492002', '67414001', '67515002', '70431006', '72329005', '72648002', '73191001', '74745008', '79603002', '82440005', '83842004', '86920006', '87962009', '89665001', '89708009', '91460002', '112486002', '112487006', '112496006', '131607005', '131608000', '131609008', '131610003', '131611004', '131612006', '131613001', '131614007', '131615008', '131616009', '131617000', '131618005', '131619002', '131620008', '131621007', '131622000', '131623005', '131624004', '131625003', '131626002', '131627006', '131628001', '131629009', '131630004', '131631000', '131632007', '131633002', '131634008', '131635009', '131636005', '131637001', '131638006', '131639003', '131640001', '131641002', '131642009', '131643004', '131644005', '131645006', '131646007', '131647003', '131648008', '131649000', '131650000', '131651001', '131652008', '131653003', '131654009', '131655005', '131656006', '131657002', '131658007', '131659004', '131660009', '131661008', '131662001', '131663006', '131664000', '131665004', '131666003', '131667007', '131668002', '131669005', '131670006', '131671005', '131672003', '131673008', '131674002', '131675001', '131676000', '131677009', '131678004', '131679007', '131680005', '131681009', '131682002', '131683007', '131684001', '131685000', '131686004', '131687008', '131688003', '131689006', '131690002', '131691003', '131692005', '131693000', '131694006', '131695007', '131696008', '131697004', '131698009', '131699001', '131700000', '131701001', '131702008', '131703003', '131704009', '131705005', '131706006', '131707002', '131708007', '131709004', '131710009', '131711008', '131712001', '131713006', '131714000', '131715004', '131716003', '131717007', '131718002', '131719005', '131720004', '131721000', '131722007', '131723002', '131724008', '131725009', '131726005', '131727001', '131728006', '131729003', '131730008', '131731007', '131732000', '131733005', '131734004', '131735003', '131736002', '131737006', '131738001', '131739009', '131740006', '131741005', '131742003', '131743008', '131744002', '131745001', '131746000', '131747009', '131748004', '131749007', '131750007', '131751006', '131752004', '131753009', '131754003', '131755002', '131756001', '131757005', '131758000', '131759008', '131760003', '131761004', '131762006', '131763001', '131764007', '131765008', '131766009', '131767000', '131768005', '131769002', '131770001', '131771002', '131772009', '131773004', '131774005', '131775006', '131776007', '131777003', '131778008', '131779000', '131780002', '131781003', '131782005', '131783000', '131784006', '131785007', '131786008', '131787004', '131788009', '131789001', '131790005', '131791009', '131792002', '131793007', '131794001', '131795000', '131796004', '131797008', '131798003', '131799006', '131800005', '131801009', '131802002', '131803007', '131810001', '131811002', '131812009', '131813004', '131814005', '131815006', '131816007', '131817003', '131818008', '131820006', '131821005', '131822003', '131823008', '131824002', '131825001', '131826000', '131827009', '131829007', '131830002', '131831003', '131832005', '131833000', '131834006', '131835007', '131836008', '131837004', '131838009', '131839001', '131840004', '131841000', '131843002', '131844008', '131845009', '131847001', '131848006', '131849003', '131850003', '131851004', '131852006', '131853001', '131854007', '131855008', '131856009', '131914009', '131918007', '132681007', '132682000', '132684004', '132685003', '132686002', '132687006', '132688001', '132689009', '132690000', '132697002', '132698007', '132699004', '132700003', '132701004', '132702006', '132703001', '132704007', '132705008', '132706009', '132707000', '132708005', '132709002', '132710007', '132711006', '132712004', '132716001', '132717005', '132718000', '132719008', '132720002', '132721003', '132722005', '132723000', '132724006', '132735001', '132770004', '132783003', '132784009', '132785005', '132786006', '132787002', '132788007', '132789004', '132790008', '132791007', '132792000', '132793005', '132794004', '132795003', '132796002', '132797006', '132798001', '132799009', '132800008', '132801007', '132802000', '132803005', '132804004', '132805003', '132806002', '132807006', '132808001', '132809009', '132810004', '132811000', '132812007', '132813002', '132814008', '132815009', '132845007', '132846008', '132849001', '132851002', '132852009', '132853004', '132854005', '132855006', '132856007', '132857003', '132858008', '132859000', '132860005', '132861009', '132958007', '132959004', '132987008', '132988003', '132989006', '132990002', '132991003', '132992005', '132993000', '133702003', '133703008', '133704002', '133715007', '133716008', '133717004', '133718009', '133719001', '133720007', '133731004', '133732006', '133733001', '133734007', '133735008', '133736009', '133747002', '133748007', '133749004', '133750004', '133751000', '133752007', '133763005', '133764004', '133765003', '133766002', '133767006', '133768001', '133779006', '133780009', '133781008', '133782001', '133783006', '133784000', '133795006', '133796007', '133797003', '133798008', '133799000', '133800001', '133801002', '133802009', '133803004', '133804005', '133805006', '133806007', '133807003', '133808008', '133809000', '133810005', '133811009', '133812002', '133813007', '133814001', '133815000', '133816004', '133817008', '133818003', '133819006', '133820000', '133821001', '133822008', '133823003', '133824009', '133825005', '133826006', '133827002', '133828007', '133829004', '133830009', '133831008', '133832001', '133833006', '133834000', '133835004', '133836003', '133837007', '133838002', '133839005', '133840007', '133841006', '133842004', '406660008', '406722006', '409911001', '125097000', '125099002', '25327001', '125101009', '21208000', '424705003', '427136006', '35354009', '125086000', '133068005', '133069002', '133070001', '133071002', '133120002', '133121003', '133122005', '1247002', '7623008', '22720009', '26837006', '26973000', '41092008', '45790002', '46408008', '47842004', '54098002', '54699009', '55167009', '72394007', '80777007', '90050009', '131862004', '131863009', '131864003', '131865002', '131866001', '131867005', '131868000', '131869008', '131870009', '131871008', '131873006', '131874000', '131875004', '131877007', '131878002', '131880008', '131881007', '131882000', '131883005', '131884004', '131885003', '131886002', '131887006', '131888001', '131889009', '131890000', '131891001', '131892008', '131893003', '131894009', '131895005', '131896006', '131897002', '131898007', '131899004', '131900009', '131901008', '131902001', '131903006', '131904000', '131905004', '131906003', '131907007', '132731005', '132951001', '132952008', '132953003', '132954009', '132955005', '132956006', '132957002', '133044002', '133072009', '133101004', '133116001', '133117005', '133118000', '133119008', '133123000', '133124006', '133125007', '133126008', '133127004', '133128009', '133129001', '133130006', '133131005', '133132003', '133133008', '133134002', '133135001', '133136000', '133137009', '133138004', '133139007', '133140009', '133141008', '133142001', '406711007', '6220006', '19356005', '25813002', '41754002', '54447000', '66168008', '70457009', '89648005', '112488001', '125084002', '131804001', '131805000', '131806004', '131807008', '131808003', '131809006', '131861006', '131908002', '131909005', '131910000', '131911001', '131912008', '131913003', '131916006', '131917002', '131919004', '131920005', '131921009', '131922002', '131923007', '131924001', '131925000', '131926004', '131927008', '131928003', '131929006', '131930001', '131931002', '131932009', '131933004', '131934005', '131935006', '131936007', '131937003', '131947000', '131948005', '131964002', '131972000', '131973005', '131974004', '131975003', '131976002', '131977006', '131978001', '131979009', '131980007', '131981006', '131982004', '131983009', '131984003', '131985002', '131986001', '131987005', '131990004', '131991000', '131993002', '132733008', '132734002', '132736000', '132737009', '132738004', '132739007', '132740009', '132742001', '132743006', '132746003', '132747007', '132748002', '132749005', '132750005', '132751009', '132757008', '132758003', '132759006', '132760001', '132761002', '132765006', '132766007', '132774008', '132775009', '132779003', '132996008', '133016003', '133017007', '133018002', '133019005', '133020004', '133021000', '133023002', '133024008', '133025009', '133026005', '133027001', '133028006', '133029003', '133034004', '133035003', '133043008', '133047009', '133048004', '133049007', '133050007', '133051006', '133052004', '133053009', '133054003', '133055002', '133056001', '133057005', '133058000', '133059008', '133060003', '133061004', '133062006', '133095000', '133096004', '133097008', '133098003', '133099006', '133100003', '133102006', '133103001', '133104007', '133105008', '133106009', '133108005', '133109002', '133110007', '133111006', '133112004', '133113009', '133114003', '133115002', '406714004', '1006005', '4288003', '4960000', '12360007', '13487004', '21295007', '26699009', '34200004', '39532001', '41738000', '51023000', '53567001', '56086005', '58264006', '69067004', '76302002', '76467006', '131938008', '131939000', '131940003', '131941004', '131942006', '131943001', '131944007', '131945008', '131946009', '131949002', '131950002', '131951003', '131952005', '131988000', '131989008', '131992007', '131994008', '132762009', '132764005', '132772007', '132773002', '132776005', '132777001', '132778006', '132960009', '132961008', '132962001', '132963006', '132964000', '132965004', '132966003', '132967007', '132968002', '132969005', '132970006', '132971005', '132972003', '132973008', '132974002', '132975001', '132976000', '132977009', '132978004', '132979007', '132980005', '132981009', '132982002', '132983007', '132984001', '132985000', '132986004', '132994006', '132997004', '133001001', '133010009', '133011008', '133012001', '133013006', '133014000', '133030008', '133031007', '133032000', '133033005', '133036002', '133037006', '133038001', '133039009', '133040006', '133041005', '133042003', '133045001', '133046000', '133063001', '133064007', '133065008', '133066009', '133067000', '133073004', '133074005', '133075006', '133076007', '133077003', '133078008', '133079000', '133080002', '133081003', '133082005', '133083000', '133084006', '133086008', '133087004', '133088009', '133089001', '133090005', '133091009', '133092002', '133093007', '133094001', '133143006', '133145004', '133146003', '133147007', '133148002', '133149005', '133150005', '133151009', '133152002', '133153007', '133154001', '133155000', '133156004', '133157008', '133158003', '133159006', '133160001', '406715003', '406721004', '3997000', '1118004', '1789009', '8089006', '25369002', '31633003', '131872001', '131953000', '131954006', '131955007', '131956008', '131957004', '131958009', '131959001', '131960006', '131962003', '131963008', '131965001', '131966000', '131967009', '131968004', '131969007', '131970008', '131971007', '132741008', '132744000', '132745004', '132995007', '132998009', '132999001', '133000000', '133002008', '133003003', '133004009', '133005005', '133006006', '133007002', '133008007', '133009004', '133015004', '42724005', '133107000', '396488006', '131819000', '131876003', '131879005', '131915005', '131961005', '132732003', '132763004', '132767003', '133022007', '133085007', '133144000', '125092006', '131426006', '131441006', '131442004', '131540009', '131541008', '131542001', '131543006', '131555000', '131556004', '131557008', '131558003', '131559006', '131560001', '131561002', '133290002', '133291003', '133551002', '133552009', '133553004', '133554005', '133575002', '133591004', '131427002', '131428007', '131443009', '131444003', '131445002', '131446001', '131447005', '131562009', '131563004', '131564005', '131565006', '131566007', '131567003', '133292005', '133293000', '133294006', '133295007', '133296008', '133297004', '133298009', '133299001', '133300009', '133301008', '133302001', '133303006', '133304000', '133305004', '133472001', '131429004', '131430009', '131431008', '131448000', '131449008', '131450008', '131451007', '131452000', '131453005', '131454004', '131455003', '131456002', '131458001', '131568008', '131569000', '131570004', '131571000', '131572007', '131573002', '131574008', '131575009', '131576005', '131577001', '133306003', '133307007', '133308002', '133309005', '133310000', '133311001', '133312008', '133313003', '133314009', '133315005']}, 'type'=>'CodeableConcept', 'path'=>'Animal.breed', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/animal-breeds'}},
        'genderStatus' => {'valid_codes'=>{'http://hl7.org/fhir/animal-genderstatus'=>['neutered', 'intact', 'unknown']}, 'type'=>'CodeableConcept', 'path'=>'Animal.genderStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/animal-genderstatus'}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :species           # 1-1 CodeableConcept
      attr_accessor :breed             # 0-1 CodeableConcept
      attr_accessor :genderStatus      # 0-1 CodeableConcept
    end

    class Communication < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Communication.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Communication.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Communication.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'CodeableConcept', 'path'=>'Communication.language', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
        'preferred' => {'type'=>'boolean', 'path'=>'Communication.preferred', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :language          # 1-1 CodeableConcept
      attr_accessor :preferred         # 0-1 boolean
    end

    class Link < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Link.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Link.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Link.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'other' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Link.other', 'min'=>1, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/link-type'=>['replaced-by', 'replaces', 'refer', 'seealso']}, 'type'=>'code', 'path'=>'Link.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/link-type'}}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :other             # 1-1 Reference(Patient|RelatedPerson)
      attr_accessor :type              # 1-1 code
    end

    attr_accessor :id                   # 0-1 id
    attr_accessor :meta                 # 0-1 Meta
    attr_accessor :implicitRules        # 0-1 uri
    attr_accessor :language             # 0-1 code
    attr_accessor :text                 # 0-1 Narrative
    attr_accessor :contained            # 0-* [ Resource ]
    attr_accessor :extension            # 0-* [ Extension ]
    attr_accessor :modifierExtension    # 0-* [ Extension ]
    attr_accessor :identifier           # 0-* [ Identifier ]
    attr_accessor :active               # 0-1 boolean
    attr_accessor :name                 # 0-* [ HumanName ]
    attr_accessor :telecom              # 0-* [ ContactPoint ]
    attr_accessor :gender               # 0-1 code
    attr_accessor :birthDate            # 0-1 date
    attr_accessor :deceasedBoolean      # 0-1 boolean
    attr_accessor :deceasedDateTime     # 0-1 dateTime
    attr_accessor :address              # 0-* [ Address ]
    attr_accessor :maritalStatus        # 0-1 CodeableConcept
    attr_accessor :multipleBirthBoolean # 0-1 boolean
    attr_accessor :multipleBirthInteger # 0-1 integer
    attr_accessor :photo                # 0-* [ Attachment ]
    attr_accessor :contact              # 0-* [ Patient::Contact ]
    attr_accessor :animal               # 0-1 Patient::Animal
    attr_accessor :communication        # 0-* [ Patient::Communication ]
    attr_accessor :generalPractitioner  # 0-* [ Reference(Organization|Practitioner) ]
    attr_accessor :managingOrganization # 0-1 Reference(Organization)
    attr_accessor :link                 # 0-* [ Patient::Link ]

    def resourceType
      'Patient'
    end
  end
end