require_relative "../../simplecov"
require_relative '../../../lib/fhir_models'

require 'fileutils'
require 'pry'
require 'minitest/autorun'
require 'bundler/setup'
require 'test/unit'

class InvariantsTest < Test::Unit::TestCase

  def test_tim3_true
    expression = "((period or frequency) and when).not()"
    data = {
      'period' => '2016-2017',
      'frequency' => 'daily'
    }
    result = FluentPath.evaluate(expression,data)
    assert result==true, 'Failed tim-3 test.'
  end

  def test_tim3_false
    expression = "((period or frequency) and when).not()"
    data = {
      'period' => '2016-2017',
      'frequency' => 'daily',
      'when' => 'noon'
    }
    result = FluentPath.evaluate(expression,data)
    assert result==false, 'Failed tim-3 test.'
  end

  def test_imm1_true
    expression = "(wasNotGiven = true).not() or (reaction.empty() and explanation.reasonNotGiven.empty())"
    data = {
      'resourceType' => 'Immunization',
      'wasNotGiven' => false,
      'reaction' => [],
      'explanation' => {
        'reasonNotGiven' => []
      }
    }
    result = FluentPath.evaluate(expression,data)
    assert result==true, 'Failed imm-1 test.'
  end

  def test_imm1_false
    expression = "(wasNotGiven = true).not() or (reaction.empty() and explanation.reasonNotGiven.empty())"
    data = {
      'resourceType' => 'Immunization',
      'wasNotGiven' => true,
      'reaction' => [],
      'explanation' => {
        'reasonNotGiven' => ['Refusal']
      }
    }
    result = FluentPath.evaluate(expression,data)
    assert result==false, 'Failed imm-1 test.'
  end

  def test_imm2_true
    expression = "(wasNotGiven = true) or explanation.reasonNotGiven.empty()"
    data = {
      'resourceType' => 'Immunization',
      'wasNotGiven' => true,
      'explanation' => {
        'reasonNotGiven' => []
      }
    }
    result = FluentPath.evaluate(expression,data)
    assert result==true, 'Failed imm-2 test.'
  end

  def test_imm2_false
    expression = "(wasNotGiven = true) or explanation.reasonNotGiven.empty()"
    data = {
      'resourceType' => 'Immunization',
      'wasNotGiven' => false,
      'explanation' => {
        'reasonNotGiven' => ['Refusal']
      }
    }
    result = FluentPath.evaluate(expression,data)
    assert result==false, 'Failed imm-2 test.'
  end

  def test_nsd2
    expression = "uniqueId.where(preferred = true).select(type).distinct()"
    data = {
      'resourceType' => 'NamingSystem',
      'uniqueId' => {
        'preferred' => true,
        'type' => ['A','B','B']
      }
    }
    result = FluentPath.evaluate(expression,data)
    assert result==['A','B'], 'Failed nsd-2 test.'
  end

  def test_obs7_false
    expression = "component.where(code = $context.code).empty()"
    data = {
      'resourceType' => 'Observation',
      'code' => {
        'coding' => [{'code'=>'foo'},{'code'=>'bar'}]
      },
      'component' => [ 
        {
          'code' => {'coding' => [{'code'=>'foo'},{'code'=>'bar'}]}
        },{
          'code' => {'coding' => [{'code'=>'baz'},{'code'=>'boz'}]}
        }
      ]
    }
    result = FluentPath.evaluate(expression,data)
    assert result==false, 'Failed obs-7 test.'
  end

  def test_obs7_true
    expression = "component.where(code = $context.code).empty()"
    data = {
      'resourceType' => 'Observation',
      'code' => {
        'coding' => [{'code'=>'foo'},{'code'=>'bar'}]
      },
      'component' => [ 
        {
          'code' => {'coding' => [{'code'=>'baz'},{'code'=>'boz'}]}
        }
      ]
    }
    result = FluentPath.evaluate(expression,data)
    assert result==true, 'Failed obs-7 test.'
  end

end