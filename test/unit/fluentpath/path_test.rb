require_relative "../../simplecov"
require_relative '../../../lib/fhir_models'

require 'fileutils'
require 'pry'
require 'minitest/autorun'
require 'bundler/setup'
require 'test/unit'

class PathTest < Test::Unit::TestCase

  NAMES = ['Bob','Robert']
  PID1 = 99
  PATIENT = {
    'name' => {
      'given' => NAMES
    },
    'resourceType' => 'Patient'
  }
  MESSAGE = {
    'Message' => {
      'PID-1' => PID1
    }
  }
  ARRAY = {
    'Array' => ['A','B'],
    'index' => 1
  }

  def test_path_without_type
    result = FluentPath.evaluate('name.given',PATIENT)
    assert result==NAMES, 'Failed to navigate path.'
  end

  def test_path_with_type
    result = FluentPath.evaluate('Patient.name.given',PATIENT)
    assert result==NAMES, 'Failed to navigate path.'
  end

  def test_path_with_quotes
    result = FluentPath.evaluate('Message."PID-1"',MESSAGE)
    assert result==PID1, 'Failed to navigate path.'
  end

  def test_array_access
    result = FluentPath.evaluate('Array[0]',ARRAY)
    assert result=='A', 'Failed to navigate path.'
  end  

  def test_array_access_with_variable
    result = FluentPath.evaluate('Array[index]',ARRAY)
    assert result=='B', 'Failed to navigate path.'
  end

end