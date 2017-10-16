require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypter'
require 'pry'

class DecrypterTest < Minitest::Test

  def test_it_exists
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_instance_of Decrypter, decrypter
  end

  def test_convert_key_to_digits
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal ["1", "2", "3", "4", "5"], decrypter.convert_key_to_digits
  end

  def test_key_a
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal 12, decrypter.key_a
  end

  def test_key_b
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal 23, decrypter.key_b
  end

  def test_key_c
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal 34, decrypter.key_c
  end

  def test_key_d
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal 45, decrypter.key_d
  end

  # def test_convert_date
  #   decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)
  #
  #   assert_equal 151017, decrypter.convert_date
  # end

  def test_square_date
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal 25926474289, decrypter.square_date
  end

  def test_date_last_four_digits
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal "4289", decrypter.date_last_four_digits
  end

  def test_it_separates_offset_digits
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal ["4","2","8","9"], decrypter.separate_offset_digits
  end

  def test_offset_a
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal 4, decrypter.offset_a
  end

  def test_offset_b
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal 2, decrypter.offset_b
  end

  def test_offset_c
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal 8, decrypter.offset_c
  end

  def test_offset_d
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal 9, decrypter.offset_d
  end

  def test_rotation_a
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal 16, decrypter.rotation_a
  end

  def test_rotation_b
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal 25, decrypter.rotation_b
  end

  def test_rotation_c
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal 42, decrypter.rotation_c
  end

  def test_rotation_d
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal 54, decrypter.rotation_d
  end

  def test_character_map_a
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/"], decrypter.character_map_a
  end

  def test_character_map_b
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal ["9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8"], decrypter.character_map_b
  end

  def test_character_map_c
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal ["J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I"], decrypter.character_map_c
  end

  def test_character_map_d
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal ["V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U"], decrypter.character_map_d
  end

  def test_decrypt_message_a_place
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)
    decrypter.split_message

    assert_equal ["t", "&", "8", "N", " ", "'", "B", "V", "s", "-", "J", "N", "e", "!", "A", "@", "t", "9", "X", "e", "e", ",", "3", "e", "."], decrypter.decrypt_message_a_place
  end

  def test_decrypt_message_b_place
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)
    decrypter.split_message

    assert_equal [")", "h", "8", "N", "0", "i", "B", "V", "(", "o", "J", "N", "u", "c", "A", "@", ")", " ", "X", "e", "u", "n", "3", "e", ">"], decrypter.decrypt_message_b_place
  end

  def test_decrypt_message_c_place
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)
    decrypter.split_message

    assert_equal [")", "&", "i", "N", "0", "'", "s", "V", "(", "-", " ", "N", "u", "!", "r", "@", ")", "9", ".", "e", "u", ",", "d", "e", ">"], decrypter.decrypt_message_c_place
  end

  def test_decrypt_message_d_place
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)
    decrypter.split_message

    assert_equal [")", "&", "8", "s", "0", "'", "B", " ", "(", "-", "J", "s", "u", "!", "A", "e", ")", "9", "X", ".", "u", ",", "3", ".", ">"], decrypter.decrypt_message_d_place
  end

  def test_it_decrypts
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal "this is so secret ..end..", decrypter.decrypt
  end

  def test_it_decrypts
    decrypter = Decrypter.new("x'", 12345)

    assert_equal "hi", decrypter.decrypt
  end

end
