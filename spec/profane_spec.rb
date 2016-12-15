require 'spec_helper'

describe Profane do
  before do
    Profane.set_default_config
  end

  context "without configuration options" do
    it "loads the default dictionary" do
      expect(Profane.dictionary['fuck']).to eql ''
    end
  end

  context "with configuration options" do
    it "includes the supplied configuration options with the defaults" do
      Profane.configure(dictionary: { geega: 'bobby pants' })
      expect(Profane.config[:dictionary][:geega]).to eql 'bobby pants'
    end
  end
end
