RSpec.describe 'FHIR::Model' do
  describe '#is_primitive?(datatype, value)' do
    subject { FHIR::Patient.new({}) }

    describe "datatype 'integer'" do
      let(:datatype) { 'integer' }
      context 'is true when' do
        it 'value= 0' do
          expect(subject.is_primitive?(datatype, 0)).to be true
        end
        it 'value= -1' do
          expect(subject.is_primitive?(datatype, -1)).to be true
        end
        it 'value= 1' do
          expect(subject.is_primitive?(datatype, 1)).to be true
        end
        it "value= '0'" do
          expect(subject.is_primitive?(datatype, '0')).to be true
        end
        it "value= '-1'" do
          expect(subject.is_primitive?(datatype, '-1')).to be true
        end
        it "value= '1'" do
          expect(subject.is_primitive?(datatype, '1')).to be true
        end
      end
      context 'is false when' do
        it "value= '1.0'" do
          expect(subject.is_primitive?(datatype, '1.0')).to be false
        end
        it "value= '+1'" do
          pending('+1 does not match the specification regex for FHIR <= 1.8.0, but is a valid ruby integer')
          expect(subject.is_primitive?(datatype, '+1')).to be false
        end
        it "value= 'non-numeric-string'" do
          expect(subject.is_primitive?(datatype, 'non-numeric-string')).to be false
        end
        it "value= 'string with trailing 123'" do
          expect(subject.is_primitive?(datatype, 'string with trailing 123')).to be false
        end
        it "value= '123 string with leading number'" do
          expect(subject.is_primitive?(datatype, '123 string with leading number')).to be false
        end
        it 'value= nil' do
          expect(subject.is_primitive?(datatype, nil)).to be false
        end
        it "value= '1.5'" do
          expect(subject.is_primitive?(datatype, '1.5')).to be false
        end
        it 'value= 1.5' do
          expect(subject.is_primitive?(datatype, 1.5)).to be false
        end
      end
    end

    describe "datatype: 'unsignedint'" do
      let(:datatype) { 'unsignedint' }
      context 'is true when' do
        it 'value= 0' do
          expect(subject.is_primitive?(datatype, 0)).to be true
        end
        it 'value= 1' do
          expect(subject.is_primitive?(datatype, 1)).to be true
        end
        it "value= '0'" do
          expect(subject.is_primitive?(datatype, '0')).to be true
        end
        it "value= '1'" do
          expect(subject.is_primitive?(datatype, '1')).to be true
        end
      end
      context 'is false when' do
        it "value= '1.0'" do
          expect(subject.is_primitive?(datatype, '1.0')).to be false
        end
        it "value= '+1'" do
          pending('+1 does not match the specification regex for FHIR <= 1.8.0, but is a valid ruby integer')
          expect(subject.is_primitive?(datatype, '+1')).to be false
        end
        it 'value= -1' do
          expect(subject.is_primitive?(datatype, -1)).to be false
        end
        it "value= '-1'" do
          expect(subject.is_primitive?(datatype, '-1')).to be false
        end
        it "value= 'non-numeric-string'" do
          expect(subject.is_primitive?(datatype, 'non-numeric-string')).to be false
        end
        it "value= 'string with trailing 123'" do
          expect(subject.is_primitive?(datatype, 'string with trailing 123')).to be false
        end
        it "value= '123 string with leading number'" do
          expect(subject.is_primitive?(datatype, '123 string with leading number')).to be false
        end
        it 'value= nil' do
          expect(subject.is_primitive?(datatype, nil)).to be false
        end
        it "value= '1.5'" do
          expect(subject.is_primitive?(datatype, '1.5')).to be false
        end
        it 'value= 1.5' do
          expect(subject.is_primitive?(datatype, 1.5)).to be false
        end
      end
    end

    describe "datatype: 'positiveint'" do
      let(:datatype) { 'positiveint' }
      context 'is true when' do
        it 'value= 1' do
          expect(subject.is_primitive?(datatype, 1)).to be true
        end
        it "value= '1'" do
          expect(subject.is_primitive?(datatype, '1')).to be true
        end
      end
      context 'is false when' do
        it "value= '0'" do
          expect(subject.is_primitive?(datatype, '0')).to be false
        end
        it 'value= 0' do
          expect(subject.is_primitive?(datatype, 0)).to be false
        end
        it "value= '1.0'" do
          expect(subject.is_primitive?(datatype, '1.0')).to be false
        end
        it "value= '+1'" do
          pending('+1 does not match the specification regex for FHIR <= 1.8.0, but is a valid ruby integer')
          expect(subject.is_primitive?(datatype, '+1')).to be false
        end
        it 'value= -1' do
          expect(subject.is_primitive?(datatype, -1)).to be false
        end
        it "value= '-1'" do
          expect(subject.is_primitive?(datatype, '-1')).to be false
        end
        it "value= 'non-numeric-string'" do
          expect(subject.is_primitive?(datatype, 'non-numeric-string')).to be false
        end
        it "value= 'string with trailing 123'" do
          expect(subject.is_primitive?(datatype, 'string with trailing 123')).to be false
        end
        it "value= '123 string with leading number'" do
          expect(subject.is_primitive?(datatype, '123 string with leading number')).to be false
        end
        it 'value= nil' do
          expect(subject.is_primitive?(datatype, nil)).to be false
        end
        it "value= '1.5'" do
          expect(subject.is_primitive?(datatype, '1.5')).to be false
        end
        it 'value= 1.5' do
          expect(subject.is_primitive?(datatype, 1.5)).to be false
        end
      end
    end

    describe "datatype: 'decimal'" do
      let(:datatype) { 'decimal' }
      context 'is true when' do
        it 'value= 1' do
          expect(subject.is_primitive?(datatype, 1)).to be true
        end
        it "value= '1'" do
          expect(subject.is_primitive?(datatype, '1')).to be true
        end
        it "value= '+1'" do
          expect(subject.is_primitive?(datatype, '+1')).to be true
        end
        it "value= '0'" do
          expect(subject.is_primitive?(datatype, '0')).to be true
        end
        it 'value= 0' do
          expect(subject.is_primitive?(datatype, 0)).to be true
        end
        it "value= '1.0'" do
          expect(subject.is_primitive?(datatype, '1.0')).to be true
        end
        it 'value= -1' do
          expect(subject.is_primitive?(datatype, -1)).to be true
        end
        it "value= '-1'" do
          expect(subject.is_primitive?(datatype, '-1')).to be true
        end
        it "value= '1.5'" do
          expect(subject.is_primitive?(datatype, '1.5')).to be true
        end
        it 'value= 1.5' do
          expect(subject.is_primitive?(datatype, 1.5)).to be true
        end
      end
      context 'is false when' do
        it "value= 'non-numeric-string'" do
          expect(subject.is_primitive?(datatype, 'non-numeric-string')).to be false
        end
        it "value= 'string with trailing 123'" do
          expect(subject.is_primitive?(datatype, 'string with trailing 123')).to be false
        end
        it "value= '123 string with leading number'" do
          expect(subject.is_primitive?(datatype, '123 string with leading number')).to be false
        end
        it 'value= nil' do
          expect(subject.is_primitive?(datatype, nil)).to be false
        end
        it "value= '001'" do
          pending('FHIR standard forbids leading zeros (<=1.8.0)')
          expect(subject.is_primitive?(datatype, '001')).to be false
        end
        it "value= '1E3'" do
          pending('FHIR standard forbids exponents (<=1.8.0)')
          expect(subject.is_primitive?(datatype, '1E3')).to be false
        end
      end
    end
  end
end
