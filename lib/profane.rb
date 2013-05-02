require 'yaml'
require 'profane/version'
require 'profane/filter'

module Profane
  DICTIONARY_PATH = File.expand_path('../../config/dictionary.yml', __FILE__)

  def self.configure(options)
    config.merge!(options)
  end

  def self.config
    @config ||= set_default_config
  end

  def self.set_default_config
    @config = { use_internal_dictionary: true }
  end

  def self.dictionary
    stringify_keys(load_dictionary)
  end

  def self.stringify_keys(hash)
    hash.keys.each do |key|
      hash[key.to_s] = hash.delete(key)
    end

    hash
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
    custom_dictionary = load_custom_yaml_dictionary

    if config[:use_internal_dictionary]
      load_internal_yaml_dictionary.merge custom_dictionary
    else
      custom_dictionary
    end
  end

  def self.load_internal_yaml_dictionary
    internal_dictionary = YAML.load(File.read(DICTIONARY_PATH))
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
