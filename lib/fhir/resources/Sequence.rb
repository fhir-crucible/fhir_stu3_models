module FHIR
  class Sequence < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["chromosome", "end", "patient", "species", "start", "type"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Sequence.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Sequence.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Sequence.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Sequence.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://tools.ietf.org/html/bcp47'}},
      'text' => {'type'=>'Narrative', 'path'=>'Sequence.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Sequence.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Sequence.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Sequence.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/sequence-type'=>['AA', 'DNA', 'RNA']}, 'type'=>'code', 'path'=>'Sequence.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/sequence-type'}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Sequence.patient', 'min'=>0, 'max'=>1},
      'specimen' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Specimen'], 'type'=>'Reference', 'path'=>'Sequence.specimen', 'min'=>0, 'max'=>1},
      'device' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Sequence.device', 'min'=>0, 'max'=>1},
      'quantity' => {'type'=>'Quantity', 'path'=>'Sequence.quantity', 'min'=>0, 'max'=>1},
      'species' => {'type'=>'CodeableConcept', 'path'=>'Sequence.species', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/sequence-species'}},
      'referenceSeq' => {'type'=>'Sequence::Referenceseq', 'path'=>'Sequence.referenceSeq', 'min'=>0, 'max'=>Float::INFINITY},
      'variation' => {'type'=>'Sequence::Variation', 'path'=>'Sequence.variation', 'min'=>0, 'max'=>1},
      'quality' => {'type'=>'Sequence::Quality', 'path'=>'Sequence.quality', 'min'=>0, 'max'=>Float::INFINITY},
      'allelicState' => {'valid_codes'=>{'http://hl7.org/fhir/LOINC-53034-5-answerlist'=>['LA6703-8', 'LA6704-6', 'LA6705-3', 'LA6706-1', 'LA6707-9']}, 'type'=>'CodeableConcept', 'path'=>'Sequence.allelicState', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/LOINC-53034-5-answerlist'}},
      'allelicFrequency' => {'type'=>'decimal', 'path'=>'Sequence.allelicFrequency', 'min'=>0, 'max'=>1},
      'copyNumberEvent' => {'valid_codes'=>{'http://hl7.org/fhir/copy-number-event'=>['amp', 'del', 'lof']}, 'type'=>'CodeableConcept', 'path'=>'Sequence.copyNumberEvent', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/copy-number-event'}},
      'readCoverage' => {'type'=>'integer', 'path'=>'Sequence.readCoverage', 'min'=>0, 'max'=>1},
      'repository' => {'type'=>'Sequence::Repository', 'path'=>'Sequence.repository', 'min'=>0, 'max'=>Float::INFINITY},
      'pointer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Sequence'], 'type'=>'Reference', 'path'=>'Sequence.pointer', 'min'=>0, 'max'=>Float::INFINITY},
      'observedSeq' => {'type'=>'string', 'path'=>'Sequence.observedSeq', 'min'=>0, 'max'=>1},
      'observation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'Sequence.observation', 'min'=>0, 'max'=>1},
      'structureVariation' => {'type'=>'Sequence::Structurevariation', 'path'=>'Sequence.structureVariation', 'min'=>0, 'max'=>1}
    }

    class Referenceseq < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Referenceseq.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Referenceseq.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Referenceseq.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'chromosome' => {'valid_codes'=>{'http://hl7.org/fhir/chromosome-human'=>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', 'X', 'Y']}, 'type'=>'CodeableConcept', 'path'=>'Referenceseq.chromosome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/chromosome-human'}},
        'genomeBuild' => {'type'=>'string', 'path'=>'Referenceseq.genomeBuild', 'min'=>0, 'max'=>1},
        'referenceSeqId' => {'type'=>'CodeableConcept', 'path'=>'Referenceseq.referenceSeqId', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/sequence-referenceSeq'}},
        'referenceSeqPointer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Sequence'], 'type'=>'Reference', 'path'=>'Referenceseq.referenceSeqPointer', 'min'=>0, 'max'=>1},
        'referenceSeqString' => {'type'=>'string', 'path'=>'Referenceseq.referenceSeqString', 'min'=>0, 'max'=>1},
        'windowStart' => {'type'=>'integer', 'path'=>'Referenceseq.windowStart', 'min'=>1, 'max'=>1},
        'windowEnd' => {'type'=>'integer', 'path'=>'Referenceseq.windowEnd', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                  # 0-1 id
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :chromosome          # 0-1 CodeableConcept
      attr_accessor :genomeBuild         # 0-1 string
      attr_accessor :referenceSeqId      # 1-1 CodeableConcept
      attr_accessor :referenceSeqPointer # 0-1 Reference(Sequence)
      attr_accessor :referenceSeqString  # 0-1 string
      attr_accessor :windowStart         # 1-1 integer
      attr_accessor :windowEnd           # 1-1 integer
    end

    class Variation < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Variation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Variation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Variation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'start' => {'type'=>'integer', 'path'=>'Variation.start', 'min'=>0, 'max'=>1},
        'end' => {'type'=>'integer', 'path'=>'Variation.end', 'min'=>0, 'max'=>1},
        'observedAllele' => {'type'=>'string', 'path'=>'Variation.observedAllele', 'min'=>0, 'max'=>1},
        'referenceAllele' => {'type'=>'string', 'path'=>'Variation.referenceAllele', 'min'=>0, 'max'=>1},
        'cigar' => {'type'=>'string', 'path'=>'Variation.cigar', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :start             # 0-1 integer
      attr_accessor :end               # 0-1 integer
      attr_accessor :observedAllele    # 0-1 string
      attr_accessor :referenceAllele   # 0-1 string
      attr_accessor :cigar             # 0-1 string
    end

    class Quality < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Quality.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Quality.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Quality.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'start' => {'type'=>'integer', 'path'=>'Quality.start', 'min'=>0, 'max'=>1},
        'end' => {'type'=>'integer', 'path'=>'Quality.end', 'min'=>0, 'max'=>1},
        'score' => {'type'=>'Quantity', 'path'=>'Quality.score', 'min'=>0, 'max'=>1},
        'method' => {'local_name'=>'local_method', 'type'=>'string', 'path'=>'Quality.method', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :start             # 0-1 integer
      attr_accessor :end               # 0-1 integer
      attr_accessor :score             # 0-1 Quantity
      attr_accessor :local_method      # 0-1 string
    end

    class Repository < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Repository.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Repository.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Repository.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'Repository.url', 'min'=>0, 'max'=>1},
        'name' => {'type'=>'string', 'path'=>'Repository.name', 'min'=>0, 'max'=>1},
        'variantId' => {'type'=>'string', 'path'=>'Repository.variantId', 'min'=>0, 'max'=>1},
        'readId' => {'type'=>'string', 'path'=>'Repository.readId', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :url               # 0-1 uri
      attr_accessor :name              # 0-1 string
      attr_accessor :variantId         # 0-1 string
      attr_accessor :readId            # 0-1 string
    end

    class Structurevariation < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Structurevariation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Structurevariation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Structurevariation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'precisionOfBoundaries' => {'type'=>'string', 'path'=>'Structurevariation.precisionOfBoundaries', 'min'=>0, 'max'=>1},
        'reportedaCGHRatio' => {'type'=>'decimal', 'path'=>'Structurevariation.reportedaCGHRatio', 'min'=>0, 'max'=>1},
        'length' => {'type'=>'integer', 'path'=>'Structurevariation.length', 'min'=>0, 'max'=>1},
        'outer' => {'type'=>'Sequence::Structurevariation::Outer', 'path'=>'Structurevariation.outer', 'min'=>0, 'max'=>1},
        'inner' => {'type'=>'Sequence::Structurevariation::Inner', 'path'=>'Structurevariation.inner', 'min'=>0, 'max'=>1}
      }

      class Outer < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Outer.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Outer.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Outer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'start' => {'type'=>'integer', 'path'=>'Outer.start', 'min'=>0, 'max'=>1},
          'end' => {'type'=>'integer', 'path'=>'Outer.end', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :start             # 0-1 integer
        attr_accessor :end               # 0-1 integer
      end

      class Inner < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'id', 'path'=>'Inner.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Inner.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Inner.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'start' => {'type'=>'integer', 'path'=>'Inner.start', 'min'=>0, 'max'=>1},
          'end' => {'type'=>'integer', 'path'=>'Inner.end', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 id
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :start             # 0-1 integer
        attr_accessor :end               # 0-1 integer
      end

      attr_accessor :id                    # 0-1 id
      attr_accessor :extension             # 0-* [ Extension ]
      attr_accessor :modifierExtension     # 0-* [ Extension ]
      attr_accessor :precisionOfBoundaries # 0-1 string
      attr_accessor :reportedaCGHRatio     # 0-1 decimal
      attr_accessor :length                # 0-1 integer
      attr_accessor :outer                 # 0-1 Sequence::Structurevariation::Outer
      attr_accessor :inner                 # 0-1 Sequence::Structurevariation::Inner
    end

    attr_accessor :id                 # 0-1 id
    attr_accessor :meta               # 0-1 Meta
    attr_accessor :implicitRules      # 0-1 uri
    attr_accessor :language           # 0-1 code
    attr_accessor :text               # 0-1 Narrative
    attr_accessor :contained          # 0-* [ Resource ]
    attr_accessor :extension          # 0-* [ Extension ]
    attr_accessor :modifierExtension  # 0-* [ Extension ]
    attr_accessor :type               # 1-1 code
    attr_accessor :patient            # 0-1 Reference(Patient)
    attr_accessor :specimen           # 0-1 Reference(Specimen)
    attr_accessor :device             # 0-1 Reference(Device)
    attr_accessor :quantity           # 0-1 Quantity
    attr_accessor :species            # 0-1 CodeableConcept
    attr_accessor :referenceSeq       # 0-* [ Sequence::Referenceseq ]
    attr_accessor :variation          # 0-1 Sequence::Variation
    attr_accessor :quality            # 0-* [ Sequence::Quality ]
    attr_accessor :allelicState       # 0-1 CodeableConcept
    attr_accessor :allelicFrequency   # 0-1 decimal
    attr_accessor :copyNumberEvent    # 0-1 CodeableConcept
    attr_accessor :readCoverage       # 0-1 integer
    attr_accessor :repository         # 0-* [ Sequence::Repository ]
    attr_accessor :pointer            # 0-* [ Reference(Sequence) ]
    attr_accessor :observedSeq        # 0-1 string
    attr_accessor :observation        # 0-1 Reference(Observation)
    attr_accessor :structureVariation # 0-1 Sequence::Structurevariation

    def resourceType
      'Sequence'
    end
  end
end