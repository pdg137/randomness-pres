require 'spec_helper'

describe "Capitalize#capitalize_file" do
  specify "on a file containing 'abcd', it returns 'Abcd'" do
    File.write("file.txt", "abcd")
    expect(Capitalize.capitalize_file("file.txt")).to eq "Abcd"
  end

  specify "with the file removed, it raises an exception" do
    File.unlink("file.txt")
    expect { Capitalize.capitalize_file("file.txt") }.to raise_exception
  end
end
