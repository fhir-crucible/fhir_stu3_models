describe FHIR::Definitions do
  context '.load_extensions'

  context '.get_display' do
    let(:code) { '306005' }
    let(:uri) { 'http://snomed.info/sct' }

    it 'returns nil without valid parameters' do
      expect(FHIR::Definitions.get_display(nil, nil)).to eq nil
      expect(FHIR::Definitions.get_display(nil, code)).to eq nil
      expect(FHIR::Definitions.get_display(uri, nil)).to eq nil
    end

    context 'matching expansions' do
      it 'returns a matching expansion.contains value' do
        expect(FHIR::Definitions.get_display(uri, code)).to eq 'Echography of kidney'
      end
    end

    context 'matching valuesets' do
      let(:uri) { 'http://healthit.gov/nhin/purposeofuse' }
      let(:code) { 'TREATMENT' }

      it 'returns a matching concept.code value' do
        expect(FHIR::Definitions.get_display(uri, code)).to eq 'Treatment'
      end
    end
  end
end
