require 'file_processor'

RSpec.describe ".open" do
  subject(:file_processor) { FileProcessor.new }

  it "with valid input file 'test_file.txt'" do
    file_processor.open("test_file.txt")
    expect(file_processor.file_path).to eq("test_file.txt")
  end

  it "with invalid input file 'hi'" do
    expect { file_processor.open("hi") }.to output(/Requires valid input file/).to_stdout
  end

  it "without input file" do
    expect { file_processor.open }.to output(/Requires valid input file/).to_stdout
  end
end
