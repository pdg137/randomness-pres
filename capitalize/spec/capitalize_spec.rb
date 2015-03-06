require 'spec_helper'

describe Capitalize do
  describe "capitalize_each_line" do
    specify "given 'abcd' returns 'Abcd'" do
      expect(Capitalize.capitalize_each_line('abcd')).to eq 'Abcd'
    end

    specify "given '\nabcd' returns '\nAbcd'" do
      expect(Capitalize.capitalize_each_line("\nabcd")).to eq "\nAbcd"
    end

    specify "given 'blah\nblah\nBLAH' should return 'Blah\nBlah\nBLAH'" do
      expect(Capitalize.capitalize_each_line("blah\nblah\nBLAH")).to eq "Blah\nBlah\nBLAH"
    end
  end
end
