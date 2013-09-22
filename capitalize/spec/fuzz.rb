    10.times do
      s = (0...10).map { rand(128).chr }.join
      context "given '#{s.inspect}" do
        it "should give a result that downcases to the same value" do
          Capitalize.capitalize_each_line(s).downcase.should == s.downcase
        end
      end
    end
