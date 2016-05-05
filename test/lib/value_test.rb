require "minitest/autorun"
require "value"

class TestValue < Minitest::Test

  def v v
    Value.new v
  end

  def test_integer_division
    assert_equal "15", ( v("45") / v("3") ).to_s
  end

  def test_float_division
    assert_equal "6.5", ( v("13") / v("2") ).to_s
  end

  def test_integer_representation
    assert_equal "4", v("4.0").to_s
  end

  def test_addition
    assert_equal "23", ( v("11") + v("12") ).to_s
  end
end

