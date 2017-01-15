describe 'FHIR::Model' do

  describe '#is_primitive?' do

    subject { FHIR::Patient.new({}) }

    example 'integers' do
      expect(subject.is_primitive?('integer', 0)).to be_true
    end
  end


end
