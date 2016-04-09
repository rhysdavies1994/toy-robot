require 'grid'

class Robot
  attr_accessor :x, :y, :grid
  attr_reader :angle
  ANGLES = {north: 0, east: 90, south: 180, west: 270}

  # Initialize in South West and Facing North
  def initialize(x=0, y=0, direction="NORTH")
    @x = x
    @y = y
    @angle = angle_of(direction)
    @grid = Grid.new
  end

  def angle=(angle)
    # Use modulo operator to keep angle within 360 degrees
    # Also turns negatives into correct value, e.g -90 % 360 = 270
    @angle = angle % 360
  end

  # Place robot at certain position and direction
  def place(x, y, direction)

    if @grid.has_point(x, y)
      @x, @y = x, y
      @angle = angle_of(direction)
    end

  end

  def move
    x = @x
    y = @y
    if self.direction == "NORTH"
      y += 1
    elsif self.direction == "EAST"
      x += 1
    elsif self.direction == "SOUTH"
      y -= 1
    else
      x -= 1
    end

    @x, @y = x, y if @grid.has_point(x, y)

    return [@x, @y]
  end

  def left
    self.angle -= 90

    return direction
  end

  def right
    self.angle += 90
    return direction
  end

  # Return robots position as single array
  def position
    [x, y]
  end

  # Select angle to be facing, given direction
  # Using angle rather than simple direction to allow easier rotation
  def angle_of(direction)
    direction = direction.downcase.to_sym

    if ANGLES.key?(direction)
      angle = ANGLES[direction]
    else
      angle = 0
    end

    return angle
  end

  def direction
    # select direction where value is equal to robots current angle, there will be only one so choose first
    selection = ANGLES.select { |key, value| value == @angle }
    direction = selection.keys.first

    # convert symbol into uppercase string
    direction = direction.to_s.upcase
    return direction
  end

end