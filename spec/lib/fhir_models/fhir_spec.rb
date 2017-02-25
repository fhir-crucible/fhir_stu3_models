RSpec.describe 'FHIR' do
  describe '#primitive?(datatype: datatype, value: value)' do
    subject { FHIR }

    describe "datatype 'integer'" do
      let(:datatype) { 'integer' }

      context 'returns true when' do
        let(:result) { true }
        specify 'value= 0' do
          expect(subject.primitive?(datatype: datatype, value: 0)).to be result
        end
        specify 'value= -1' do
          expect(subject.primitive?(datatype: datatype, value: -1)).to be result
        end
        specify 'value= 1' do
          expect(subject.primitive?(datatype: datatype, value: 1)).to be result
        end
        specify "value= '0'" do
          expect(subject.primitive?(datatype: datatype, value: '0')).to be result
        end
        specify "value= '-1'" do
          expect(subject.primitive?(datatype: datatype, value: '-1')).to be result
        end
        specify "value= '1'" do
          expect(subject.primitive?(datatype: datatype, value: '1')).to be result
        end
      end

      context 'returns false when' do
        let(:result) { false }
        specify "value= '1.0'" do
          expect(subject.primitive?(datatype: datatype, value: '1.0')).to be result
        end
        specify "value= '+1'" do
          pending('+1 does not match the specification regex for FHIR <= 1.8.0, but is a valid ruby integer')
          expect(subject.primitive?(datatype: datatype, value: '+1')).to be result
        end
        specify "value= 'non-numeric-string'" do
          expect(subject.primitive?(datatype: datatype, value: 'non-numeric-string')).to be result
        end
        specify "value= 'string with trailing 123'" do
          expect(subject.primitive?(datatype: datatype, value: 'string with trailing 123')).to be result
        end
        specify "value= '123 string with leading number'" do
          expect(subject.primitive?(datatype: datatype, value: '123 string with leading number')).to be result
        end
        specify 'value= nil' do
          expect(subject.primitive?(datatype: datatype, value: nil)).to be result
        end
        specify "value= '1.5'" do
          expect(subject.primitive?(datatype: datatype, value: '1.5')).to be result
        end
        specify 'value= 1.5' do
          expect(subject.primitive?(datatype: datatype, value: 1.5)).to be result
        end
      end
    end

    describe "datatype: 'unsignedint'" do
      let(:datatype) { 'unsignedint' }
      context 'returns true when' do
        let(:result) { true }
        specify 'value= 0' do
          expect(subject.primitive?(datatype: datatype, value: 0)).to be result
        end
        specify 'value= 1' do
          expect(subject.primitive?(datatype: datatype, value: 1)).to be result
        end
        specify "value= '0'" do
          expect(subject.primitive?(datatype: datatype, value: '0')).to be result
        end
        specify "value= '1'" do
          expect(subject.primitive?(datatype: datatype, value: '1')).to be result
        end
      end
      context 'returns false when' do
        let(:result) { false }
        specify "value= '1.0'" do
          expect(subject.primitive?(datatype: datatype, value: '1.0')).to be result
        end
        specify "value= '+1'" do
          pending('+1 does not match the specification regex for FHIR <= 1.8.0, but is a valid ruby integer')
          expect(subject.primitive?(datatype: datatype, value: '+1')).to be result
        end
        specify 'value= -1' do
          expect(subject.primitive?(datatype: datatype, value: -1)).to be result
        end
        specify "value= '-1'" do
          expect(subject.primitive?(datatype: datatype, value: '-1')).to be result
        end
        specify "value= 'non-numeric-string'" do
          expect(subject.primitive?(datatype: datatype, value: 'non-numeric-string')).to be result
        end
        specify "value= 'string with trailing 123'" do
          expect(subject.primitive?(datatype: datatype, value: 'string with trailing 123')).to be result
        end
        specify "value= '123 string with leading number'" do
          expect(subject.primitive?(datatype: datatype, value: '123 string with leading number')).to be result
        end
        specify 'value= nil' do
          expect(subject.primitive?(datatype: datatype, value: nil)).to be result
        end
        specify "value= '1.5'" do
          expect(subject.primitive?(datatype: datatype, value: '1.5')).to be result
        end
        specify 'value= 1.5' do
          expect(subject.primitive?(datatype: datatype, value: 1.5)).to be result
        end
      end
    end

    describe "datatype: 'positiveint'" do
      let(:datatype) { 'positiveint' }
      context 'returns true when' do
        let(:result) { true }
        specify 'value= 1' do
          expect(subject.primitive?(datatype: datatype, value: 1)).to be result
        end
        specify "value= '1'" do
          expect(subject.primitive?(datatype: datatype, value: '1')).to be result
        end
      end
      context 'returns false when' do
        let(:result) { false }
        specify "value= '0'" do
          expect(subject.primitive?(datatype: datatype, value: '0')).to be result
        end
        specify 'value= 0' do
          expect(subject.primitive?(datatype: datatype, value: 0)).to be result
        end
        specify "value= '1.0'" do
          expect(subject.primitive?(datatype: datatype, value: '1.0')).to be result
        end
        specify "value= '+1'" do
          pending('+1 does not match the specification regex for FHIR <= 1.8.0, but is a valid ruby integer')
          expect(subject.primitive?(datatype: datatype, value: '+1')).to be result
        end
        specify 'value= -1' do
          expect(subject.primitive?(datatype: datatype, value: -1)).to be result
        end
        specify "value= '-1'" do
          expect(subject.primitive?(datatype: datatype, value: '-1')).to be result
        end
        specify "value= 'non-numeric-string'" do
          expect(subject.primitive?(datatype: datatype, value: 'non-numeric-string')).to be result
        end
        specify "value= 'string with trailing 123'" do
          expect(subject.primitive?(datatype: datatype, value: 'string with trailing 123')).to be result
        end
        specify "value= '123 string with leading number'" do
          expect(subject.primitive?(datatype: datatype, value: '123 string with leading number')).to be result
        end
        specify 'value= nil' do
          expect(subject.primitive?(datatype: datatype, value: nil)).to be result
        end
        specify "value= '1.5'" do
          expect(subject.primitive?(datatype: datatype, value: '1.5')).to be result
        end
        specify 'value= 1.5' do
          expect(subject.primitive?(datatype: datatype, value: 1.5)).to be result
        end
      end
    end

    describe "datatype: 'decimal'" do
      let(:datatype) { 'decimal' }
      context 'returns true when' do
        let(:result) { true }
        specify 'value= 1' do
          expect(subject.primitive?(datatype: datatype, value: 1)).to be result
        end
        specify "value= '1'" do
          expect(subject.primitive?(datatype: datatype, value: '1')).to be result
        end
        specify "value= '+1'" do
          expect(subject.primitive?(datatype: datatype, value: '+1')).to be result
        end
        specify "value= '0'" do
          expect(subject.primitive?(datatype: datatype, value: '0')).to be result
        end
        specify 'value= 0' do
          expect(subject.primitive?(datatype: datatype, value: 0)).to be result
        end
        specify "value= '1.0'" do
          expect(subject.primitive?(datatype: datatype, value: '1.0')).to be result
        end
        specify 'value= -1' do
          expect(subject.primitive?(datatype: datatype, value: -1)).to be result
        end
        specify "value= '-1'" do
          expect(subject.primitive?(datatype: datatype, value: '-1')).to be result
        end
        specify "value= '1.5'" do
          expect(subject.primitive?(datatype: datatype, value: '1.5')).to be result
        end
        specify 'value= 1.5' do
          expect(subject.primitive?(datatype: datatype, value: 1.5)).to be result
        end
      end
      context 'returns false when' do
        let(:result) { false }
        specify "value= 'non-numeric-string'" do
          expect(subject.primitive?(datatype: datatype, value: 'non-numeric-string')).to be result
        end
        specify "value= 'string with trailing 123'" do
          expect(subject.primitive?(datatype: datatype, value: 'string with trailing 123')).to be result
        end
        specify "value= '123 string with leading number'" do
          expect(subject.primitive?(datatype: datatype, value: '123 string with leading number')).to be result
        end
        specify 'value= nil' do
          expect(subject.primitive?(datatype: datatype, value: nil)).to be result
        end
        specify "value= '001'" do
          pending('FHIR standard forbids leading zeros (<=1.8.0)')
          expect(subject.primitive?(datatype: datatype, value: '001')).to be result
        end
        specify "value= '1E3'" do
          pending('FHIR standard forbids exponents (<=1.8.0)')
          expect(subject.primitive?(datatype: datatype, value: '1E3')).to be result
        end
      end
    end

    describe "datatype: 'base64binary'" do
      let(:datatype) { 'base64binary' }

      context 'returns true when' do
        let(:result) { true }

        # https://tools.ietf.org/html/rfc4648#section-10
        specify "value = ''" do
          expect(subject.primitive?(datatype: datatype, value: '')).to be result
        end
        specify "value= 'Zg=='" do
          expect(subject.primitive?(datatype: datatype, value: 'Zg==')).to be result
        end
        specify "value= 'Zm8='" do
          expect(subject.primitive?(datatype: datatype, value: 'Zm8=')).to be result
        end
        specify "value= 'Zm9v'" do
          expect(subject.primitive?(datatype: datatype, value: 'Zm9v')).to be result
        end
        specify "value= 'Zm9vYg=='" do
          expect(subject.primitive?(datatype: datatype, value: 'Zm9vYg==')).to be result
        end
        specify "value= 'Zm9vYmE='" do
          expect(subject.primitive?(datatype: datatype, value: 'Zm9vYmE=')).to be result
        end
        specify "value= 'Zm9vYmFy'" do
          expect(subject.primitive?(datatype: datatype, value: 'Zm9vYmFy')).to be result
        end
      end

      context 'returns false when' do
        let(:result) { false }
        specify "value= 'a string containing special characters like !@\#{$%^&}'" do
          expect(subject.primitive?(datatype: datatype, value: 'a string containing special characters like !@\#{$%^&}')).to be result
        end
        specify "value= 'Zm9vYmF' (a string that is not a multiple of 4 characters long)" do
          expect(subject.primitive?(datatype: datatype, value: 'Zm9vYmF')).to be result
        end
      end
    end
  end
end
