require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack'
require 'pry'

class CrackTest < Minitest::Test

  def test_it_exists
    crack = Crack.new("this is so secret ..end..")

    assert_instance_of Crack, crack
  end

  def test_square_date
    crack = Crack.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal 22806134289, crack.square_date
  end

  def test_date_last_four_digits
    crack = Crack.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal "4289", crack.date_last_four_digits
  end

  def test_it_separates_offset_digits
    crack = Crack.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal ["4","2","8","9"], crack.separate_offset_digits
  end

  def test_offset_a
    crack = Crack.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal 4, crack.offset_a
  end

  def test_offset_b
    crack = Crack.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal 2, crack.offset_b
  end

  def test_offset_c
    crack = Crack.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal 8, crack.offset_c
  end

  def test_offset_d
    crack = Crack.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal 9, crack.offset_d
  end

  def test_it_finds_key_a
    crack = Crack.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal 12, crack.find_key_a
  end

end
