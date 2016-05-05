require "minitest/autorun"
require "input"

class TestInput < Minitest::Test

  def test_empty
    input = Input.new ""
    assert input.harmless?
    refute input.valid?
  end

  def numeric_assertions v, y=nil
    y ||= v

    input = Input.new v
    assert input.valid?
    refute input.operator?
    assert_equal y, input.value.to_s
  end

  def test_positive_integer
    numeric_assertions "45"
  end

  def test_negative_integer
    numeric_assertions "-45"
  end

  def test_positive_float
    numeric_assertions "45.55"
  end

  def test_negative_float
    numeric_assertions "-45.55"
  end

  def test_even_float
    numeric_assertions "45.0", "45"
  end

  def test_flaot_rounding
    numeric_assertions "44.333333", "44.33"
  end

  def test_quit
    input = Input.new "q"
    assert input.quit?

    input = Input.new nil  # EOF situation
    assert input.quit?
  end

  def test_operators
    %w[ + - * / ].each do |op|
      i = Input.new op
      assert i.operator?
      assert i.valid?
      refute i.number?
    end
  end
end
