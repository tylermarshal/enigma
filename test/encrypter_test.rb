require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypter'
require 'pry'

class EncrypterTest < Minitest::Test

  def test_it_exists
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_instance_of Encrypter, encrypter
  end

  def test_convert_key_to_digits
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal ["1", "2", "3", "4", "5"], encrypter.convert_key_to_digits
  end

  def test_convert_date
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 151017, encrypter.convert_date
  end

  def test_square_date
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 22806134289, encrypter.square_date
  end

  def test_date_last_four_digits
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal "4289", encrypter.date_last_four_digits
  end

  def test_offset_a
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 4, encrypter.offset_a
  end

  def test_offset_b
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 2, encrypter.offset_b
  end

  def test_offset_c
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 8, encrypter.offset_c
  end

  def test_offset_d
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 9, encrypter.offset_d
  end

  def test_rotation_a
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 16, encrypter.rotation_a
  end

  def test_rotation_b
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 25, encrypter.rotation_b
  end

  def test_rotation_c
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 42, encrypter.rotation_c
  end

  def test_rotation_d
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 54, encrypter.rotation_d
  end

  def test_it_separates_offset_digits
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal ["4","2","8","9"], encrypter.separate_offset_digits
  end

  def test_it_encrypts
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal ")&8N0'BV(-JNu!A@)9Xdu,3d>", encrypter.encrypt
  end

end
