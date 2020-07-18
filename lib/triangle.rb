class Triangle 

  attr_accessor :one, :two, :three
  
  def initialize(one, two, three)
    @sides = []
    @one = one
    @three = three
    @two = two
    puts one, two, three
    @sides << @one
    @sides << @two
    @sides << @three
  end
  
  def valid?
    sum_one_two = @sides[0] + @sides[1]
    sum_one_three = @sides[0] + @sides[2]
    sum_two_three = @sides[1] + @sides[2]
    puts sum_one_two, sum_one_three, sum_two_three
    if (@sides.none? {|i| i <= 0}) && (sum_one_two > @sides[2]) && (sum_one_three > @sides[1]) && (sum_two_three > @sides[0])
      return true
    else 
      return false
    end
  end
  
  def kind
    if valid?
      if @sides.uniq.length == 1
        return :equilateral
      elsif  @sides.uniq.length == 2
        return :isosceles
      else
        return :scalene
      end
    else
      raise TriangleError
    end
  end 
  class TriangleError < StandardError
  end
end

