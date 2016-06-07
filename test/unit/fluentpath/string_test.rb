require_relative "../../simplecov"
require_relative '../../../lib/fhir_models'

require 'fileutils'
require 'pry'
require 'minitest/autorun'
require 'bundler/setup'
require 'test/unit'

class StringTest < Test::Unit::TestCase

  DATA = {
    'name' => 'John Doe',
    'reference' => '#uri',
    'uri' => 'http://snomed.ct'
  }

  # ------------------------- startsWith() -------------------------------------
  def test_startsWith_true
    result = FluentPath.evaluate("name.startsWith('John')",DATA)
    assert result==true, 'Failed startsWith test.'
  end

  def test_startsWith_anchor
    result = FluentPath.evaluate("reference.startsWith('#')",DATA)
    assert result==true, 'Failed startsWith test.'
  end

  def test_startsWith_false
    result = FluentPath.evaluate("name.startsWith('Zoo')",DATA)
    assert result==false, 'Failed startsWith test.'
  end

end