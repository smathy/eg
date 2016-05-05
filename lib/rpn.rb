require_relative "input"

class RPN
  def initialize
    @stack = []
  end

  def << val
    input = Input.new val

    exit if input.quit?

    return if input.harmless?

    raise ArgumentError, "Invalid input value" unless input.valid?

    if input.operator?
      input = calc input.operator
    else
      @stack << input.value
    end
  end

  def value
    @stack.last(2).join "\n"
  end

  private
  def calc op
    raise ArgumentError, "Operation requires two arguments" if @stack.length < 2
    prev, last = @stack.slice! -2, 2

    @stack << prev.public_send(op, last)
  end

end
