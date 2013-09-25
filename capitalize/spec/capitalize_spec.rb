require 'spec_helper'

describe Capitalize do
  describe "capitalize_each_line" do
    context "given 'abcd'" do
      let(:s) { "abcd" }
      it "should return 'Abcd'" do
        Capitalize.capitalize_each_line(s).should == "Abcd"
      end
    end

    context "given 'blah\nblah\nBLAH'" do
      let(:s) { "blah\nblah\nBLAH" }
      it "should return 'Blah\nBlah\nBLAH'" do
        Capitalize.capitalize_each_line(s).should == "Blah\nBlah\nBLAH"
      end
    end

    100.times do
      s = 10.times.map { rand(128).chr }.join # random 10-character ASCII string
      context "given '#{s.inspect}" do
        it "should give a result that downcases to the same value" do
          Capitalize.capitalize_each_line(s).downcase.should == s.downcase
        end
      end
    end
  end

  describe "capitalize_file" do
    context "given a file containing 'abcd'" do
      before do
        File.write("file.txt", "abcd")
      end

      it "should return 'Abcd'" do
        Capitalize.capitalize_file("file.txt").should == "Abcd"
      end
    end

    context "given a missing file" do
      before do
        File.unlink("file.txt")
      end

      it "should raise an exception" do
        expect { Capitalize.capitalize_file("file.txt") }.to raise_exception
      end
    end
  end
end
