require_relative '../test_helper'

class EqualityTest < Test::Unit::TestCase

  # turn off the ridiculous warnings
  $VERBOSE=nil

  EXAMPLE_ROOT = File.join('lib', 'fhir_models', 'examples')
  ERROR_DIR = File.join('tmp', 'errors', 'EqualityTest')

  # Create a blank folder for the errors
  FileUtils.rm_rf(ERROR_DIR) if File.directory?(ERROR_DIR)
  FileUtils.mkdir_p ERROR_DIR

  # Automatically generate one test method per example file
  example_json_files = File.join(EXAMPLE_ROOT, '**', '*.json')
  example_xml_files = File.join(EXAMPLE_ROOT, '**', '*.xml')

  Dir.glob(example_json_files).each do | example_file |
    example_name = File.basename(example_file, '.json')
    define_method("test_equality_#{example_name}_json") do
      run_json_equality_test(example_file, example_name)
    end
  end

  Dir.glob(example_xml_files).each do | example_file |
    example_name = File.basename(example_file, '.xml')
    define_method("test_equality_#{example_name}_xml") do
      run_xml_equality_test(example_file, example_name)
    end
  end

  Dir.glob(example_json_files).each do | example_json_file |
    example_name = File.basename(example_json_file, '.json')
    example_xml_file = File.join(EXAMPLE_ROOT, 'xml', "#{example_name}.xml")
    define_method("test_equality_#{example_name}") do
      run_equality_test(example_json_file, example_xml_file, example_name)
    end
  end

  def run_json_equality_test(example_file, example_name)
    input_json = File.read(example_file)
    instanceA = FHIR::Json.from_json(input_json)
    instanceB = FHIR::Json.from_json(input_json)
    if(!instanceA.equals?(instanceB) || !instanceB.equals?(instanceA))
      File.open("#{ERROR_DIR}/#{example_name}.json", 'w:UTF-8') {|file| file.write(input_json)}
    end
    assert instanceA.equals?(instanceB), 'Instance A should be equal to instance B.'
    assert instanceB.equals?(instanceA), 'Instance B should be equal to instance A.'
  end

  def run_json_mismatch_test(example_file, example_name)
    input_json = File.read(example_file)
    instanceA = FHIR::Json.from_json(input_json)
    instanceB = FHIR::Json.from_json(input_json)
    if !instanceA.mismatch(instanceB).empty?
      File.open("#{ERROR_DIR}/#{example_name}.json", 'w:UTF-8') {|file| file.write(input_json)}
    end
    assert instanceA.mismatch(instanceB).empty?, 'Instance A should match instance B.'
  end

  def run_xml_equality_test(example_file, example_name)
    input_xml = File.read(example_file)
    instanceA = FHIR::Xml.from_xml(input_xml)
    instanceB = FHIR::Xml.from_xml(input_xml)
    if(!instanceA.equals?(instanceB) || !instanceB.equals?(instanceA))
      File.open("#{ERROR_DIR}/#{example_name}.xml", 'w:UTF-8') {|file| file.write(input_xml)}
    end
    assert instanceA.equals?(instanceB), 'Instance A should be equal to instance B.'
    assert instanceB.equals?(instanceA), 'Instance B should be equal to instance A.'
  end

  def run_equality_test(example_json_file, example_xml_file, example_name)
    input_json = File.read(example_json_file)
    input_xml = File.read(example_xml_file)
    instanceA = FHIR::Json.from_json(input_json)
    instanceB = FHIR::Xml.from_xml(input_xml)
    exclude = ['div']
    if(!instanceA.equals?(instanceB, exclude) || !instanceB.equals?(instanceA, exclude))
      File.open("#{ERROR_DIR}/#{example_name}_A.json", 'w:UTF-8') {|file| file.write(instanceA.to_json)}
      File.open("#{ERROR_DIR}/#{example_name}_B.json", 'w:UTF-8') {|file| file.write(instanceB.to_json)}
      File.open("#{ERROR_DIR}/#{example_name}_A.xml", 'w:UTF-8') {|file| file.write(instanceA.to_xml)}
      File.open("#{ERROR_DIR}/#{example_name}_B.xml", 'w:UTF-8') {|file| file.write(instanceB.to_xml)}
    end
    assert instanceA.equals?(instanceB, exclude), 'Instance A should be equal to instance B.'
    assert instanceB.equals?(instanceA, exclude), 'Instance B should be equal to instance A.'
  end

  def test_mismatch
    x = FHIR::Patient.new({'id'=>'foo','gender'=>'male'})
    y = FHIR::Patient.new({'id'=>'foo','gender'=>'female'})
    misses = x.mismatch(y)
    assert misses.first=='FHIR::Patient::gender', 'Mismatch did not detect differences.'
  end

end
