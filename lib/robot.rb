require_relative 'grid'

class Robot
  attr_accessor :grid, :on_grid
  attr_reader :x, :y, :angle
  ANGLES = {north: 0, east: 90, south: 180, west: 270}

  # Initialize in South West and Facing North
  def initialize(x=0, y=0, direction="NORTH")
    @x = x
    @y = y
    @angle = angle_of(direction)
    @grid = Grid.new
    @on_grid = false
  end

  # Custom setter for angle, keep between 0 to 360 degrees
  def angle=(angle)
    # Use modulo operator to keep angle within 360 degrees
    # Also turns negatives into correct value, e.g -90 % 360 = 270
    @angle = angle % 360
  end

  # Receive a string and process into one command per line
  # will not process unless whole line is valid
  def process(command)
    if match = command.match(/^PLACE (\d+),(\d+),(NORTH|EAST|SOUTH|WEST)$/)
      x, y, direction = match.captures
      place(x, y, direction)

    elsif @on_grid
      #Only run below commands if already placed on grid
      if match = command.match(/^MOVE\n$/)
        move()
      elsif match = command.match(/^LEFT\n$/)
        left()
      elsif match = command.match(/^RIGHT\n$/)
        right()
      elsif match = command.match(/^REPORT\n$/)
        report()
      end
    end
  end

  # Place robot at certain position and direction
  def place(x, y, direction)
    x, y = x.to_i, y.to_i

    if @grid.has_point(x, y) and directions.include?(direction)
      @x = x
      @y = y
      @angle = angle_of(direction)
      @on_grid = true
    end
  end

  # Move robot 1 space, moving in its current direction if on grid
  def move
    if (@on_grid)
      x = @x
      y = @y

      case self.direction
        when "NORTH"
          y += 1
        when "EAST"
          x += 1
        when "SOUTH"
          y -= 1
        when "WEST"
          x -= 1
      end

      @x, @y = x, y if @grid.has_point(x, y)
    end
    return [@x, @y]
  end

  # Rotate robot 90 degrees anticlockwise (-90) if on grid
  def left
    self.angle -= 90 if @on_grid
    return direction
  end

  # Rotate robot 90 degrees clockwise (+90) if on grid
  def right
    self.angle += 90 if @on_grid
    return direction
  end

  # Report robots current position and direction if on grid
  def report
    puts "#{x},#{y},#{direction}" if @on_grid
  end

  # Return robots position as single array
  def position
    [x, y]
  end

  def directions
    ANGLES.keys.map { |key| key.to_s.upcase }
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