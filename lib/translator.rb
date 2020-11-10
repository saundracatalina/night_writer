require "./lib/alphabet"

class Translator
  attr_reader :alphabet

  def initialize
    @alphabet = Alphabet.new
  end

  def eng_to_braille(words)
    first_row = []
    second_row = []
    third_row = []
    characters = words[0..-1].chomp.chars
    characters.each do |character|
      @alphabet.letters.map do |letter, braille|
          first_row << braille[0] if letter == character
          second_row << braille[1] if letter == character
          third_row << braille[2] if letter == character
      end
    end
    braille_type = "#{first_row.join}\n#{second_row.join}\n#{third_row.join}"
  end

  def braille_to_eng(braille_words)
    rows = braille_words.split("\n")
    collection = []
    rows.each_slice(3) do |rows|
      until rows[-1].empty? do
        rows.each do |row|
          collection << row.slice!(0..1)
        end
      end
    end

    word = collection.each_slice(3).to_a

    word.map do |letter|
      @alphabet.braille_letters[letter]
    end.join
  end



  # def insert_line_breaks(braille)
  # maybe use .chars to create an array to work with
  #   test = braille.insert(6, "\n")
  #   braille.insert(13, "\n")
  # end

  # def insert_line_breaks
  #   require "pry"; binding.pry
  #   if join_file_lines(ARGV[1]).size % 12 == 0
  #     "#{first_row.join}\n#{second_row.join}\n#{third_row.join}\n"
  #   else
  #     "#{first_row.join}\n#{second_row.join}\n#{third_row.join}"
  #   end
  # end


end
