require "minitest/autorun"
require "minitest/pride"
require "./lib/alphabet"

class AlphabetTest < Minitest::Test
  def test_it_exists
    alphabet = Alphabet.new

    assert_instance_of Alphabet, alphabet
  end

  def test_eng_to_braille
    alphabet = Alphabet.new

    expected = ["0.\n", "..\n", ".."]
    assert_equal expected, alphabet.characters["a"]
  end
end
