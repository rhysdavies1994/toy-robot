require 'robot'

RSpec.describe Robot, ".report" do
  context "when robot is inside of grid" do
    it "responds with position and direction" do
      robot = Robot.new
      robot.place(1, 1, "NORTH")
      expect { robot.report }.to output(/#{robot.x},#{robot.y},#{robot.direction}/).to_stdout
    end
  end

  context "when robot is outside of grid" do
    it "does not respond" do
      robot = Robot.new
      robot.place(-1, -1, "NORTH")
      expect { robot.report }.to_not output(/#{robot.x},#{robot.y},#{robot.direction}/).to_stdout
    end
  end
end