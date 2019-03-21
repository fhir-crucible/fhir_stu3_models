describe FHIR::STU3::Definitions do
  context '.load_extensions'

  context '.get_display' do
    let(:code) { '306005' }
    let(:uri) { 'http://snomed.info/sct' }

    it 'returns nil without valid parameters' do
      expect(FHIR::STU3::Definitions.get_display(nil, nil)).to eq nil
      expect(FHIR::STU3::Definitions.get_display(nil, code)).to eq nil
      expect(FHIR::STU3::Definitions.get_display(uri, nil)).to eq nil
    end

    context 'matching expansions' do
      it 'returns a matching expansion.contains value' do
        expect(FHIR::STU3::Definitions.get_display(uri, code)).to eq 'Echography of kidney'
      end
    end

    context 'matching valuesets' do
      it 'returns a matching concept.code value' do
        uri = 'http://healthit.gov/nhin/purposeofuse'
        code = 'TREATMENT'
        expect(FHIR::STU3::Definitions.get_display(uri, code)).to eq 'Treatment'
      end

      it 'returns a matching compose.include value' do
        uri = 'http://hl7.org/fhir/ValueSet/example-extensional'
        code = '14647-2'
        expect(FHIR::STU3::Definitions.get_display(uri, code)).to eq 'Cholesterol [Moles/Volume]'
      end
    end
  end
end
