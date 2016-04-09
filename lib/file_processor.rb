class FileProcessor
  attr_accessor :file

  # Process file path given, default to first command line argument
  def run(file = ARGV[0])
    open(file)
  end

  def open(file)
    # if file exists as a variable with length greater than 0 and is an actual file on filesystem, set as file
    if file and file.length > 0 and File.file?(file)
      @file = file
    else
      puts "** Requires valid input file **"
      puts "Please run: ./main.rb <file-path>"
    end
  end
end

