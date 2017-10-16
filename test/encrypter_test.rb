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

  def test_key_a
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 12, encrypter.key_a
  end

  def test_key_b
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 23, encrypter.key_b
  end

  def test_key_c
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 34, encrypter.key_c
  end

  def test_key_d
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 45, encrypter.key_d
  end

  # def test_convert_date
  #   encrypter = Encrypter.new("this is so secret ..end..", 12345)
  #
  #   assert_equal 151017, encrypter.convert_date
  # end

  def test_square_date
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal 22806134289, encrypter.square_date
  end

  def test_date_last_four_digits
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal "4289", encrypter.date_last_four_digits
  end

  def test_it_separates_offset_digits
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal ["4","2","8","9"], encrypter.separate_offset_digits
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

  def test_character_map_a
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/"], encrypter.character_map_a
  end

  def test_character_map_b
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal ["9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8"], encrypter.character_map_b
  end

  def test_character_map_c
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal ["J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I"], encrypter.character_map_c
  end

  def test_character_map_d
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal ["V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U"], encrypter.character_map_d
  end

  def test_encrypt_message_a_place
    encrypter = Encrypter.new("this is so secret ..end..", 12345)
    encrypter.split_message

    assert_equal [")", "h", "i", "s", "0", "i", "s", " ", "(", "o", " ", "s", "u", "c", "r", "e", ")", " ", ".", ".", "u", "n", "d", ".", ">"], encrypter.encrypt_message_a_place
  end

  def test_encrypt_message_b_place
    encrypter = Encrypter.new("this is so secret ..end..", 12345)
    encrypter.split_message

    assert_equal ["t", "&", "i", "s", " ", "'", "s", " ", "s", "-", " ", "s", "e", "!", "r", "e", "t", "9", ".", ".", "e", ",", "d", ".", "."], encrypter.encrypt_message_b_place
  end

  def test_encrypt_message_c_place
    encrypter = Encrypter.new("this is so secret ..end..", 12345)
    encrypter.split_message

    assert_equal ["t", "h", "8", "s", " ", "i", "B", " ", "s", "o", "J", "s", "e", "c", "A", "e", "t", " ", "X", ".", "e", "n", "3", ".", "."], encrypter.encrypt_message_c_place
  end

  def test_encrypt_message_d_place
    encrypter = Encrypter.new("this is so secret ..end..", 12345)
    encrypter.split_message

    assert_equal ["t", "h", "i", "N", " ", "i", "s", "V", "s", "o", " ", "N", "e", "c", "r", "@", "t", " ", ".", "e", "e", "n", "d", "e", "."], encrypter.encrypt_message_d_place
  end

  def test_it_encrypts
    encrypter = Encrypter.new("this is so secret ..end..", 12345)

    assert_equal ")&8N0'BV(-JNu!A@)9Xeu,3e>", encrypter.encrypt
  end

end
