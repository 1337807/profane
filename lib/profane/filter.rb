module Profane
  class Filter
    attr_accessor :dictionary, :character, :dictionary_regex

    def initialize
      @dictionary = Profane.dictionary
      @character = Profane.character
      @dictionary_regex = /#{'(\b' + dictionary.keys.join('\b|\b') + '\b)'}/
    end

    def filter(phrase)
      new_phrase = phrase.split(' ').map do |word|
        cleanse!(word)
      end

      Array(new_phrase).join(' ')
    end

    def one_profane?(phrase)
      keys = dictionary.keys
      phrase.split(' ').each { |word| return true if keys.include? word }
      false
    end

    def two_profane?(phrase)
      dictionary.keys.each do |key|
        return true if phrase.include? " #{key} "
      end
      false
    end

    def three_profane?(phrase)
      dictionary.keys.each do |key|
        return true if phrase =~ /\b#{key}\b/
      end
      false
    end

    def four_profane?(phrase)
      return true if phrase.match(dictionary_regex)
      false
    end

    def five_profane?(phrase)
      phrase = phrase.split(' ')

      dictionary.keys.each do |key|
        return true if phrase.grep(key)
      end
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
