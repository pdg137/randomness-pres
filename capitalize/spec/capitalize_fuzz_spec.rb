require 'spec_helper'

describe Capitalize do
  20.times do
    s = 10.times.map { rand(128).chr }.join # random 10-character ASCII string
    specify "given #{s.inspect}, returns a result that downcases to the same value" do
      expect(Capitalize.capitalize_each_line(s).downcase).to eq s.downcase
    end
  end
end

