require "./lib/translator"

class NightWriter
  attr_reader :translator


  def initialize
    @translator = Translator.new
  end

  def read_and_write_new_file
    message = File.open(ARGV[0], "r")
    english = message.read
    message.close
    translated_message = @translator.eng_to_braille(english)
    braille = File.open(ARGV[1], "w")
    braille.write(translated_message)
    braille.close
  end

  # def join_file_lines
  #   lines = File.readlines(ARGV[1])
  #   line_content = lines.map do |line|
  #     line.chomp
  #   end
  #   text = line_content.join
  #   text
  # end

  def message_to_terminal
    text = translator.join_file_lines(ARGV[1])
    text_count = text.size
    puts "Created #{ARGV[1].inspect} containing #{text_count} characters"
  end

  # def message_to_terminal
  #   lines = File.readlines(ARGV[1])
  #   line_content = lines.map do |line|
  #     line.chomp
  #   end
  #   text = line_content.join
  #   text_count = text.size
  #   puts "Created #{ARGV[1].inspect} containing #{text_count} characters"
  # end
end

nightwriter = NightWriter.new
nightwriter.read_and_write_new_file
nightwriter.message_to_terminal
