require 'robot'

RSpec.describe Robot, ".process" do
  subject(:robot) { Robot.new }

  context "with robot not on grid" do
    it "processes 'place' function" do
      expect(robot).to receive(:place)
      robot.process("PLACE 1,1,NORTH\n")
    end
  end

  context "after robot has been placed on grid" do
    it "processes 'move' function" do
      expect(robot).to receive(:move)
      robot.place(0,0,"NORTH")
      robot.process("MOVE\n")
    end

    it "processes 'left' function" do
      expect(robot).to receive(:left)
      robot.place(0,0,"NORTH")
      robot.process("LEFT\n")
    end

    it "processes 'right' function" do
      expect(robot).to receive(:right)
      robot.place(0,0,"NORTH")
      robot.process("RIGHT\n")
    end

    it "processes 'report' function" do
      expect(robot).to receive(:report)
      robot.place(0,0,"NORTH")
      robot.process("REPORT\n")
    end

  end
end