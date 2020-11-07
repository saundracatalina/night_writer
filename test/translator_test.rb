require "minitest/autorun"
require "minitest/pride"
require "./lib/translator"
require "./lib/alphabet"

class TranslatorTest < Minitest::Test
  def test_it_exists_and_has_attributes
    translator = Translator.new

    assert_instance_of Translator, translator 
  end
end
