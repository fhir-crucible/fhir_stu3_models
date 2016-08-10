require_relative "../simplecov"
require_relative '../../lib/fhir_models'

require 'fileutils'
require 'pry'
require 'minitest/autorun'
require 'bundler/setup'
require 'test/unit'

class ExpansionsTest < Test::Unit::TestCase

  # turn off the ridiculous warnings
  $VERBOSE=nil

  def test_expansion
    codes = FHIR::Definitions.get_codes('http://hl7.org/fhir/ValueSet/relatedperson-relationshiptype')
    assert (!codes.nil? && !codes.empty?), "Expansions did not return expected codes."
  end

  def test_missing_expansion
    codes = FHIR::Definitions.get_codes('http://projectcrucible.org/nonexisting/valueset')
    assert (codes.nil? || codes.empty?), "Expansions returned unexpected codes."
  end

end