require 'spec_helper'

describe 'Profane::Filter' do
  before do
    Profane.set_default_config
  end

  context "#filter" do
    it "filters words from the dictionary using the default character" do
      filter = Profane::Filter.new

      expect(filter.filter('fuck')).to eql '****'
    end

    it "filters words from the dictionary ignoring punctuation" do
      filter = Profane::Filter.new

      expect(filter.filter('fuck!')).to eql '****!'
    end

    it "filters words from the dictionary using a custom character" do
      Profane.configure(filter_character: '&')
      filter = Profane::Filter.new

      expect(filter.filter('fuck!')).to eql '&&&&!'

      Profane.configure(filter_character: '*')
    end

    context "when configured with a custom dictionary" do
      it "filters words from the custom dictionary with string keys" do
        Profane.configure(dictionary: { 'shit' => '' })
        filter = Profane::Filter.new

        expect(filter.filter('shit!?')).to eql '****!?'
      end

      it "filters words from the custom dictionary with symbol keys" do
        Profane.configure(dictionary: { :shit => '' })
        filter = Profane::Filter.new

        expect(filter.filter('shit!?')).to eql '****!?'
      end

      it "filters words from the default dictionary" do
        expect(Profane).to receive(:load_yaml_dictionary).and_return({ 'shit' => '' })
        filter = Profane::Filter.new

        expect(filter.filter('shit!?')).to eql '****!?'
      end
    end

    context "when configured not to use the internal dictionary" do
      before do
        Profane.configure(dictionary: { 'shit' => '' }, use_internal_dictionary: false)
      end

      it "filters words from the custom dictionary" do
        filter = Profane::Filter.new
        expect(filter.filter('shit!?')).to eql '****!?'
      end

      it "doesn't filter words from the default dictionary" do
        filter = Profane::Filter.new
        expect(filter.filter('fuck!?')).to eql 'fuck!?'
      end
    end
  end

  context "#profane?" do
    it "returns false if the phrase is not profane" do
      filter = Profane::Filter.new
      expect(filter.profane?('this is not profane')).to be false
    end

    it "returns false given nil" do
      filter = Profane::Filter.new
      expect(filter.profane?(nil)).to be false
    end

    it "detects the presence of words from the default dictionary" do
      filter = Profane::Filter.new
      expect(filter.profane?('fuck')).to be true
    end

    it "detects the presence of words from the custom dictionary" do
      Profane.configure(dictionary: { 'microsoft' => '' })
      filter = Profane::Filter.new
      expect(filter.profane?('microsoft')).to be true
    end

    it "ignores case" do
      filter = Profane::Filter.new
      expect(filter.profane?('ruby is the SHIT')).to be true
    end

    it "detects profanity in quotes" do
      filter = Profane::Filter.new
      expect(filter.profane?("ruby is the 'SHIT'")).to be true
    end

    it "detects profanity surrounded by non-word characters" do
      filter = Profane::Filter.new
      expect(filter.profane?("ruby is the -SHIT-")).to be true
    end
  end
end
