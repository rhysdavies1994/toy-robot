require 'robot'

describe Robot, ".place" do
  subject(:robot) { Robot.new }

  context "with position inside of a 5x5 grid and" do
    # Test multiple positions with loop
    positions = [
        {x: 1, y: 2},
        {x: 3, y: 4}
    ]
    positions.each do |position|
      x, y = position[:x], position[:y]

      it "is in position #{x}, #{y} " do
        robot.place(x, y, "NORTH")
        expect(robot.position).to eq([x, y])
      end

    end

    # Test each direction with loop
    directions = ["NORTH", "SOUTH", "EAST", "WEST"]
    directions.each do |direction|

      it "is facing #{direction}" do
        robot.place(1, 2, direction)
        expect(robot.direction).to eq(direction)
      end

    end
  end

end