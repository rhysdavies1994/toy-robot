class FileProcessor
  attr_accessor :file_path, :file

  def initialize
    @file_path = nil
    @file = nil
  end

  # Open file with given path, default to first command line argument
  def open(file = ARGV[0])
    # if file exists as a variable with length greater than 0 and is an actual file on filesystem, set as file
    if file and file.length > 0 and File.file?(file)
      @file_path = file
      @file = File.open(@file_path)
    else
      puts "** Requires valid input file **"
      puts "Please run: ./main.rb <file-path>"
    end
  end
end

