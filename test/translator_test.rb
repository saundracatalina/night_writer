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
        "a" => ["0.\n", "..\n", ".."],
        "b" => ["0.\n", "0.\n", ".."],
        "c" => ["00\n", "..\n", ".."],
        "d" => ["00\n", ".0\n", ".."],
        "e" => ["0.\n", ".0\n", ".."],
        "f" => ["00\n", "0.\n", ".."],
        "g" => ["00\n", "00\n", ".."],
        "h" => ["0.\n", "00\n", ".."],
        "i" => [".0\n", "0.\n", ".."],
        "j" => [".0\n", "00\n", ".."],
        "k" => ["0.\n", "..\n", "0."],
        "l" => ["0.\n", "0.\n", "0."],
        "m" => ["00\n", "..\n", "0."],
        "n" => ["00\n", ".0\n", "0."],
        "o" => ["0.\n", ".0\n", "0."],
        "p" => ["00\n", "0.\n", "0."],
        "q" => ["00\n", "00\n", "0."],
        "r" => ["0.\n", "00\n", "0."],
        "s" => [".0\n", "0.\n", "0."],
        "t" => [".0\n", "00\n", "0."],
        "u" => ["0.\n", "..\n", "00"],
        "v" => ["0.\n", "0.\n", "00"],
        "w" => [".0\n", "00\n", ".0"],
        "x" => ["00\n", "..\n", "00"],
        "y" => ["00\n", ".0\n", "00"],
        "z" => ["0.\n", ".0\n", "00"],
        }

    assert_equal expected_hash, translator.alphabet.eng_to_braille
    assert_instance_of Alphabet, translator.alphabet
  end
end
