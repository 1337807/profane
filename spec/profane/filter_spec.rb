require 'spec_helper'

describe 'Profane::Filter' do
  context "#filter" do
    it "filters words from the dictionary using the default character" do
      filter = Profane::Filter.new

      filter.filter('fuck').should == '****'
    end

    it "filters words from the dictionary ignoring punctuation" do
      filter = Profane::Filter.new

      filter.filter('fuck!').should == '****!'
    end

    it "filters words from the dictionary using a custom character" do
      Profane.configure(filter_character: '&')
      filter = Profane::Filter.new

      filter.filter('fuck!').should == '&&&&!'
    end

    context "when configured with a custom dictionary" do
      it "filters words from the custom dictionary with string keys" do
        Profane.configure(dictionary: { 'shit' => '' })
        filter = Profane::Filter.new

        filter.filter('shit!?').should == '****!?'
      end

      it "filters words from the custom dictionary with symbol keys"
      it "filters words from the default dictionary"
    end

    context "when configured not to use the internal dictionary" do
      it "filters words from the custom dictionary"
      it "doesn't filter words from the default dictionary"
    end
  end

  context "#profane?" do
    it "detects the presence of words from the default dictionary"
    it "detects the presence of words from the custom dictionary"
  end
end
