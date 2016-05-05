require_relative "value"

class Input
  OPERATORS = %w[ + - * / ].freeze

  def initialize v
    @v = v
  end

  def value
    Value.new @v
  end

  def operator
    @v.to_sym
  end

  def valid?
    number? || operator?
  end

  def operator?
    OPERATORS.include?(@v)
  end

  def harmless?
    @v.empty?
  end

  def quit?
    @v.nil? || @v == "q"
  end

  def number?
    !! Float(@v)
  rescue ArgumentError
    false
  end
end
