class Robot
  attr_accessor :x, :y
  attr_reader :angle
  ANGLES = {north: 0, east: 90, south: 180, west: 270}

  # Initialize in South West and Facing North
  def initialize
    @x = 0
    @y = 0
    @angle = 0
  end

  def angle=(angle)
    # Use modulo operator to keep angle within 360 degrees
    # Also turns negatives into correct value, e.g -90 % 360 = 270
    @angle = angle % 360
  end

  # Place robot at certain position and direction
  def place(x, y, direction)
    @x = x
    @y = y
    @angle = angle_of(direction)
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