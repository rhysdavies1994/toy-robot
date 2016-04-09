require 'robot'

RSpec.describe Robot, ".move" do

  context "to position inside of 5x5 grid" do
    # Test multiple positions with loop
    positions = [
        {x: 1, y: 2, direction: "NORTH", result_x: 1, result_y: 3},
        {x: 3, y: 4, direction: "EAST", result_x: 4, result_y: 4},
    ]
    positions.each do |p|
      it "moved #{p[:direction]} 1 space from #{p[:x]}, #{p[:y]}" do
        robot = Robot.new
        robot.place(p[:x], p[:y], p[:direction])
        expect(robot.move).to eq([p[:result_x], p[:result_y]])
      end
    end
  end

  context "to position outside of 5x5 grid" do
    positions = [
        {x: 5, y: 5, direction: "NORTH", result_x: 5, result_y: 5},
        {x: 5, y: 5, direction: "EAST", result_x: 5, result_y: 5}
    ]
    positions.each do |p|
      it "did not move #{p[:direction]} 1 space from #{p[:x]}, #{p[:y]}" do
        robot = Robot.new
        robot.place(p[:x], p[:y], p[:direction])
        expect(robot.move).to eq([p[:result_x], p[:result_y]])
      end
    end
  end
end