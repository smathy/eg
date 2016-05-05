require "bigdecimal"
require "bigdecimal/util"

class Value
  attr_reader :v

  def initialize v
    @v = v.to_d
  end

  def + o
    self.class.new @v + o.v
  end

  def - o
    self.class.new @v - o.v
  end

  def * o
    self.class.new @v * o.v
  end

  def / o
    self.class.new @v / o.v
  end

  def to_s
    f = @v.to_f.round(2)
    ( f.to_i == f ? f.to_i : f ).to_s
  end
end
