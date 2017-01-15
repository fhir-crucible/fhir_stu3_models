require_relative '../../../test_helper'

class ModelTest < Test::Unit::TestCase

  # This is far from an exhaustive test for this method
  def test_is_primitive?
    model = FHIR::Basic.new({})
    assert model.is_primitive?('integer', 0)
    assert model.is_primitive?('integer', -1)
    assert model.is_primitive?('integer', +1)
    assert model.is_primitive?('integer', '0')
    assert model.is_primitive?('integer', '1')
    assert model.is_primitive?('integer', '-1')
    assert model.is_primitive?('integer', '+1')
  end

end
