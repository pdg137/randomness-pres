require 'spec_helper'

describe Capitalize do
  describe "capitalize_each_line" do
    specify "given 'abcd' returns 'Abcd'" do
      expect(Capitalize.capitalize_each_line('abcd')).to eq 'Abcd'
    end

    specify "given 'blah\nblah\nBLAH' should return 'Blah\nBlah\nBLAH'" do
      expect(Capitalize.capitalize_each_line("blah\nblah\nBLAH")).to eq "Blah\nBlah\nBLAH"
    end
  end

  describe "capitalize_file" do
    before(:all) do
      File.unlink("file.txt") rescue nil
    end

    context "given a file containing 'abcd'" do
      before do
        File.write("file.txt", "abcd")
      end

      it "should return 'Abcd'" do
        expect(Capitalize.capitalize_file("file.txt")).to eq "Abcd"
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
