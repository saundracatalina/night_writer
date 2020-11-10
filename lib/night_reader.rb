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
    # @translator.insert_line_breaks_eng(ARGV[1])
  end

  def message_to_terminal
    text = join_file_lines(ARGV[1])
    text_count = text.size
    puts "Created #{ARGV[1].inspect} containing #{text_count} characters"
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

night_reader = NightReader.new
night_reader.read_braille_and_write_original_file
night_reader.message_to_terminal
