module FHIR
  class Sequence < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['chromosome', 'end', 'identifier', 'patient', 'start', 'type']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Sequence.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Sequence.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Sequence.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Sequence.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Sequence.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Sequence.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Sequence.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Sequence.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Sequence.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/sequence-type'=>['AA', 'DNA', 'RNA', 'AA', 'DNA', 'RNA']}, 'type'=>'code', 'path'=>'Sequence.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/sequence-type'}},
      'coordinateSystem' => {'type'=>'integer', 'path'=>'Sequence.coordinateSystem', 'min'=>1, 'max'=>1},
      'patient' => {'type'=>'Reference', 'path'=>'Sequence.patient', 'min'=>0, 'max'=>1},
      'specimen' => {'type'=>'Reference', 'path'=>'Sequence.specimen', 'min'=>0, 'max'=>1},
      'device' => {'type'=>'Reference', 'path'=>'Sequence.device', 'min'=>0, 'max'=>1},
      'performer' => {'type'=>'Reference', 'path'=>'Sequence.performer', 'min'=>0, 'max'=>1},
      'quantity' => {'type'=>'Quantity', 'path'=>'Sequence.quantity', 'min'=>0, 'max'=>1},
      'referenceSeq' => {'type'=>'Sequence::ReferenceSeq', 'path'=>'Sequence.referenceSeq', 'min'=>0, 'max'=>1},
      'variant' => {'type'=>'Sequence::Variant', 'path'=>'Sequence.variant', 'min'=>0, 'max'=>Float::INFINITY},
      'observedSeq' => {'type'=>'string', 'path'=>'Sequence.observedSeq', 'min'=>0, 'max'=>1},
      'quality' => {'type'=>'Sequence::Quality', 'path'=>'Sequence.quality', 'min'=>0, 'max'=>Float::INFINITY},
      'readCoverage' => {'type'=>'integer', 'path'=>'Sequence.readCoverage', 'min'=>0, 'max'=>1},
      'repository' => {'type'=>'Sequence::Repository', 'path'=>'Sequence.repository', 'min'=>0, 'max'=>Float::INFINITY},
      'pointer' => {'type'=>'Reference', 'path'=>'Sequence.pointer', 'min'=>0, 'max'=>Float::INFINITY},
      'structureVariant' => {'type'=>'Sequence::StructureVariant', 'path'=>'Sequence.structureVariant', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class ReferenceSeq < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'ReferenceSeq.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'ReferenceSeq.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ReferenceSeq.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'chromosome' => {'valid_codes'=>{'http://hl7.org/fhir/chromosome-human'=>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', 'X', 'Y', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', 'X', 'Y']}, 'type'=>'CodeableConcept', 'path'=>'ReferenceSeq.chromosome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/chromosome-human'}},
        'genomeBuild' => {'type'=>'string', 'path'=>'ReferenceSeq.genomeBuild', 'min'=>0, 'max'=>1},
        'referenceSeqId' => {'type'=>'CodeableConcept', 'path'=>'ReferenceSeq.referenceSeqId', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/sequence-referenceSeq'}},
        'referenceSeqPointer' => {'type'=>'Reference', 'path'=>'ReferenceSeq.referenceSeqPointer', 'min'=>0, 'max'=>1},
        'referenceSeqString' => {'type'=>'string', 'path'=>'ReferenceSeq.referenceSeqString', 'min'=>0, 'max'=>1},
        'strand' => {'type'=>'integer', 'path'=>'ReferenceSeq.strand', 'min'=>0, 'max'=>1},
        'windowStart' => {'type'=>'integer', 'path'=>'ReferenceSeq.windowStart', 'min'=>1, 'max'=>1},
        'windowEnd' => {'type'=>'integer', 'path'=>'ReferenceSeq.windowEnd', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id                  # 0-1 string
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :chromosome          # 0-1 CodeableConcept
      attr_accessor :genomeBuild         # 0-1 string
      attr_accessor :referenceSeqId      # 0-1 CodeableConcept
      attr_accessor :referenceSeqPointer # 0-1 Reference()
      attr_accessor :referenceSeqString  # 0-1 string
      attr_accessor :strand              # 0-1 integer
      attr_accessor :windowStart         # 1-1 integer
      attr_accessor :windowEnd           # 1-1 integer
    end

    class Variant < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Variant.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Variant.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Variant.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'start' => {'type'=>'integer', 'path'=>'Variant.start', 'min'=>0, 'max'=>1},
        'end' => {'type'=>'integer', 'path'=>'Variant.end', 'min'=>0, 'max'=>1},
        'observedAllele' => {'type'=>'string', 'path'=>'Variant.observedAllele', 'min'=>0, 'max'=>1},
        'referenceAllele' => {'type'=>'string', 'path'=>'Variant.referenceAllele', 'min'=>0, 'max'=>1},
        'cigar' => {'type'=>'string', 'path'=>'Variant.cigar', 'min'=>0, 'max'=>1},
        'variantPointer' => {'type'=>'Reference', 'path'=>'Variant.variantPointer', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :start             # 0-1 integer
      attr_accessor :end               # 0-1 integer
      attr_accessor :observedAllele    # 0-1 string
      attr_accessor :referenceAllele   # 0-1 string
      attr_accessor :cigar             # 0-1 string
      attr_accessor :variantPointer    # 0-1 Reference()
    end

    class Quality < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Quality.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Quality.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Quality.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/quality-type'=>['INDEL', 'SNP', 'UNKNOWN', 'INDEL', 'SNP', 'UNKNOWN']}, 'type'=>'code', 'path'=>'Quality.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/quality-type'}},
        'standardSequence' => {'type'=>'CodeableConcept', 'path'=>'Quality.standardSequence', 'min'=>0, 'max'=>1},
        'start' => {'type'=>'integer', 'path'=>'Quality.start', 'min'=>0, 'max'=>1},
        'end' => {'type'=>'integer', 'path'=>'Quality.end', 'min'=>0, 'max'=>1},
        'score' => {'type'=>'Quantity', 'path'=>'Quality.score', 'min'=>0, 'max'=>1},
        'method' => {'local_name'=>'local_method', 'type'=>'CodeableConcept', 'path'=>'Quality.method', 'min'=>0, 'max'=>1},
        'truthTP' => {'type'=>'decimal', 'path'=>'Quality.truthTP', 'min'=>0, 'max'=>1},
        'queryTP' => {'type'=>'decimal', 'path'=>'Quality.queryTP', 'min'=>0, 'max'=>1},
        'truthFN' => {'type'=>'decimal', 'path'=>'Quality.truthFN', 'min'=>0, 'max'=>1},
        'queryFP' => {'type'=>'decimal', 'path'=>'Quality.queryFP', 'min'=>0, 'max'=>1},
        'gtFP' => {'type'=>'decimal', 'path'=>'Quality.gtFP', 'min'=>0, 'max'=>1},
        'precision' => {'type'=>'decimal', 'path'=>'Quality.precision', 'min'=>0, 'max'=>1},
        'recall' => {'type'=>'decimal', 'path'=>'Quality.recall', 'min'=>0, 'max'=>1},
        'fScore' => {'type'=>'decimal', 'path'=>'Quality.fScore', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 code
      attr_accessor :standardSequence  # 0-1 CodeableConcept
      attr_accessor :start             # 0-1 integer
      attr_accessor :end               # 0-1 integer
      attr_accessor :score             # 0-1 Quantity
      attr_accessor :local_method      # 0-1 CodeableConcept
      attr_accessor :truthTP           # 0-1 decimal
      attr_accessor :queryTP           # 0-1 decimal
      attr_accessor :truthFN           # 0-1 decimal
      attr_accessor :queryFP           # 0-1 decimal
      attr_accessor :gtFP              # 0-1 decimal
      attr_accessor :precision         # 0-1 decimal
      attr_accessor :recall            # 0-1 decimal
      attr_accessor :fScore            # 0-1 decimal
    end

    class Repository < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Repository.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Repository.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Repository.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/repository-type'=>['directlink', 'openapi', 'login', 'oauth', 'other', 'directlink', 'openapi', 'login', 'oauth', 'other']}, 'type'=>'code', 'path'=>'Repository.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/repository-type'}},
        'url' => {'type'=>'uri', 'path'=>'Repository.url', 'min'=>0, 'max'=>1},
        'name' => {'type'=>'string', 'path'=>'Repository.name', 'min'=>0, 'max'=>1},
        'datasetId' => {'type'=>'string', 'path'=>'Repository.datasetId', 'min'=>0, 'max'=>1},
        'variantsetId' => {'type'=>'string', 'path'=>'Repository.variantsetId', 'min'=>0, 'max'=>1},
        'readsetId' => {'type'=>'string', 'path'=>'Repository.readsetId', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 code
      attr_accessor :url               # 0-1 uri
      attr_accessor :name              # 0-1 string
      attr_accessor :datasetId         # 0-1 string
      attr_accessor :variantsetId      # 0-1 string
      attr_accessor :readsetId         # 0-1 string
    end

    class StructureVariant < FHIR::Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      METADATA = {
        'id' => {'type'=>'string', 'path'=>'StructureVariant.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'StructureVariant.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'StructureVariant.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'precisionOfBoundaries' => {'type'=>'string', 'path'=>'StructureVariant.precisionOfBoundaries', 'min'=>0, 'max'=>1},
        'reportedaCGHRatio' => {'type'=>'decimal', 'path'=>'StructureVariant.reportedaCGHRatio', 'min'=>0, 'max'=>1},
        'length' => {'type'=>'integer', 'path'=>'StructureVariant.length', 'min'=>0, 'max'=>1},
        'outer' => {'type'=>'Sequence::StructureVariant::Outer', 'path'=>'StructureVariant.outer', 'min'=>0, 'max'=>1},
        'inner' => {'type'=>'Sequence::StructureVariant::Inner', 'path'=>'StructureVariant.inner', 'min'=>0, 'max'=>1}
      }

      class Outer < FHIR::Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Outer.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Outer.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Outer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'start' => {'type'=>'integer', 'path'=>'Outer.start', 'min'=>0, 'max'=>1},
          'end' => {'type'=>'integer', 'path'=>'Outer.end', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
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
          'id' => {'type'=>'string', 'path'=>'Inner.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Inner.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Inner.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'start' => {'type'=>'integer', 'path'=>'Inner.start', 'min'=>0, 'max'=>1},
          'end' => {'type'=>'integer', 'path'=>'Inner.end', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :start             # 0-1 integer
        attr_accessor :end               # 0-1 integer
      end

      attr_accessor :id                    # 0-1 string
      attr_accessor :extension             # 0-* [ Extension ]
      attr_accessor :modifierExtension     # 0-* [ Extension ]
      attr_accessor :precisionOfBoundaries # 0-1 string
      attr_accessor :reportedaCGHRatio     # 0-1 decimal
      attr_accessor :length                # 0-1 integer
      attr_accessor :outer                 # 0-1 Sequence::StructureVariant::Outer
      attr_accessor :inner                 # 0-1 Sequence::StructureVariant::Inner
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
    attr_accessor :type              # 0-1 code
    attr_accessor :coordinateSystem  # 1-1 integer
    attr_accessor :patient           # 0-1 Reference()
    attr_accessor :specimen          # 0-1 Reference()
    attr_accessor :device            # 0-1 Reference()
    attr_accessor :performer         # 0-1 Reference()
    attr_accessor :quantity          # 0-1 Quantity
    attr_accessor :referenceSeq      # 0-1 Sequence::ReferenceSeq
    attr_accessor :variant           # 0-* [ Sequence::Variant ]
    attr_accessor :observedSeq       # 0-1 string
    attr_accessor :quality           # 0-* [ Sequence::Quality ]
    attr_accessor :readCoverage      # 0-1 integer
    attr_accessor :repository        # 0-* [ Sequence::Repository ]
    attr_accessor :pointer           # 0-* [ Reference() ]
    attr_accessor :structureVariant  # 0-* [ Sequence::StructureVariant ]

    def resourceType
      'Sequence'
    end
  end
end