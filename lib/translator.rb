require "./lib/alphabet"

class Translator
  attr_reader :alphabet

  def initialize
    @alphabet = Alphabet.new
  end

  def eng_to_braille(words)
    characters = words[0..-1].chars
    first_row = []
    second_row = []
    third_row = []
    characters.each do |character|
      @alphabet.letters.each do |letter, braille|
        first_row << braille[0] if letter == character
        second_row << braille[1] if letter == character
        third_row << braille[2] if letter == character
      end
    end
    braille_type = "#{first_row.join}\n#{second_row.join}\n#{third_row.join}"
  end
end
