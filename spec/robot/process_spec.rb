require 'robot'

RSpec.describe Robot, ".process" do
  subject(:robot) { Robot.new }

  context "with valid commands" do
    it "processes place function" do
      expect(robot).to receive(:place)
      robot.process("PLACE 1,1,NORTH\n")
    end
  end
end