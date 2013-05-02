module Profane
  class Filter
    attr_accessor :dictionary, :character, :dictionary_regex

    def initialize
      @dictionary = Profane.dictionary
      @character = Profane.character
    end

    def filter(phrase)
      new_phrase = phrase.split(/\s/).map do |word|
        cleanse!(word)
      end

      Array(new_phrase).join(' ')
    end

    def profane?(phrase)
      phrase = phrase.downcase.split(/\s+/)

      dictionary.keys.each do |key|
        return true unless phrase.grep(/(\b|\W)#{key.downcase}(\b|\W)/).empty?
      end

      false
    end

    def cleanse!(word)
      value = dictionary[word.match(/\w+/).to_s]
      return word unless value

      if value == ''
        word.gsub!(/\w/, character)
      else
        value
      end
    end
  end
end
