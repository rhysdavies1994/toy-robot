require 'robot'

RSpec.describe Robot, ".left" do

  directions = [
      {current: "NORTH", result: "WEST"},
      {current: "WEST", result: "SOUTH"},
      {current: "SOUTH", result: "EAST"},
      {current: "EAST", result: "NORTH"}
  ]
  directions.each do |direction|
    context "when facing #{direction[:current]}" do
      it "switches robot to facing #{direction[:result]}" do
        robot = Robot.new
        robot.place(0, 0, direction[:current])
        expect(robot.left).to eq(direction[:result])
      end
    end
  end
end

RSpec.describe Robot, ".right" do
  directions = [
      {current: "NORTH", result: "EAST"},
      {current: "EAST", result: "SOUTH"},
      {current: "SOUTH", result: "WEST"},
      {current: "WEST", result: "NORTH"}
  ]
  directions.each do |direction|
    context "when facing #{direction[:current]}" do
      it "switches robot to facing #{direction[:result]}" do
        robot = Robot.new
        robot.place(0, 0, direction[:current])
        expect(robot.right).to eq(direction[:result])
      end
    end
  end
end
