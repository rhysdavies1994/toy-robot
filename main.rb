require './lib/file_processor'
require './lib/robot'

toy_robot = Robot.new

file_processor = FileProcessor.new
file_processor.open(ARGV[0])
file_processor.file.readlines.each do |command|
  toy_robot.process(command)
end