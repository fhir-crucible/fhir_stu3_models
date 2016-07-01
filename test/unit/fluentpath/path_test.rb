require_relative "../../simplecov"
require_relative '../../../lib/fhir_models'

require 'fileutils'
require 'pry'
require 'minitest/autorun'
require 'bundler/setup'
require 'test/unit'

class PathTest < Test::Unit::TestCase

  NAMES = ['Bob','Robert']
  WTF = ['Bobert','Rob']
  PID1 = 99
  PATIENT = {
    'name' => [{
      'given' => NAMES
    },{
      'given' => WTF
    }],
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
  ITEM = { 'base' => 'Patient' }

  def test_path_without_type
    result = FluentPath.evaluate('name.given',PATIENT)
    assert result==NAMES+WTF, 'Failed to navigate path.'
  end

  def test_path_with_type
    result = FluentPath.evaluate('Patient.name.given',PATIENT)
    assert result==NAMES+WTF, 'Failed to navigate path.'
  end

  def test_path_conversion_2args
    result = FluentPath.evaluate('Patient.name.given.select(substring(0,3))',PATIENT)
    assert result==['Bob','Rob','Bob','Rob'], 'Failed to navigate path.'
  end

  def test_path_conversion_1args
    result = FluentPath.evaluate('Patient.name.given.select(substring(1))',PATIENT)
    assert result==['ob','obert','obert','ob'], 'Failed to navigate path.'
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

  def test_children_first
    expression = "children().element.first()"#.label.empty() and children().element.first().code.empty() and children().element.first().requirements.empty()"
    data = {
      'baseType' => 'Patient',
      'snapshot' => {
        'element' => [ITEM]
      }
    }
    result = FluentPath.evaluate(expression,data)
    assert result==ITEM, 'Failed to navigate children.'    
  end

end