require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_it_exists
    e = Enigma.new

    assert_instance_of Enigma, e
  end

  def test_convert_key_to_digits
    e = Enigma.new

    assert_equal ["1", "2", "3", "4", "5"], e.convert_key_to_digits(12345)
  end


end
