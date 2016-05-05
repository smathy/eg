require "minitest/autorun"
require "rpn"

class TestRPN < Minitest::Test

  def rpn
    @_rpn ||= RPN.new
  end

  def seed a
    a.each do |i|
      rpn << i
    end
  end

  def test_one
    seed %w[ 5 8 + ]
    assert_equal "13", rpn.value
  end

  def test_two
    seed %w[ -3 -2 * 5 + ]
    assert_equal "11", rpn.value
  end

  def test_three
    seed %w[ 2 9 3 + * ]
    assert_equal "24", rpn.value
  end

  def test_four
    seed %w[ 20 13 - 2 / ]
    assert_equal "3.5", rpn.value
  end

end
