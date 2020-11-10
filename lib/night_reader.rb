require "./lib/translator"

class NightReader
  attr_reader :translator

  def initialize
    @translator = Translator.new
  end

  def read_braille_and_write_original_file
    braille = File.open(ARGV[0], "r")
    braille_type = braille.read
    braille.close
    english_message = @translator.braille_to_eng(braille_type)
    original_message = File.open(ARGV[1], "w")
    original_message.write(english_message)
    original_message.close
  end


end

night_reader = NightReader.new
night_reader.read_braille_and_write_original_file
# night_reader.message_to_terminal
