require "./lib/translator"
require "./lib/alphabet"

class NightWriter
  attr_reader :translator,
              :alphabet

  def initialize
    @translator = Translator.new
    @alphabet = Alphabet.new
  end

  def read_and_write_new_file
    message = File.open(ARGV[0], "r")
    english = message.readlines
    message.close

    translated_message = @translator.eng_to_braille(english)
    braille = File.open(ARGV[1], "w")
    braille.write(translated_message)
    braille.close
  end
end

nightwriter = NightWriter.new
nightwriter.read_and_write_new_file
