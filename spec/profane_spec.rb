require 'spec_helper'

describe Profane do
  context "without configuration options" do
    it "loads the default dictionary" do
      Profane.dictionary['fuck'].should == ''
    end
  end

  context "with configuration options" do
    it "includes the supplied configuration options with the defaults" do
      Profane.configure(dictionary: { geega: 'bobby pants' })
      Profane.config[:dictionary][:geega].should == 'bobby pants'
    end
  end
end
