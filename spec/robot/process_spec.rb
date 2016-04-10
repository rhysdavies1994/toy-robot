require 'robot'

RSpec.describe Robot, ".process" do
  subject(:robot) { Robot.new }

  context "with robot not on grid" do
    it "processes 'place' function" do
      expect(robot).to receive(:place)
      robot.process("PLACE 1,1,NORTH\n")
    end

    # Test each single word commands which should not be run before being placed
    # e.g "MOVE" command should not receive 'move' function
    commands = ["move", "left", "right", "report"]
    commands.each do |command|
      it "doesn't process '#{command}' function" do
        expect(robot).to_not receive(command)
        robot.process("#{command.upcase}\n")
      end
    end

  end

  context "after robot has been placed on grid" do
    # Test each single word commands which should be run
    # e.g "MOVE" command should receive 'move' function
    commands = ["move", "left", "right", "report"]
    commands.each do |command|
      it "processes '#{command}' function" do
        expect(robot).to receive(command)
        robot.place(0,0,"NORTH")
        robot.process("#{command.upcase}\n")
      end
    end
  end
end