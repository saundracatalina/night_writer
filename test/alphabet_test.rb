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

  def test_length_of_braille_chars_in_letters_hash
    alphabet = Alphabet.new

    assert_equal 3, alphabet.letters["a"].length
  end

  def test_braille_letters
    alphabet = Alphabet.new

    br_a = ["0.", "..", ".."]
    br_b = ["0.", "0.", ".."]
    br_x = ["00", "..", "00"]
    br_z = ["0.", ".0", "00"]
    br_space = ["..", "..", ".."]

    assert_equal "a", alphabet.braille_letters[br_a]
    assert_equal "b", alphabet.braille_letters[br_b]
    assert_equal "x", alphabet.braille_letters[br_x]
    assert_equal "z", alphabet.braille_letters[br_z]
    assert_equal " ", alphabet.braille_letters[br_space]
  end

  def test_length_of_eng_chars_in_braille_letters_hash
    alphabet = Alphabet.new

    br_a = ["0.", "..", ".."]

    assert_equal 1, alphabet.braille_letters[br_a].length
  end
end
