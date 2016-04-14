require_relative "../simplecov"
require_relative '../../lib/fhir_models'

require 'fileutils'
require 'pry'
require 'minitest/autorun'
require 'bundler/setup'
require 'test/unit'

class ContentsTest < Test::Unit::TestCase

  # turn off the ridiculous warnings
  $VERBOSE=nil

  EXAMPLE_JSON = File.join('examples','json','patient-example.json')
  EXAMPLE_XML  = File.join('examples','xml','patient-example.xml')

  def test_xml_from_contents
    xml = File.read(EXAMPLE_XML)
    patient = FHIR.from_contents(xml)
    assert !patient.nil?, "From contents did not succeed with XML."
    assert patient.id=='example', "Patient did not deserialize correctly."
  end

  def test_json_from_contents
    json = File.read(EXAMPLE_JSON)
    patient = FHIR.from_contents(json)
    assert !patient.nil?, "From contents did not succeed with JSON."
    assert patient.id=='example', "Patient did not deserialize correctly."
  end

  def test_negative_json_contents
    nothing = FHIR.from_contents('{}')
    assert nothing.nil?, "From contents should have returned nil."
  end

  def test_negative_xml_contents
    nothing = FHIR.from_contents('<?xml version="1.0" encoding="UTF-8"?><Nothing/>')
    assert nothing.nil?, "From contents should have returned nil."
  end

end