require 'minitest/autorun'
require 'minitest/pride'
require './lib/cracker'
require 'pry'

class CrackerTest < Minitest::Test

  def test_it_exists
    crack = Cracker.new("this is so secret ..end..")

    assert_instance_of Cracker, crack
  end

  def test_square_date
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal 25926474289, crack.square_date
  end

  def test_date_last_four_digits
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal "4289", crack.date_last_four_digits
  end

  def test_it_separates_offset_digits
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal ["4","2","8","9"], crack.separate_offset_digits
  end

  def test_offset_a
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal 4, crack.offset_a
  end

  def test_offset_b
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal 2, crack.offset_b
  end

  def test_offset_c
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal 8, crack.offset_c
  end

  def test_offset_d
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal 9, crack.offset_d
  end

  def test_it_finds_key_a
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal 12, crack.find_key_a
  end
  def test_it_finds_key_b
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal 23, crack.find_key_b
  end

  def test_it_finds_key_c
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal 34, crack.find_key_c
  end

  def test_it_finds_key_d
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal 45, crack.find_key_d
  end

  def test_it_cracks
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal "this is so secret ..end..", crack.do_cracker
  end

end
