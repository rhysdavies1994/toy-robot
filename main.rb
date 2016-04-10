require_relative 'lib/file_processor'
require_relative 'lib/robot'

toy_robot = Robot.new

file_processor = FileProcessor.new
file_processor.open(ARGV[0])
file_processor.file.readlines.each do |command|
  toy_robot.process(command)
end