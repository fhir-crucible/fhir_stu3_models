require_relative "../../simplecov"
require_relative '../../../lib/fhir_models'

require 'fileutils'
require 'pry'
require 'minitest/autorun'
require 'bundler/setup'
require 'test/unit'

class ExtensionTest < Test::Unit::TestCase

  CONCEPT = {
    'coding'=> [{
        'system'=> 'http://hl7.org/fhir/v3/Race',
        'code'=> '1096-7'
      }]
  }
  EXT = {
    'url'=>'http://hl7.org/fhir/StructureDefinition/us-core-race',
    'valueCodeableConcept'=> CONCEPT
  }
  EXT_ARRAY = [ EXT ]
  PATIENT = {
    'name' => {
      'given' => ['Foo']
    },
    'extension' => EXT_ARRAY,
    'resourceType' => 'Patient'
  }

  def test_extension
    result = FluentPath.evaluate('Patient.extension',PATIENT)
    binding.pry if result!=EXT_ARRAY
    assert result==EXT_ARRAY, 'Failed to resolve extension.'
  end

  def test_extension_with_block
    result = FluentPath.evaluate("Patient.extension('http://hl7.org/fhir/StructureDefinition/us-core-race')",PATIENT)
    binding.pry if result!=EXT
    assert result==EXT, 'Failed to resolve extension by name.'
  end

  def test_extension_item
    result = FluentPath.evaluate('Patient.extension[0]',PATIENT)
    binding.pry if result!=EXT
    assert result==EXT, 'Failed to resolve extension by index.'
  end

  def test_extension_value
    result = FluentPath.evaluate('Patient.extension[0].value',PATIENT)
    binding.pry if result!=CONCEPT
    assert result==CONCEPT, 'Failed to resolve extension value.'
  end

  def test_extension_with_block_value
    result = FluentPath.evaluate("Patient.extension('http://hl7.org/fhir/StructureDefinition/us-core-race').value",PATIENT)
    binding.pry if result!=CONCEPT
    assert result==CONCEPT, 'Failed to resolve named extension value.'
  end

  def test_extension_missing
    result = FluentPath.evaluate("Patient.extension('http://hl7.org/fhir/StructureDefinition/us-core-ethnicity')",PATIENT)
    binding.pry if !result.nil?
    assert result==nil, 'Failed to resolve missing extension.'
  end

end