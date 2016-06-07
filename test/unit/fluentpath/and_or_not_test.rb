require_relative "../../simplecov"
require_relative '../../../lib/fhir_models'

require 'fileutils'
require 'pry'
require 'minitest/autorun'
require 'bundler/setup'
require 'test/unit'

class AndOrNotTest < Test::Unit::TestCase

  def test_and_or_not
    data = {
      'name' => {
        'given' => [ 'Joe', 'John' ]
      },
      'gender' => 'male',
      'deceased' => false
    }
    result = FluentPath.evaluate('deceased.not() and ((name.given or name.family) and gender) and deceased.not()',data)
    assert result==true, 'Failed and_or_not test.'
  end


end