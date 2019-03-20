module FHIR
  module STU3
    class MedicationDispense < FHIR::STU3::Model
      include FHIR::STU3::Hashable
      include FHIR::STU3::Json
      include FHIR::STU3::Xml

      MULTIPLE_TYPES = {
        'medication' => ['CodeableConcept', 'Reference'],
        'notDoneReason' => ['CodeableConcept', 'Reference']
      }
      SEARCH_PARAMS = ['code', 'identifier', 'medication', 'patient', 'prescription', 'status', 'context', 'destination', 'performer', 'receiver', 'responsibleparty', 'subject', 'type', 'whenhandedover', 'whenprepared']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'MedicationDispense.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'MedicationDispense.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'MedicationDispense.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hi', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'MedicationDispense.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'MedicationDispense.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'MedicationDispense.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'MedicationDispense.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicationDispense.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'MedicationDispense.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Procedure'], 'type'=>'Reference', 'path'=>'MedicationDispense.partOf', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/medication-dispense-status'=>['preparation', 'in-progress', 'on-hold', 'completed', 'entered-in-error', 'stopped']}, 'type'=>'code', 'path'=>'MedicationDispense.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/medication-dispense-status'}},
        'category' => {'valid_codes'=>{'http://hl7.org/fhir/medication-dispense-category'=>['inpatient', 'outpatient', 'community']}, 'type'=>'CodeableConcept', 'path'=>'MedicationDispense.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/medication-dispense-category'}},
        'medicationCodeableConcept' => {'valid_codes'=>{'http://snomed.info/sct'=>['261000', '336001', '363000', '519005', '585007', '693002', '698006', '699003', '747006', '873008', '925002', '1018001', '1025008', '1057009', '1091008', '1171004', '1190007', '1244009', '1269009', '1325004', '1336006', '1355006', '1368003', '1381005', '1450002', '1476002', '1536005', '1575001', '1603001', '1668008', '1914001', '1944003', '1956002', '1971003', '2029004', '2125008', '2195004', '2197007', '2201007', '2212007', '2215009', '2249001', '2264001', '2346005', '2537003', '2660003', '2680002', '2796008', '2799001', '2869004', '2878005', '2927004', '2958003', '2964005', '2991007', '2995003', '3031003', '3066001', '3087006', '3136005', '3142009', '3145006', '3209002', '3212004', '3225007', '3342004', '3378009', '3379001', '3501003', '3592004', '3597005', '3617004', '3672002', '3693004', '3793006', '3823007', '3829006', '3874004', '3906002', '3932008', '3941003', '3945007', '3983008', '4014000', '4025009', '4043008', '4076007', '4188007', '4203009', '4334005', '4353000', '4355007', '4413004', '4423008', '4480008', '4518006', '4616002', '4681002', '4700006', '4780009', '4814001', '4844003', '5007006', '5142007', '5167005', '5172001', '5220000', '5312000', '5405008', '5477001', '5641004', '5647000', '5657004', '5681006', '5691000', '5699003', '5739006', '5767002', '5774007', '5907009', '5955009', '6054001', '6088007', '6162007', '6237004', '6260007', '6333002', '6394006', '6495008', '6513000', '6524003', '6602005', '6612003', '6710000', '6717002', '6790004', '6809003', '6826009', '6837005', '6865007', '6873003', '6881002', '6910009', '6927001', '6952004', '6992002', '7034005', '7084003', '7156005', '7179006', '7302008', '7318002', '7328006', '7348004', '7451005', '7509000', '7515000', '7549008', '7608003', '7737009', '7770004', '7774008', '7816005', '7834009', '7904003', '7975001', '8030004', '8143001', '8202008', '8203003', '8222007', '8252004', '8397006', '8450009', '8534003', '8631001', '8689007', '8701002', '8767001', '8886003', '8919000', '8987006', '9174005', '9234005', '9271007', '9396007', '9457002', '9471005', '9530002', '9532005', '9539001', '9643009', '9663002', '9676008', '9680003', '9721008', '9765000', '9797000', '9817005', '9910008', '9974009', '9992001', '10016008', '10020007', '10109009', '10133003', '10174003', '10192006', '10202007', '10240005', '10270000', '10282009', '10324005', '10329000', '10333007', '10342000', '10354000', '10377000', '10424009', '10466005', '10471003', '10500003', '10534002', '10595003', '10644005', '10660009', '10682002', '10730008', '10750007', '10751006', '10767000', '10782005', '10790005', '10843002', '10955007', '11036001', '11038000', '11115001', '11121002', '11137008', '11170003', '11202003', '11331001', '11345007', '11420005', '11473005', '11496005', '11504003', '11633008', '11644000', '11652002', '11714005', '11943009', '11984007', '11986009', '12009000', '12034000', '12177002', '12208001', '12218006', '12290003', '12315006', '12391001', '12525000', '12568004', '12578001', '12597001', '12689001', '12716009', '12801003', '12821002', '12870003', '12930006', '12970004', '13030002', '13150000', '13188003', '13235001', '13342004', '13502005', '13585009', '13668001', '13708006', '13787003', '13789000', '14013006', '14071002', '14146003', '14172007', '14193005', '14285000', '14312008', '14321009', '14340003', '14349002', '14399003', '14409006', '14438009', '14443002', '14461006', '14507006', '14638000', '14645000', '14715007', '14743003', '14767006', '14796007', '14819006', '14903000', '14905007', '15009009', '15017001', '15098005', '15129007', '15322006', '15331006', '15352003', '15505005', '15571002', '15660006', '15698006', '15730005', '15785009', '15810003', '15895007', '15901005', '16106007', '16125005', '16130009', '16214005', '16257000', '16276003', '16318005', '16355005', '16359004', '16392005', '16395007', '16462002', '16477005', '16492006', '16613008', '16624005', '16628008', '16670003', '16683002', '16717002', '16744007', '16745008', '16748005', '16808006', '16826009', '16915004', '16923002', '16946000', '17008002', '17062003', '17072000', '17117004', '17147002', '17212003', '17240008', '17243005', '17244004', '17356001', '17614005', '17731005', '17777001', '17798001', '17836006', '17916009', '17932007', '17942009', '17990002', '17991003', '18017000', '18039003', '18143001', '18220004', '18288009', '18321003', '18394004', '18414002', '18449009', '18462008', '18535002', '18550006', '18600008', '18616005', '18712002', '18815007', '18832006', '18852007', '18959002', '18970009', '19012003', '19041007', '19046002', '19114000', '19126005', '19163001', '19205004', '19421007', '19427006', '19462001', '19499001', '19510001', '19524002', '19595005', '19622008', '19839007', '19893005', '19918001', '19967004', '19978007', '20056006', '20170008', '20217007', '20229003', '20231007', '20238001', '20327004', '20340009', '20368008', '20378006', '20379003', '20413008', '20450009', '20468007', '20495002', '20686000', '20752000', '20771003', '20844009', '20847002', '20887007', '21028006', '21066009', '21075006', '21094001', '21168008', '21175009', '21235009', '21246007', '21289006', '21303006', '21373005', '21394008', '21518006', '21556007', '21559000', '21566004', '21568003', '21572004', '21611007', '21614004', '21706000', '21891005', '21903000', '21919007', '22038003', '22086005', '22165008', '22236007', '22242006', '22250002', '22362000', '22424004', '22453003', '22496008', '22606007', '22635004', '22654004', '22769006', '22779008', '22790003', '22792006', '22827004', '22840009', '22882008', '22941009', '22976006', '23053002', '23068001', '23077008', '23176001', '23295004', '23375008', '23433006', '23459009', '23564005', '23692005', '23701001', '23814005', '23816007', '23861006', '23862004', '23866001', '23883005', '23959001', '23969007', '24022008', '24202000', '24237002', '24261009', '24336008', '24357000', '24434007', '24435008', '24556008', '24570008', '24583009', '24650007', '24686008', '24721007', '24751001', '24809001', '24823004', '24838003', '24869004', '25002001', '25013003', '25027008', '25128000', '25141001', '25183006', '25204006', '25205007', '25213008', '25217009', '25254000', '25305005', '25307002', '25401000', '25500001', '25525005', '25538002', '25571003', '25607008', '25620006', '25710007', '25747007', '25796002', '25886000', '25911004', '26120001', '26191006', '26277008', '26288002', '26327007', '26346008', '26351002', '26371006', '26379008', '26437003', '26469007', '26518005', '26656004', '26817007', '26945002', '26992003', '27054007', '27079005', '27081007', '27082000', '27122000', '27184001', '27192005', '27244000', '27248002', '27345002', '27361000', '27499006', '27586005', '27594003', '27656005', '27730007', '27736001', '27766008', '27822002', '27928002', '27931001', '27989007', '28021008', '28029005', '28069006', '28121005', '28223003', '28268006', '28344001', '28421003', '28464005', '28521000', '28580002', '28588009', '28662003', '28702005', '28825003', '28829009', '28927005', '28942008', '28983006', '28999000', '29011006', '29184007', '29190006', '29301006', '29327006', '29406002', '29522004', '29527005', '29531004', '29584000', '29588002', '29666006', '29671004', '29725000', '29765001', '29783009', '29876006', '30034004', '30053009', '30094001', '30145004', '30178006', '30179003', '30203009', '30205002', '30236005', '30324001', '30325000', '30326004', '30329006', '30333004', '30424002', '30589007', '30658004', '30676006', '30745005', '30804005', '30820000', '30827002', '30848000', '30863002', '30990007', '31011004', '31055005', '31147000', '31178001', '31422009', '31522006', '31617001', '31622001', '31662002', '31706007', '31707003', '31731008', '31780003', '31787000', '31799007', '31801005', '31815007', '31818009', '31827005', '31895006', '31936008', '31990000', '32050003', '32083005', '32120008', '32133002', '32154009', '32157002', '32281001', '32370002', '32436002', '32437006', '32498003', '32505007', '32519007', '32707001', '32714004', '32757009', '32789000', '32800009', '32824001', '32836007', '32852005', '32898006', '32901007', '33280006', '33307008', '33396006', '33435008', '33440000', '33447002', '33535006', '33619005', '33635003', '33642003', '33667000', '33752008', '33837008', '33922005', '33963004', '34007009', '34070005', '34074001', '34086003', '34113002', '34120009', '34198005', '34211007', '34239008', '34274009', '34332002', '34425005', '34471003', '34654009', '34657002', '34658007', '34737006', '34915005', '34919004', '34953000', '34983009', '35060001', '35135004', '35150008', '35236008', '35257000', '35281007', '35318005', '35321007', '35343004', '35431001', '35466004', '35473009', '35605007', '35733004', '35748005', '35765001', '35864006', '35883004', '35903003', '35946000', '35954003', '35966009', '35976007', '36020009', '36021008', '36022001', '36136008', '36167005', '36173006', '36176003', '36235004', '36378007', '36380001', '36516003', '36541005', '36651003', '36661005', '36712003', '36872003', '36887008', '36953002', '37006008', '37013008', '37077000', '37078005', '37123002', '37225000', '37237003', '37262003', '37276002', '37352007', '37365003', '37411004', '37433002', '37451001', '37527009', '37648000', '37656002', '37691005', '37716005', '37751002', '37756007', '37758008', '37765000', '37951005', '37957009', '37978007', '37986007', '37994000', '38044001', '38122009', '38218009', '38245005', '38344006', '38399002', '38408002', '38543004', '38595007', '38622005', '38623000', '38648002', '38686006', '38714005', '38794009', '38909000', '38914001', '38937007', '39012008', '39044007', '39123009', '39152007', '39263003', '39292004', '39294003', '39428005', '39514001', '39546001', '39552000', '39808001', '39815009', '39933002', '39962001', '39972003', '39973008', '39979007', '40036000', '40115000', '40342009', '40404004', '40438007', '40534007', '40545005', '40601003', '40699008', '40710000', '40789008', '40924008', '40937006', '40940006', '41062004', '41067005', '41091001', '41143004', '41153003', '41199001', '41261002', '41332001', '41395001', '41410009', '41433005', '41464007', '41485007', '41492002', '41503000', '41509001', '41573001', '41592004', '41598000', '41722006', '41793006', '41834005', '41903005', '41945007', '41989007', '42033003', '42056007', '42145009', '42146005', '42159002', '42163009', '42180008', '42193003', '42212002', '42230009', '42319009', '42382009', '42464005', '42520004', '42549007', '42605004', '42671007', '42692007', '42710006', '42730005', '42761001', '42841002', '42877009', '43004008', '43032004', '43048003', '43136004', '43171004', '43239002', '43289005', '43332008', '43356007', '43440003', '43462003', '43538006', '43541002', '43585000', '43592005', '43597004', '43613009', '43621003', '43688007', '43698001', '43706004', '43784004', '43835003', '43848004', '43880002', '43897008', '43909000', '43989002', '44044007', '44068004', '44159003', '44234001', '44262008', '44293009', '44330008', '44347009', '44469001', '44508008', '44520000', '44555003', '44588005', '44603007', '44609006', '44624002', '44644008', '44681007', '44711006', '44776005', '44908000', '45084007', '45119009', '45158004', '45159007', '45207006', '45266004', '45483006', '45524001', '45555007', '45604009', '45754009', '45807004', '45940009', '45946003', '45960001', '46015007', '46021006', '46058006', '46097003', '46122001', '46134009', '46146008', '46191004', '46201000', '46225008', '46250006', '46257009', '46293006', '46492003', '46514003', '46558003', '46572007', '46654009', '46668002', '46711008', '46749007', '46861006', '46887006', '46921009', '46943001', '46950002', '47026005', '47176005', '47180000', '47192000', '47218005', '47247003', '47280005', '47336007', '47349002', '47350002', '47355007', '47383009', '47389008', '47408003', '47413004', '47414005', '47500008', '47663000']}, 'type'=>'CodeableConcept', 'path'=>'MedicationDispense.medication[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/medication-codes'}},
        'medicationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication'], 'type'=>'Reference', 'path'=>'MedicationDispense.medication[x]', 'min'=>1, 'max'=>1},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'MedicationDispense.subject', 'min'=>0, 'max'=>1},
        'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'MedicationDispense.context', 'min'=>0, 'max'=>1},
        'supportingInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'MedicationDispense.supportingInformation', 'min'=>0, 'max'=>Float::INFINITY},
        'performer' => {'type'=>'MedicationDispense::Performer', 'path'=>'MedicationDispense.performer', 'min'=>0, 'max'=>Float::INFINITY},
        'authorizingPrescription' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationRequest'], 'type'=>'Reference', 'path'=>'MedicationDispense.authorizingPrescription', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActCode'=>['DF', 'EM', 'SO', 'FF', 'FFC', 'FFP', 'FFSS', 'TF', 'FS', 'MS', 'RF', 'UD', 'RFC', 'RFCS', 'RFF', 'RFFS', 'RFP', 'RFPS', 'RFS', 'TB', 'TBS', 'UDE']}, 'type'=>'CodeableConcept', 'path'=>'MedicationDispense.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ActPharmacySupplyType'}},
        'quantity' => {'type'=>'Quantity', 'path'=>'MedicationDispense.quantity', 'min'=>0, 'max'=>1},
        'daysSupply' => {'type'=>'Quantity', 'path'=>'MedicationDispense.daysSupply', 'min'=>0, 'max'=>1},
        'whenPrepared' => {'type'=>'dateTime', 'path'=>'MedicationDispense.whenPrepared', 'min'=>0, 'max'=>1},
        'whenHandedOver' => {'type'=>'dateTime', 'path'=>'MedicationDispense.whenHandedOver', 'min'=>0, 'max'=>1},
        'destination' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'MedicationDispense.destination', 'min'=>0, 'max'=>1},
        'receiver' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'MedicationDispense.receiver', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'MedicationDispense.note', 'min'=>0, 'max'=>Float::INFINITY},
        'dosageInstruction' => {'type'=>'Dosage', 'path'=>'MedicationDispense.dosageInstruction', 'min'=>0, 'max'=>Float::INFINITY},
        'substitution' => {'type'=>'MedicationDispense::Substitution', 'path'=>'MedicationDispense.substitution', 'min'=>0, 'max'=>1},
        'detectedIssue' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DetectedIssue'], 'type'=>'Reference', 'path'=>'MedicationDispense.detectedIssue', 'min'=>0, 'max'=>Float::INFINITY},
        'notDone' => {'type'=>'boolean', 'path'=>'MedicationDispense.notDone', 'min'=>0, 'max'=>1},
        'notDoneReasonCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'MedicationDispense.notDoneReason[x]', 'min'=>0, 'max'=>1},
        'notDoneReasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DetectedIssue'], 'type'=>'Reference', 'path'=>'MedicationDispense.notDoneReason[x]', 'min'=>0, 'max'=>1},
        'eventHistory' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Provenance'], 'type'=>'Reference', 'path'=>'MedicationDispense.eventHistory', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Performer < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Performer.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Performer.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Performer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Performer.actor', 'min'=>1, 'max'=>1},
          'onBehalfOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Performer.onBehalfOf', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :actor             # 1-1 Reference(Practitioner|Organization|Patient|Device|RelatedPerson)
        attr_accessor :onBehalfOf        # 0-1 Reference(Organization)
      end

      class Substitution < FHIR::STU3::Model
        include FHIR::STU3::Hashable
        include FHIR::STU3::Json
        include FHIR::STU3::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Substitution.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Substitution.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Substitution.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'wasSubstituted' => {'type'=>'boolean', 'path'=>'Substitution.wasSubstituted', 'min'=>1, 'max'=>1},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/v3/substanceAdminSubstitution'=>['E', 'EC', 'BC', 'G', 'TE', 'TB', 'TG', 'F', 'N']}, 'type'=>'CodeableConcept', 'path'=>'Substitution.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ActSubstanceAdminSubstitutionCode'}},
          'reason' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['CT', 'FP', 'OS', 'RR']}, 'type'=>'CodeableConcept', 'path'=>'Substitution.reason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-SubstanceAdminSubstitutionReason'}},
          'responsibleParty' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Substitution.responsibleParty', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :wasSubstituted    # 1-1 boolean
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :reason            # 0-* [ CodeableConcept ]
        attr_accessor :responsibleParty  # 0-* [ Reference(Practitioner) ]
      end

      attr_accessor :id                           # 0-1 id
      attr_accessor :meta                         # 0-1 Meta
      attr_accessor :implicitRules                # 0-1 uri
      attr_accessor :language                     # 0-1 code
      attr_accessor :text                         # 0-1 Narrative
      attr_accessor :contained                    # 0-* [ Resource ]
      attr_accessor :extension                    # 0-* [ Extension ]
      attr_accessor :modifierExtension            # 0-* [ Extension ]
      attr_accessor :identifier                   # 0-* [ Identifier ]
      attr_accessor :partOf                       # 0-* [ Reference(Procedure) ]
      attr_accessor :status                       # 0-1 code
      attr_accessor :category                     # 0-1 CodeableConcept
      attr_accessor :medicationCodeableConcept    # 1-1 CodeableConcept
      attr_accessor :medicationReference          # 1-1 Reference(Medication)
      attr_accessor :subject                      # 0-1 Reference(Patient|Group)
      attr_accessor :context                      # 0-1 Reference(Encounter|EpisodeOfCare)
      attr_accessor :supportingInformation        # 0-* [ Reference(Resource) ]
      attr_accessor :performer                    # 0-* [ MedicationDispense::Performer ]
      attr_accessor :authorizingPrescription      # 0-* [ Reference(MedicationRequest) ]
      attr_accessor :type                         # 0-1 CodeableConcept
      attr_accessor :quantity                     # 0-1 Quantity
      attr_accessor :daysSupply                   # 0-1 Quantity
      attr_accessor :whenPrepared                 # 0-1 dateTime
      attr_accessor :whenHandedOver               # 0-1 dateTime
      attr_accessor :destination                  # 0-1 Reference(Location)
      attr_accessor :receiver                     # 0-* [ Reference(Patient|Practitioner) ]
      attr_accessor :note                         # 0-* [ Annotation ]
      attr_accessor :dosageInstruction            # 0-* [ Dosage ]
      attr_accessor :substitution                 # 0-1 MedicationDispense::Substitution
      attr_accessor :detectedIssue                # 0-* [ Reference(DetectedIssue) ]
      attr_accessor :notDone                      # 0-1 boolean
      attr_accessor :notDoneReasonCodeableConcept # 0-1 CodeableConcept
      attr_accessor :notDoneReasonReference       # 0-1 Reference(DetectedIssue)
      attr_accessor :eventHistory                 # 0-* [ Reference(Provenance) ]

      def resourceType
        'MedicationDispense'
      end
    end
  end
end