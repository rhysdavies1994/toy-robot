require 'file_processor'

RSpec.describe ".run" do
  subject(:file_processor) { FileProcessor.new }

  it "with valid input file 'test_file.txt'" do
    file_processor.run("test_file.txt")
    expect(file_processor.file).to eq("test_file.txt")
  end

  it "with invalid input file 'hi'" do
    expect { file_processor.run("hi") }.to output(/Requires valid input file/).to_stdout
  end

  it "without input file" do
    expect { file_processor.run }.to output(/Requires valid input file/).to_stdout
  end
end
