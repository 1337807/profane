module Profane
  class Filter
    attr_reader :dictionary, :character

    def initialize
      @dictionary = Profane.dictionary
      @character = Profane.character
    end

    def filter(phrase)
      new_phrase = phrase.split(' ').map do |word|
        if value = dictionary[word.match(/\w+/).to_s]
          if value == ''
            word.gsub(/\w/, character)
          else
            value
          end
        else
          word
        end
      end

      Array(new_phrase).join(' ')
    end
  end
end
