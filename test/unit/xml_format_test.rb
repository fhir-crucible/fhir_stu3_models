require_relative "../simplecov"
require_relative '../../lib/fhir_models'

require 'fileutils'
require 'pry'
require 'nokogiri/diff'
require 'minitest/autorun'
require 'bundler/setup'
require 'test/unit'

class XmlFormatTest < Test::Unit::TestCase
 
  # turn off the ridiculous warnings
  $VERBOSE=nil

  ERROR_DIR = File.join('errors', 'XmlFormatTest')
  EXAMPLE_ROOT = File.join('examples','xml')

  # Automatically generate one test method per example file
  example_files = File.join(EXAMPLE_ROOT, '**', '*.xml')

  # Create a blank folder for the errors
  FileUtils.rm_rf(ERROR_DIR) if File.directory?(ERROR_DIR)
  FileUtils.mkdir_p ERROR_DIR
  
  Dir.glob(example_files).each do | example_file |
    example_name = File.basename(example_file, ".xml")
    define_method("test_xml_format_#{example_name}") do
      run_xml_roundtrip_test(example_file, example_name)
    end
  end

  def run_xml_roundtrip_test(example_file, example_name)
    input_xml = File.read(example_file)
    resource = FHIR::Xml.from_xml(input_xml)
    output_xml = resource.to_xml

    input_nodes = Nokogiri::XML(input_xml)
    output_nodes = Nokogiri::XML(output_xml)

    clean_nodes(input_nodes.root)
    clean_nodes(output_nodes.root)

    errors = input_nodes.diff(output_nodes, added: true, removed: true).to_a
    errors.keep_if do |error|
      is_comment = (error.last.class==Nokogiri::XML::Comment)
      is_empty_text = (error.last.class==Nokogiri::XML::Text && error.last.text.strip=='')
      !(is_comment || is_empty_text)
    end

    if !errors.empty?
      File.open("#{ERROR_DIR}/#{example_name}.err", 'w:UTF-8') {|file| file.write(errors.map{|x| "#{x.first} #{x.last.to_xml}"}.join("\n"))}
      File.open("#{ERROR_DIR}/#{example_name}_PRODUCED.xml", 'w:UTF-8') {|file| file.write(output_xml)}
      File.open("#{ERROR_DIR}/#{example_name}_ORIGINAL.xml", 'w:UTF-8') {|file| file.write(input_xml)}
    end

    assert errors.empty?, "Differences in generated XML vs original"
  end

  # process input to remove newlines and whitespace around text
  def clean_nodes(node)
    node.children.each do |child|
      child.content = child.content.strip if(child.is_a?(Nokogiri::XML::Text))
      clean_nodes(child) if !child.children.empty?
    end
  end

end
