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

    expected_a = ["0.\n", "..\n", ".."]
    expected_b = ["0.\n", "0.\n", ".."]
    expected_x = ["00\n", "..\n", "00"]
    expected_z = ["0.\n", ".0\n", "00"]

    assert_equal expected_a, alphabet.characters["a"]
    assert_equal expected_b, alphabet.characters["b"]
    assert_equal expected_x, alphabet.characters["x"]
    assert_equal expected_z, alphabet.characters["z"]
  end

  def test_length_of_braille_chars
    alphabet = Alphabet.new
    
    assert_equal 3, alphabet.characters["a"].length
  end
end
