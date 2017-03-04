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
          expect(subject.primitive?(datatype: datatype, value: '001')).to be result
        end
        specify "value= '1E3'" do
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

    describe 'datatype: date' do
      let(:datatype) { 'date' }

      context 'returns true when' do
        let(:result) { true }
        specify "value='2017-02-28'" do
          expect(subject.primitive?(datatype: datatype, value: '2017-02-28')).to be result
        end
        specify "value='2017-02'" do
          expect(subject.primitive?(datatype: datatype, value: '2017-02')).to be result
        end
        specify "value='2017'" do
          expect(subject.primitive?(datatype: datatype, value: '2017')).to be result
        end
        specify 'value=Date.new(2017,2,28)' do
          expect(subject.primitive?(datatype: datatype, value: Date.new(2017, 2, 28))).to be result
        end
      end

      context 'returns false when' do
        let(:result) { false }
        specify "value='2017-02-29'" do
          pending("dates are not validated because we don't support partial dates")
          expect(subject.primitive?(datatype: datatype, value: '2017-02-29')).to be result
        end
        specify "value='02-29'" do
          expect(subject.primitive?(datatype: datatype, value: '02-29')).to be result
        end
      end
    end

    describe 'datatype: datetime' do
      let(:datatype) { 'datetime' }

      context 'returns true when' do
        let(:result) { true }
        specify "value='2017-02-28'" do
          expect(subject.primitive?(datatype: datatype, value: '2017-02-28')).to be result
        end
        specify "value='2017-02'" do
          expect(subject.primitive?(datatype: datatype, value: '2017-02')).to be result
        end
        specify "value='2017'" do
          expect(subject.primitive?(datatype: datatype, value: '2017')).to be result
        end
        specify "value='2017-02-28T05:00:00Z'" do
          expect(subject.primitive?(datatype: datatype, value: '2017-02-28T05:00:00Z')).to be result
        end
        specify 'value=DateTime.new(2017,2,28,12)' do
          expect(subject.primitive?(datatype: datatype, value: DateTime.new(2017, 2, 28, 12))).to be result
        end
      end

      context 'returns false when' do
        let(:result) { false }
        specify "value='2017-02-29'" do
          pending("datetimes are not validated because we don't support partial dates")
          expect(subject.primitive?(datatype: datatype, value: '2017-02-29')).to be result
        end
        specify "value='02-29'" do
          expect(subject.primitive?(datatype: datatype, value: '02-29')).to be result
        end
        specify "value='2017-01-01 24:00'" do
          expect(subject.primitive?(datatype: datatype, value: '2017-01-01 24:00')).to be result
        end
        specify "value='2017-01-01T24:00Z'" do
          expect(subject.primitive?(datatype: datatype, value: '2017-01-01T24:00Z')).to be result
        end
      end
    end

    describe 'datatype: time' do
      let(:datatype) { 'time' }

      context 'returns true when' do
        let(:result) { true }
        specify "value='05:00:00'" do
          expect(subject.primitive?(datatype: datatype, value: '05:00:00')).to be result
        end
      end

      context 'returns false when' do
        let(:result) { false }
        specify "value='2017-02-29'" do
          expect(subject.primitive?(datatype: datatype, value: '2017-02-29')).to be result
        end
        specify "value='02-29'" do
          expect(subject.primitive?(datatype: datatype, value: '02-29')).to be result
        end
        specify "value='2017-01-01 24:00'" do
          expect(subject.primitive?(datatype: datatype, value: '2017-01-01 24:00')).to be result
        end
        specify "value='2017-01-01T24:00Z'" do
          expect(subject.primitive?(datatype: datatype, value: '2017-01-01T24:00Z')).to be result
        end
        specify "value='5:00'" do
          expect(subject.primitive?(datatype: datatype, value: '5:00')).to be result
        end
        specify "value='24:00'" do
          expect(subject.primitive?(datatype: datatype, value: '24:00')).to be result
        end
      end
    end

    describe 'datatype: oid' do
      let(:datatype) { 'oid' }

      context 'returns true when' do
        let(:result) { true }
        specify "value='urn:oid:1.2.3.4'" do
          expect(subject.primitive?(datatype: datatype, value: 'urn:oid:1.2.3.4')).to be result
        end
      end

      context 'returns false when' do
        let(:result) { false }
        specify "value='1.2.3.4'" do
          expect(subject.primitive?(datatype: datatype, value: '1.2.3.4')).to be result
        end
      end
    end

    describe 'datatype: id' do
      let(:datatype) { 'id' }

      context 'returns true when' do
        let(:result) { true }
        specify "value='1234567890-abcdefghijklmnopqrstuvwxyz.ABCDEFGHIJKLMNOPQRSTUVWXYZ'" do
          expect(subject.primitive?(datatype: datatype, value: '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')).to be result
        end
      end

      context 'returns false when' do
        let(:result) { false }
        specify "value='the quick brown fox jumped over the lazy dog' (whitespace not allowed)" do
          expect(subject.primitive?(datatype: datatype, value: 'the quick brown fox jumped over the lazy dog')).to be result
        end
        specify 'value=65 characters (too long)' do
          expect(subject.primitive?(datatype: datatype, value: 'A' * 65)).to be result
        end
      end
    end

    describe 'datatype: code' do
      let(:datatype) { 'code' }

      context 'returns true when' do
        let(:result) { true }
        specify "value='a string with only single spaces'" do
          expect(subject.primitive?(datatype: datatype, value: 'a string with only single spaces')).to be result
        end
        specify "value='a' (single character)" do
          expect(subject.primitive?(datatype: datatype, value: 'a')).to be result
        end
      end

      context 'returns false when' do
        let(:result) { false }
        specify "value=' leading whitespace'" do
          expect(subject.primitive?(datatype: datatype, value: ' leading whitespace')).to be result
        end
        specify "value='trailing whitespace '" do
          expect(subject.primitive?(datatype: datatype, value: 'trailing whitespace ')).to be result
        end
        specify "value='multiple  spaces'" do
          expect(subject.primitive?(datatype: datatype, value: 'multiple  whitespace')).to be result
        end
        specify "value='' (empty string)" do
          expect(subject.primitive?(datatype: datatype, value: '')).to be result
        end

      end
    end

  end
end
