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

    expected_a = ["0.", "..", ".."]
    expected_b = ["0.", "0.", ".."]
    expected_x = ["00", "..", "00"]
    expected_z = ["0.", ".0", "00"]
    expected_space = ["..", "..", ".."]

    assert_equal expected_a, alphabet.letters["a"]
    assert_equal expected_b, alphabet.letters["b"]
    assert_equal expected_x, alphabet.letters["x"]
    assert_equal expected_z, alphabet.letters["z"]
    assert_equal expected_space, alphabet.letters[" "]
  end

  def test_length_of_braille_chars
    alphabet = Alphabet.new

    assert_equal 3, alphabet.letters["a"].length
  end
end
