require "minitest/autorun"
require "minitest/pride"
require "./lib/translator"
require "./lib/alphabet"

class TranslatorTest < Minitest::Test
  def test_it_exists
    translator = Translator.new

    assert_instance_of Translator, translator
  end

  def test_it_has_attributes
    translator = Translator.new
    expected_hash = {
        "a" => ["0.", "..", ".."],
        "b" => ["0.", "0.", ".."],
        "c" => ["00", "..", ".."],
        "d" => ["00", ".0", ".."],
        "e" => ["0.", ".0", ".."],
        "f" => ["00", "0.", ".."],
        "g" => ["00", "00", ".."],
        "h" => ["0.", "00", ".."],
        "i" => [".0", "0.", ".."],
        "j" => [".0", "00", ".."],
        "k" => ["0.", "..", "0."],
        "l" => ["0.", "0.", "0."],
        "m" => ["00", "..", "0."],
        "n" => ["00", ".0", "0."],
        "o" => ["0.", ".0", "0."],
        "p" => ["00", "0.", "0."],
        "q" => ["00", "00", "0."],
        "r" => ["0.", "00", "0."],
        "s" => [".0", "0.", "0."],
        "t" => [".0", "00", "0."],
        "u" => ["0.", "..", "00"],
        "v" => ["0.", "0.", "00"],
        "w" => [".0", "00", ".0"],
        "x" => ["00", "..", "00"],
        "y" => ["00", ".0", "00"],
        "z" => ["0.", ".0", "00"],
        " " => ["..", "..", ".."]
        }

    assert_equal expected_hash, translator.alphabet.letters
    assert_instance_of Alphabet, translator.alphabet
  end

  def test_can_translate_eng_to_braille
    translator = Translator.new

    expected_a = "0.\n..\n.."
    assert_equal expected_a, translator.eng_to_braille("a")

    expected_word = "0.0.0.0.0.\n00.00.0..0\n....0.0.0."
    assert_equal expected_word, translator.eng_to_braille("hello")

    expected_sentence = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
    assert_equal expected_sentence, translator.eng_to_braille("hello world")
  end

  def test_can_translate_braille_to_eng
    translator = Translator.new

    braille_a = "0.\n..\n.."
    assert_equal "a", translator.braille_to_eng(braille_a)

    braille_hello = "0.0.0.0.0.\n00.00.0..0\n....0.0.0."
    assert_equal "hello", translator.braille_to_eng(braille_hello)

    braille_hello_world = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
    assert_equal "hello world", translator.braille_to_eng(braille_hello_world)
  end

  def test_can_insert_line_breaks_braille
    translator = Translator.new

    expected = "0.0.\n....\n....\n0.\n..\n.."
    assert_equal expected, translator.insert_line_breaks_br("0.0.0.\n......\n......")
  end

  def test_can_insert_line_breaks_eng
    translator = Translator.new

    expected = "aa\na"
    assert_equal expected, translator.insert_line_breaks_eng("aaa")
  end
end
