require 'spec_helper'

describe Capitalize do
  describe "capitalize_each_line" do
    context "given 'abcd'" do
      let(:s) { "abcd" }
      it "should return 'Abcd'" do
        Capitalize.capitalize_each_line(s).should == "Abcd"
      end
    end

    context "given 'blah\n\blah\nBLAH'" do
      let(:s) { "blah\nblah\nBLAH" }
      it "should return 'Blah\nBlah\nBLAH'" do
        Capitalize.capitalize_each_line(s).should == "Blah\nBlah\nBLAH"
      end
    end
  end

  describe "capitalize_file" do
    context "given a file containing 'abcd'" do
      before(:each) do
        File.write("file.txt", "abcd")
      end

      it "should return 'Abcd'" do
        Capitalize.capitalize_file("file.txt").should == "Abcd"
      end
    end

    context "given a missing file" do
      before(:each) do
        File.unlink("file.txt")
      end

      it "should raise an excpetion" do
        expect { Capitalize.capitalize_file("file.txt") }.to raise_exception
      end
    end
  end
end
