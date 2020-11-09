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

  # def insert_line_breaks
  #   require "pry"; binding.pry
  #   if join_file_lines(ARGV[1]).size % 12 == 0
  #     "#{first_row.join}\n#{second_row.join}\n#{third_row.join}\n"
  #   else
  #     "#{first_row.join}\n#{second_row.join}\n#{third_row.join}"
  #   end
  # end

  # join_file_lines(ARGV[1])
  # => "0.0.0............."

  # join_file_lines(ARGV[1]).size
  # => 18
  #
  # join_file_lines(ARGV[1])[0]
  # => "0"

  # def eng_to_braille(words)
  #   characters = words[0..-1].chomp.chars
  #   first_row = []
  #   second_row = []
  #   third_row = []
  #   characters.each do |character|
  #     @alphabet.letters.map do |letter, braille|
  #         first_row << braille[0] if letter == character
  #         second_row << braille[1] if letter == character
  #         third_row << braille[2] if letter == character
  #     end
  #   end
  #   braille_type = "#{first_row.join}\n#{second_row.join}\n#{third_row.join}"
  # end

  def join_file_lines(file)
    lines = File.readlines(file)
    line_content = lines.map do |line|
      line.chomp
    end
    text = line_content.join
    text
  end
end
