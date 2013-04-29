require 'yaml'
require 'profane/version'
require 'profane/filter'

module Profane
  @config = {
    use_internal_dictionary: true
  }

  def self.configure(options)
    config.merge!(options)
  end

  def self.config
    @config
  end

  def self.dictionary
    @dictionary ||= load_dictionary
  end

  def self.character
    config[:filter_character] || '*'
  end

  def self.load_dictionary
    yaml_dictionary = load_yaml_dictionary

    if config[:use_internal_dictionary]
      yaml_dictionary.merge (config[:dictionary] || {})
    else
      config[:dictionary]
    end
  end

  def self.load_yaml_dictionary
    internal_dictionary = YAML.load(File.read('config/dictionary.yml'))
    custom_dictionary = load_custom_yaml_dictionary

    if config[:use_internal_dictionary]
      internal_dictionary.merge custom_dictionary
    else
      custom_dictionary
    end
  end

  def self.load_custom_yaml_dictionary
    path = config[:dictionary_file]

    if path && File.exist?(path)
      YAML.load(File.read(config[:dictionary_file]))
    else
      {}
    end
  end
end
