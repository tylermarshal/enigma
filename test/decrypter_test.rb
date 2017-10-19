require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypter'
require_relative 'test_helper'
require 'pry'

class DecrypterTest < Minitest::Test

  def test_it_exists
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_instance_of Decrypter, decrypter
  end

  def test_it_splits_message
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal [")", "&", "8", "N", "0", "'", "B", "V", "(", "-", "J", "N", "u", "!", "A", "@", ")", "9", "X", "e", "u", ",", "3", "e", ">"], decrypter.split_message
  end

  def test_it_finds_rotations
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345, Date.today)

    assert_equal [16, 25, 42, 54], decrypter.find_rotations
  end

  def test_it_finds_different_rotations
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 23434, "110813")

    assert_equal [23, 43, 49, 43], decrypter.find_rotations
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

  def test_decrypt_character_a_place
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal "t", decrypter.decrypt_characters_a_place(")", 0)
  end

  def test_decrypt_message_a_place
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)
    decrypter.split_message

    assert_equal ["t", "&", "8", "N", " ", "'", "B", "V", "s", "-", "J", "N", "e", "!", "A", "@", "t", "9", "X", "e", "e", ",", "3", "e", "."], decrypter.decrypt_message_a_place
  end

  def test_decrypt_character_b_place
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal "h", decrypter.decrypt_characters_b_place("&", 1)
  end

  def test_decrypt_message_b_place
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)
    decrypter.split_message

    assert_equal [")", "h", "8", "N", "0", "i", "B", "V", "(", "o", "J", "N", "u", "c", "A", "@", ")", " ", "X", "e", "u", "n", "3", "e", ">"], decrypter.decrypt_message_b_place
  end

  def test_decrypt_character_c_place
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal "i", decrypter.decrypt_characters_c_place("8", 2)
  end

  def test_decrypt_message_c_place
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)
    decrypter.split_message

    assert_equal [")", "&", "i", "N", "0", "'", "s", "V", "(", "-", " ", "N", "u", "!", "r", "@", ")", "9", ".", "e", "u", ",", "d", "e", ">"], decrypter.decrypt_message_c_place
  end

  def test_decrypt_character_d_place
    decrypter = Decrypter.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", 12345)

    assert_equal "s", decrypter.decrypt_characters_d_place("N", 3)
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

  def test_it_decrypts_two_letter
    decrypter = Decrypter.new("x'", 12345)

    assert_equal "hi", decrypter.decrypt
  end

  def test_it_decrypts_capitals_numbers_special_characters
    decrypter = Decrypter.new(">*n`G9v^3", 82378)

    assert_equal "Bl@cK Ha7", decrypter.decrypt
  end

end
