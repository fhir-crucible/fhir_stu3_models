require_relative '../test_helper'

class ProfileValidationTest < Test::Unit::TestCase
  ERROR_DIR = File.join('tmp', 'errors', 'ProfileValidationTest')
  FIXTURES_DIR = File.join('test', 'fixtures')

  # Cache the US Core IG definitions
  us_core_ig = File.join(FIXTURES_DIR, 'us_core', '*.json')
  PROFILES = {}
  Dir.glob(us_core_ig).each do |definition|
    json = File.read(definition)
    resource = FHIR::STU3.from_contents(json)
    PROFILES[resource.url] = resource
  end

  # Create a blank folder for the errors
  FileUtils.rm_rf(ERROR_DIR) if File.directory?(ERROR_DIR)
  FileUtils.mkdir_p ERROR_DIR

  def validate_each_entry(bundle)
    complete_error_list = []
    bundle.entry.each do |entry|
      if entry.resource.meta
        # validate against the declared profile
        profile = PROFILES[entry.resource.meta.profile.first]
        assert profile, "Failed to find profile: #{entry.resource.meta.profile.first}"
        rerrors = profile.validate_resource(entry.resource)
        complete_error_list << rerrors unless rerrors.empty?
      else
        # validate the base resource
        rerrors = entry.resource.validate
        complete_error_list << rerrors unless rerrors.empty?
      end
    end
    complete_error_list.flatten
  end

  def test_profile_validation
    example_name = 'sample-us-core-record.json'
    patient_record = File.join(FIXTURES_DIR, example_name)
    input_json = File.read(patient_record)
    bundle = FHIR::STU3::Json.from_json(input_json)
    errors = validate_each_entry(bundle)
    unless errors.empty?
      File.open("#{ERROR_DIR}/#{example_name}.err", 'w:UTF-8') { |file| errors.each { |e| file.write("#{e}\n") } }
      File.open("#{ERROR_DIR}/#{example_name}.json", 'w:UTF-8') { |file| file.write(input_json) }
    end
    assert errors.empty?, 'Record failed to validate.'
    # check memory
    before = check_memory
    resource = nil
    profile = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def validate_vital_sign_resource
    example_name = 'sample-us-core-record.json'
    patient_record = File.join(FIXTURES_DIR, example_name)
    input_json = File.read(patient_record)
    bundle = FHIR::STU3::Json.from_json(input_json)

    vitalsign = bundle.entry.find do |entry|
      entry.resource.meta and (entry.resource.meta.profile.first == 'http://hl7.org/fhir/StructureDefinition/vitalsigns')
    end
    assert vitalsign, 'Unable to find vital sign Observation resource'
    profile = PROFILES['http://hl7.org/fhir/StructureDefinition/vitalsigns']
    assert profile, 'Failed to find http://hl7.org/fhir/StructureDefinition/vitalsigns profile'
    profile.validate_resource(vitalsign.resource)
    profile
  end

  def test_profile_code_system_check
    # Clear any registered validators
    FHIR::STU3::StructureDefinition.clear_all_validates_vs
    FHIR::STU3::StructureDefinition.validates_vs "http://hl7.org/fhir/ValueSet/observation-vitalsignresult" do |coding|
      false # fails so that the code system validation happens
    end
    FHIR::STU3::StructureDefinition.validates_vs "http://loinc.org" do |coding|
      false # errors related to code system validation should be present
    end
    profile = validate_vital_sign_resource
    assert profile.errors.empty?, 'Expected no errors.'
    assert profile.warnings.detect{|x| x.start_with?('Observation.code has no codings from http://hl7.org/fhir/ValueSet/observation-vitalsignresult')}
    assert profile.warnings.detect{|x| x.start_with?("Observation.code has no codings from it's specified system: http://loinc.org")}
    # check memory
    before = check_memory
    resource = nil
    profile = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def test_profile_valueset_check
    # Clear any registered validators
    FHIR::STU3::StructureDefinition.clear_all_validates_vs
    FHIR::STU3::StructureDefinition.validates_vs "http://hl7.org/fhir/ValueSet/observation-vitalsignresult" do |coding|
      true # fails so that the code system validation never happens
    end
    FHIR::STU3::StructureDefinition.validates_vs "http://loinc.org" do |coding|
      false # no errors related to code system should be present
    end
    profile = validate_vital_sign_resource
    assert profile.errors.empty?, 'Expected no errors.'
    assert !profile.warnings.detect{|x| x.start_with?('Observation.code has no codings from http://hl7.org/fhir/ValueSet/observation-vitalsignresult')}
    assert !profile.warnings.detect{|x| x.start_with?("Observation.code has no codings from it's specified system: http://loinc.org")}
    # check memory
    before = check_memory
    resource = nil
    profile = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def test_invalid_profile_validation
    example_name = 'invalid-us-core-record.json'
    patient_record = File.join(FIXTURES_DIR, example_name)
    input_json = File.read(patient_record)
    bundle = FHIR::STU3::Json.from_json(input_json)
    errors = validate_each_entry(bundle)
    unless errors
      File.open("#{ERROR_DIR}/#{example_name}.json", 'w:UTF-8') { |file| file.write(input_json) }
    end
    assert !errors.empty?, 'Record improperly validated.'
    assert errors.detect{|x| x.start_with?('Patient.identifier.value failed cardinality test')}
    # check memory
    before = check_memory
    resource = nil
    profile = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def test_profile_validation_resource
    example_name = 'sample-us-core-record.json'
    patient_record = File.join(FIXTURES_DIR, example_name)
    input_json = File.read(patient_record)
    bundle = FHIR::STU3::Json.from_json(input_json)
    definition = FHIR::STU3::Definitions.resource_definition('Bundle')
    assert definition.validates_resource?(bundle), 'Bundle StructureDefinition failed to validate Bundle.'
    # check memory
    before = check_memory
    model = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def test_profile_validation_rejects_bad_resource
    definition = FHIR::STU3::Definitions.resource_definition('Bundle')
    assert !definition.validates_resource?(String.new), 'Bundle StructureDefinition should reject anything that is not a FHIR::STU3::Model.'
    # check memory
    before = check_memory
    model = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def test_profile_with_multiple_extensions
    structure_definition_file = File.join(FIXTURES_DIR, 'custom_profiles', 'StructureDefinition-us-core-patient-modified.json')
    # use a modified version of the core patient profile, that changes certain extensions like race and ethnicity from 0..1 to 1..1
    structure_definition_json = JSON.parse(File.read(structure_definition_file))
    profile = FHIR::STU3::StructureDefinition.new(structure_definition_json)

    example_name = 'sample-us-core-record.json'
    patient_record = File.join(FIXTURES_DIR, example_name)
    input_json = File.read(patient_record)
    bundle = FHIR::STU3::Json.from_json(input_json)
    patient_entry = bundle.entry.find { |e| e.resource.is_a?(FHIR::STU3::Patient) }

    assert_empty profile.validate_resource(patient_entry.resource), 'Record failed to validate against modified core profile.'
    # check memory
    before = check_memory
    bundle = nil
    patient_entry = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def test_language_binding_validation
    binding_strength = FHIR::STU3::Resource::METADATA['language']['binding']['strength']
    FHIR::STU3::Resource::METADATA['language']['binding']['strength'] = 'required'
    model = FHIR::STU3::Resource.new('language' => 'en-US')
    assert model.valid?, 'Language validation failed.'
    FHIR::STU3::Resource::METADATA['language']['binding']['strength'] = binding_strength
    # check memory
    before = check_memory
    model = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def test_cardinality_check
    sd = FHIR::STU3::StructureDefinition.new

    element = FHIR::STU3::ElementDefinition.new('min' => 0, 'max' => '1', 'path' => "test1")
    nodes = []
    sd.errors = []
    sd.send(:verify_cardinality, element, nodes)
    assert_empty(sd.errors)

    nodes = ["one"]
    sd.errors = []
    sd.send(:verify_cardinality, element, nodes)
    assert_empty(sd.errors)

    nodes = [1, 2, 3]
    sd.errors = []    
    sd.verify_cardinality(element, nodes)
    assert_equal("test1 failed cardinality test (0..1) -- found 3", sd.errors[0])

    element = FHIR::STU3::ElementDefinition.new('min' => 1, 'max' => '1', 'path' => "test2")
    nodes = []
    sd.errors = []
    sd.send(:verify_cardinality, element, nodes)
    assert_equal("test2 failed cardinality test (1..1) -- found 0", sd.errors[0])

    nodes = ["one"]
    sd.errors = []
    sd.send(:verify_cardinality, element, nodes)
    assert_empty(sd.errors)

    nodes = [1, 2, 3]
    sd.errors = []    
    sd.send(:verify_cardinality, element, nodes)
    assert_equal("test2 failed cardinality test (1..1) -- found 3", sd.errors[0])

    element = FHIR::STU3::ElementDefinition.new('min' => 2, 'max' => '*', 'path' => "test3")
    nodes = []
    sd.errors = []
    sd.send(:verify_cardinality, element, nodes)
    assert_equal("test3 failed cardinality test (2..Infinity) -- found 0", sd.errors[0])

    nodes = ["one"]
    sd.errors = []
    sd.send(:verify_cardinality, element, nodes)
    assert_equal("test3 failed cardinality test (2..Infinity) -- found 1", sd.errors[0])

    nodes = [1, 2, 3]
    sd.errors = []    
    sd.send(:verify_cardinality, element, nodes)
    assert_empty(sd.errors)
  end

  def test_maximum_string_length_check
    sd = FHIR::STU3::StructureDefinition.new
    sd.warnings = []

    element = FHIR::STU3::ElementDefinition.new('path' => 'string', 'type' => [{ 'code' => 'String' }], 'maxLength' => 4, 'min' => 0, 'max' => '*')
    sd.hierarchy = OpenStruct.new(path: 'x') # just a hack to make this work, wish it was cleaner
    sd.errors = []
    sd.send(:verify_element, element, 'string' => "1234")
    assert_empty(sd.errors)

    sd.errors = []
    sd.send(:verify_element, element, 'string' => "12345")
    assert_equal("string exceed maximum length of 4: 12345", sd.errors[0])

    element = FHIR::STU3::ElementDefinition.new('path' => 'string', 'type' => [{ 'code' => 'String' }], 'min' => 0, 'max' => '*') # no maxlength

    sd.errors = []
    sd.send(:verify_element, element, 'string' => "1234")
    assert_empty(sd.errors)

    sd.errors = []
    long_string = (1..10000).map{ rand(10000).to_s }.join(', ') # somewhere in the range of 60k chars
    sd.send(:verify_element, element, 'string' => long_string)
    assert_empty(sd.errors)
  end

  def test_fixed_value
    sd = FHIR::STU3::StructureDefinition.new
    
    element = FHIR::STU3::ElementDefinition.new('path' => "fixed_value_test") # fixed == nil
    sd.errors = []
    sd.verify_fixed_value(element, nil)
    assert_empty(sd.errors)

    sd.errors = []
    sd.verify_fixed_value(element, "some_other_value_it_doesnt_matter")
    assert_empty(sd.errors)

    element = FHIR::STU3::ElementDefinition.new('path' => "fixed_value_test", 'fixedString' => "string_value")
    sd.errors = []
    sd.verify_fixed_value(element, nil)
    assert_equal("fixed_value_test value of '' did not match fixed value: string_value", sd.errors[0])

    sd.errors = []
    sd.verify_fixed_value(element, "string_value")
    assert_empty(sd.errors)

    sd.errors = []
    sd.verify_fixed_value(element, "some_other_value")
    assert_equal("fixed_value_test value of 'some_other_value' did not match fixed value: string_value", sd.errors[0])

    element = FHIR::STU3::ElementDefinition.new('path' => "fixed_value_test", 'fixedCodeableConcept' => { 'coding' => [{ 'system' => 'http://ncimeta.nci.nih.gov', 'code' => 'C2004062' }] } )
    sd.errors = []
    sd.verify_fixed_value(element, nil)
    assert_equal("fixed_value_test value of '' did not match fixed value: #{element.fixed}", sd.errors[0])
    # these test cases use the string interpolation in because the error message includes the object ID which isn't constant

    sd.errors = []
    sd.verify_fixed_value(element, "some_other_value")
    assert_equal("fixed_value_test value of 'some_other_value' did not match fixed value: #{element.fixed}", sd.errors[0])

    sd.errors = []
    sd.verify_fixed_value(element, FHIR::STU3::CodeableConcept.new('coding' => [{ 'system' => 'http://ncimeta.nci.nih.gov', 'code' => 'C2004062' }]))
    assert_empty(sd.errors)

    sd.errors = []
    value = FHIR::STU3::CodeableConcept.new('coding' => [{ 'system' => 'http://snomed.info/sct', 'code' => 'C2004062' }])
    sd.verify_fixed_value(element, value)
    assert_equal("fixed_value_test value of '#{value}' did not match fixed value: #{element.fixed}", sd.errors[0])
  end

  def test_codeableConcept_pattern
    sd = FHIR::STU3::StructureDefinition.new
    sd.warnings = []

    element = FHIR::STU3::ElementDefinition.new('path' => 'cc', 'type' => [{ 'code' => 'CodeableConcept' }], 'min' => 1, 'max' => '1',
                                          'patternCodeableConcept' => { 'coding' => [{ 'system' => 'http://ncimeta.nci.nih.gov', 'code' => 'C2004062' }] })
    sd.hierarchy = OpenStruct.new(path: 'x') # just a hack to make this work, wish it was cleaner
    sd.errors = []
    sd.send(:verify_element, element, 'cc' => { 'coding' => [{ 'system' => 'http://ncimeta.nci.nih.gov', 'code' => 'C2004062' }] }) # exact match
    assert_empty(sd.errors)

    sd.errors = []
    sd.send(:verify_element, element, 'cc' => { 'coding' => [{ 'system' => 'http://ncimeta.nci.nih.gov', 'code' => 'C2004062' }], 'text' => 'some dummy text' }) # added text
    assert_empty(sd.errors)

    sd.errors = []
    sd.send(:verify_element, element, 'cc' => { 'coding' => [{ 'system' => 'http://ncimeta.nci.nih.gov', 'code' => 'C2004062', 'display' => 'some_value' }] }) # match, with added 'display'
    assert_empty(sd.errors)

    sd.errors = []
    sd.send(:verify_element, element, 'cc' => { 'coding' => [{ 'system' => 'http://ncimeta.nci.nih.gov', 'code' => 'C2222222' }] }) # wrong code
    assert_equal("cc CodeableConcept did not match defined pattern: {\"coding\"=>[{\"system\"=>\"http://ncimeta.nci.nih.gov\", \"code\"=>\"C2004062\"}]}", sd.errors[0])

    sd.errors = []
    sd.send(:verify_element, element, 'cc' => { 'coding' => [{ 'system' => 'http://hl7.org/fhir/sid/icd-10', 'code' => 'Q841' }] }) # completely different
    assert_equal("cc CodeableConcept did not match defined pattern: {\"coding\"=>[{\"system\"=>\"http://ncimeta.nci.nih.gov\", \"code\"=>\"C2004062\"}]}", sd.errors[0])
  end

  def test_invalid_value_per_type
    sd = FHIR::STU3::StructureDefinition.new
    sd.warnings = []
    sd.hierarchy = OpenStruct.new(path: 'x') # just a hack to make this work, wish it was cleaner

    element = FHIR::STU3::ElementDefinition.new('path' => 'vinv', 'type' => [{ 'code' => 'string' }], 'min' => 1, 'max' => '1')
    sd.errors = []
    sd.send(:verify_element, element, 'vinv' => 'string_value')
    assert_empty(sd.errors)

    sd.errors = []
    sd.send(:verify_element, element, 'vinv' => 12345)
    assert_equal("vinv is not a valid string: '12345'", sd.errors[0])
    assert_equal("vinv did not match one of the valid data types: [\"string\"]", sd.errors[1])

    element = FHIR::STU3::ElementDefinition.new('path' => 'vinv', 'type' => [{ 'code' => 'integer' }], 'min' => 1, 'max' => '1')
    sd.errors = []
    sd.send(:verify_element, element, 'vinv' => 12345)
    assert_empty(sd.errors)

    sd.errors = []
    sd.send(:verify_element, element, 'vinv' => 'string_value')
    assert_equal("vinv is not a valid integer: 'string_value'", sd.errors[0])
    assert_equal("vinv did not match one of the valid data types: [\"integer\"]", sd.errors[1])

    element = FHIR::STU3::ElementDefinition.new('path' => 'vinv', 'type' => [{ 'code' => 'Observation' }], 'min' => 1, 'max' => '1')
    sd.errors = []
    sd.send(:verify_element, element, 'vinv' => 'something_that_isnt_an_Observation')
    assert_equal("Unable to verify Observation as a FHIR Resource.", sd.errors[0])
    assert_equal("vinv is not a valid Observation: 'something_that_isnt_an_Observation'", sd.errors[1])
    assert_equal("vinv did not match one of the valid data types: [\"Observation\"]", sd.errors[2])
  end

  def test_unable_to_guess_type
    sd = FHIR::STU3::StructureDefinition.new
    sd.warnings = []
    sd.hierarchy = OpenStruct.new(path: 'x') # just a hack

    element = FHIR::STU3::ElementDefinition.new('path' => 'no_type', 'min' => 1, 'max' => '1')
    sd.send(:verify_element, element, 'no_type' => 'abcd')
    assert_equal("Unable to guess data type for no_type", sd.warnings[0])

    element = FHIR::STU3::ElementDefinition.new('path' => 'has_type','type' => [{ 'code' => 'string' }], 'min' => 1, 'max' => '1')
    sd.warnings = []
    sd.errors = []
    sd.send(:verify_element, element, 'has_type' => 'abcd')
    assert_empty(sd.errors)
    assert_empty(sd.warnings)

    # this test is unique in that the message is based purely on the element definition,
    # not the object being validated against that definition
  end

  def test_valueset_binding
    sd = FHIR::STU3::StructureDefinition.new
    sd.warnings = []
    sd.hierarchy = OpenStruct.new(path: 'x') # just a hack

    # first 2 value sets are special cases
    element = FHIR::STU3::ElementDefinition.new('path' => 'mime', 'type' => [{ 'code' => 'string' }], 'min' => 1, 'max' => '1',
                                          'binding' => { 'valueSetUri' => 'http://hl7.org/fhir/ValueSet/content-type' })
    sd.errors = []
    sd.send(:check_binding_element, element, 'xml')
    assert_empty(sd.errors)

    sd.send(:check_binding_element, element, 'application/xml')
    assert_empty(sd.errors)

    sd.send(:check_binding_element, element, 'jpeg')
    assert_equal("mime has invalid mime-type: 'jpeg'", sd.errors[0])

    element = FHIR::STU3::ElementDefinition.new('path' => 'lang', 'type' => [{ 'code' => 'string' }], 'min' => 1, 'max' => '1',
                                          'binding' => { 'valueSetUri' => 'http://hl7.org/fhir/ValueSet/languages' })
    sd.errors = []
    sd.send(:check_binding_element, element, 'en')
    assert_empty(sd.errors)

    sd.send(:check_binding_element, element, 'English (United States)')
    assert_equal("lang has unrecognized language: 'English (United States)'", sd.errors[0])

    sd.errors = []
    sd.send(:check_binding_element, element, 'qq')
    assert_equal("lang has unrecognized language: 'qq'", sd.errors[0])


    # use a valueset we don't have defined here
    element = FHIR::STU3::ElementDefinition.new('path' => 'problem', 'type' => [{ 'code' => 'string' }], 'min' => 1, 'max' => '1',
                                          'binding' => { 'valueSetUri' => 'http://standardhealthrecord.org/shr/problem/vs/ProblemCategoryVS' })
    sd.errors = []
    sd.warnings = []
    sd.send(:check_binding_element, element, 'disease')
    assert_empty(sd.errors)
    assert_equal("problem has unknown ValueSet: 'http://standardhealthrecord.org/shr/problem/vs/ProblemCategoryVS'", sd.warnings[0])


    # regular case, FHIR VS with nothing special about it
    # binding strength required => error if wrong
    element = FHIR::STU3::ElementDefinition.new('path' => 'county', 'type' => [{ 'code' => 'string' }], 'min' => 1, 'max' => '1',
                                          'binding' => { 'valueSetUri' => 'http://hl7.org/fhir/ValueSet/fips-county',
                                                         'strength' => 'required' })
    sd.errors = []
    sd.warnings = []
    sd.send(:check_binding_element, element, '25017')
    assert_empty(sd.errors)
    assert_empty(sd.warnings)

    sd.errors = []
    sd.warnings = []
    sd.send(:check_binding_element, element, '98765')
    assert_equal("county has invalid code '98765' from http://hl7.org/fhir/ValueSet/fips-county", sd.errors[0])
    assert_empty(sd.warnings)

    # binding strength example => warning if wrong
    element = FHIR::STU3::ElementDefinition.new('path' => 'county', 'type' => [{ 'code' => 'string' }], 'min' => 1, 'max' => '1',
                                          'binding' => { 'valueSetUri' => 'http://hl7.org/fhir/ValueSet/fips-county',
                                                         'strength' => 'example' })
    sd.errors = []
    sd.warnings = []
    sd.send(:check_binding_element, element, '25017')
    assert_empty(sd.errors)
    assert_empty(sd.warnings)

    sd.errors = []
    sd.warnings = []
    sd.send(:check_binding_element, element, '98765')
    assert_equal("county has invalid code '98765' from http://hl7.org/fhir/ValueSet/fips-county", sd.warnings[0])
    assert_empty(sd.errors)

  end

  def test_get_json_nodes
    sd = FHIR::STU3::StructureDefinition.new
    json = { "colors" => ["red", "green", "blue"], 
      "people" => [{ "first" => "John", "last" => "Smith"}, { "first" => "Jane", "last" => "Doe"} ],
      "nested_level_1" => { "nested_level_2" => { "nested_level_3" => "value"}}}

    nodes = sd.send(:get_json_nodes, json, "colors")
    assert_equal(["red", "green", "blue"], nodes)

    nodes = sd.send(:get_json_nodes, json, "people.first")
    assert_equal(["John", "Jane"], nodes)

    node = sd.send(:get_json_nodes, json, "nested_level_1.nested_level_2.nested_level_3")
    assert_equal(["value"], node)
  end
end
