require "./lib/alphabet"

class Translator
  attr_reader :alphabet

  def initialize
    @alphabet = Alphabet.new
  end

  def eng_to_braille(words)
    characters = words[0..-1].chomp.chars
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
    # require "pry"; binding.pry
    # until third_row.length == 2
    # require "pry"; binding.pry
    # end
  end

  def join_file_lines(file)
    lines = File.readlines(file)
    line_content = lines.map do |line|
      line.chomp
    end
    text = line_content.join
    text
  end
end
