require 'spec_helper'

describe Profane do
  context "with configuration options" do
    it "includes the supplied configuration options with the defaults" do
      Profane.configure(dictionary: { geega: 'bobby pants' })
      Profane.config[:dictionary][:geega].should == 'bobby pants'
    end
  end
end
