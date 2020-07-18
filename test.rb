class Triangle

  attr_accessor :one, :two, :three
  
  def initialize(one, two, three)
    @sides = []
    @one = one
    @three = three
    @two = two
    @sides << @one
    @sides << @two
    @sides << @three
  end
  
  def valid?
    sum_one_two = @sides[0] + @sides[1]
    sum_one_three = @sides[0] + @sides[2]
    sum_two_three = @sides[1] + @sides[2]
    
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
      begin
        raise TriangleError
      rescue TriangleError => error
          puts error.message
      end
    end
  end 
end

class TriangleError < StandardError
  def message
    "This is not a legal triangle."
  end
end

Triangle.new(-1, -2, 3)



