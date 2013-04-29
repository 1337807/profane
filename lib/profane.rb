require 'profane/version'
require 'profane/filter'

module Profane
  @config = {}

  def self.configure(options)
    @config.merge!(options)
  end

  def self.config
    @config
  end
end
