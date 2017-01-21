RSpec.describe 'FHIR::Model' do
  describe '#is_data_type?(datatype, value)' do
    subject { FHIR::StructureDefinition.new({}) }

    describe "datatype='integer'" do
      let(:datatype) { 'integer' }

      context 'returns true when' do
        let(:result) { true }
        specify "value='0'" do
          expect(subject.is_data_type?(datatype, '0')).to be result
        end
        specify 'value= -1' do
          expect(subject.is_data_type?(datatype, -1)).to be result
        end
        specify 'value= 1' do
          expect(subject.is_data_type?(datatype, 1)).to be result
        end
        specify "value= '0'" do
          expect(subject.is_data_type?(datatype, '0')).to be result
        end
        specify "value= '-1'" do
          expect(subject.is_data_type?(datatype, '-1')).to be result
        end
        specify "value= '1'" do
          expect(subject.is_data_type?(datatype, '1')).to be result
        end
      end

      context 'returns false when' do
        let(:result) { false }
        specify "value= '1.0'" do
          expect(subject.is_data_type?(datatype, '1.0')).to be result
        end
        specify "value= '+1'" do
          pending('+1 does not match the specification regex for FHIR <= 1.8.0, but is a valid ruby integer')
          expect(subject.is_data_type?(datatype, '+1')).to be result
        end
        specify "value= 'non-numeric-string'" do
          expect(subject.is_data_type?(datatype, 'non-numeric-string')).to be result
        end
        specify "value= 'string with trailing 123'" do
          expect(subject.is_data_type?(datatype, 'string with trailing 123')).to be result
        end
        specify "value= '123 string with leading number'" do
          expect(subject.is_data_type?(datatype, '123 string with leading number')).to be result
        end
        specify 'value= nil' do
          expect(subject.is_data_type?(datatype, nil)).to be result
        end
        specify "value= '1.5'" do
          expect(subject.is_data_type?(datatype, '1.5')).to be result
        end
        specify 'value= 1.5' do
          expect(subject.is_data_type?(datatype, 1.5)).to be result
        end
      end
    end

    describe "datatype: 'unsignedint'" do
      let(:datatype) { 'unsignedint' }
      context 'returns true when' do
        let(:result) { true }
        specify 'value= 0' do
          expect(subject.is_data_type?(datatype, 0)).to be result
        end
        specify 'value= 1' do
          expect(subject.is_data_type?(datatype, 1)).to be result
        end
        specify "value= '0'" do
          expect(subject.is_data_type?(datatype, '0')).to be result
        end
        specify "value= '1'" do
          expect(subject.is_data_type?(datatype, '1')).to be result
        end
      end
      context 'returns false when' do
        let(:result) { false }
        specify "value= '1.0'" do
          expect(subject.is_data_type?(datatype, '1.0')).to be result
        end
        specify "value= '+1'" do
          pending('+1 does not match the specification regex for FHIR <= 1.8.0, but is a valid ruby integer')
          expect(subject.is_data_type?(datatype, '+1')).to be result
        end
        specify 'value= -1' do
          expect(subject.is_data_type?(datatype, -1)).to be result
        end
        specify "value= '-1'" do
          expect(subject.is_data_type?(datatype, '-1')).to be result
        end
        specify "value= 'non-numeric-string'" do
          expect(subject.is_data_type?(datatype, 'non-numeric-string')).to be result
        end
        specify "value= 'string with trailing 123'" do
          expect(subject.is_data_type?(datatype, 'string with trailing 123')).to be result
        end
        specify "value= '123 string with leading number'" do
          expect(subject.is_data_type?(datatype, '123 string with leading number')).to be result
        end
        specify 'value= nil' do
          expect(subject.is_data_type?(datatype, nil)).to be result
        end
        specify "value= '1.5'" do
          expect(subject.is_data_type?(datatype, '1.5')).to be result
        end
        specify 'value= 1.5' do
          expect(subject.is_data_type?(datatype, 1.5)).to be result
        end
      end
    end

    describe "datatype: 'positiveint'" do
      let(:datatype) { 'positiveint' }
      context 'returns true when' do
        let(:result) { true }
        specify 'value= 1' do
          expect(subject.is_data_type?(datatype, 1)).to be result
        end
        specify "value= '1'" do
          expect(subject.is_data_type?(datatype, '1')).to be result
        end
      end
      context 'returns false when' do
        let(:result) { false }
        specify "value= '0'" do
          expect(subject.is_data_type?(datatype, '0')).to be result
        end
        specify 'value= 0' do
          expect(subject.is_data_type?(datatype, 0)).to be result
        end
        specify "value= '1.0'" do
          expect(subject.is_data_type?(datatype, '1.0')).to be result
        end
        specify "value= '+1'" do
          pending('+1 does not match the specification regex for FHIR, but is a valid ruby integer')
          expect(subject.is_data_type?(datatype, '+1')).to be result
        end
        specify 'value= -1' do
          expect(subject.is_data_type?(datatype, -1)).to be result
        end
        specify "value= '-1'" do
          expect(subject.is_data_type?(datatype, '-1')).to be result
        end
        specify "value= 'non-numeric-string'" do
          expect(subject.is_data_type?(datatype, 'non-numeric-string')).to be result
        end
        specify "value= 'string with trailing 123'" do
          expect(subject.is_data_type?(datatype, 'string with trailing 123')).to be result
        end
        specify "value= '123 string with leading number'" do
          expect(subject.is_data_type?(datatype, '123 string with leading number')).to be result
        end
        specify 'value= nil' do
          expect(subject.is_data_type?(datatype, nil)).to be result
        end
        specify "value= '1.5'" do
          expect(subject.is_data_type?(datatype, '1.5')).to be result
        end
        specify 'value= 1.5' do
          expect(subject.is_data_type?(datatype, 1.5)).to be result
        end
      end
    end

    describe "datatype: 'decimal'" do
      let(:datatype) { 'decimal' }
      context 'returns true when' do
        let(:result) { true }
        specify 'value= 1' do
          expect(subject.is_data_type?(datatype, 1)).to be result
        end
        specify "value= '1'" do
          expect(subject.is_data_type?(datatype, '1')).to be result
        end
        specify "value= '+1'" do
          expect(subject.is_data_type?(datatype, '+1')).to be result
        end
        specify "value= '0'" do
          expect(subject.is_data_type?(datatype, '0')).to be result
        end
        specify 'value= 0' do
          expect(subject.is_data_type?(datatype, 0)).to be result
        end
        specify "value= '1.0'" do
          expect(subject.is_data_type?(datatype, '1.0')).to be result
        end
        specify 'value= -1' do
          expect(subject.is_data_type?(datatype, -1)).to be result
        end
        specify "value= '-1'" do
          expect(subject.is_data_type?(datatype, '-1')).to be result
        end
        specify "value= '1.5'" do
          expect(subject.is_data_type?(datatype, '1.5')).to be result
        end
        specify 'value= 1.5' do
          expect(subject.is_data_type?(datatype, 1.5)).to be result
        end
      end

      context 'returns false when' do
        let(:result) { false }
        specify "value= 'non-numeric-string'" do
          expect(subject.is_data_type?(datatype, 'non-numeric-string')).to be result
        end
        specify "value= 'string with trailing 123'" do
          expect(subject.is_data_type?(datatype, 'string with trailing 123')).to be result
        end
        specify "value= '123 string with leading number'" do
          expect(subject.is_data_type?(datatype, '123 string with leading number')).to be result
        end
        specify 'value= nil' do
          expect(subject.is_data_type?(datatype, nil)).to be result
        end
        specify "value= '001'" do
          pending('FHIR standard forbids leading zeros')
          expect(subject.is_data_type?(datatype, '001')).to be result
        end
        specify "value= '1E3'" do
          pending('FHIR standard forbids exponents (<=1.8.0)')
          expect(subject.is_data_type?(datatype, '1E3')).to be result
        end
      end
    end
  end
end
