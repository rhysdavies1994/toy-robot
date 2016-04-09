require 'byebug'

class Grid
  attr_accessor :width, :height

  def initialize(width=5, height=5)
    @width = width
    @height = height
  end

  def has_point(x, y)
    is_negative = (x < 0 or y < 0)
    is_greater_than_dimensions = (x > @width or y > @height)

    if is_negative or is_greater_than_dimensions
      result = false
      puts "[#{x},#{y}] is Outside of Grid, Robot will not be moved or placed on table"
    else
      result = true
    end

    return result;
  end
end