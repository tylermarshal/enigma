require 'minitest/autorun'
require 'minitest/pride'
require './lib/cracker'
require_relative 'test_helper'
require 'pry'

class CrackerTest < Minitest::Test

  def test_it_exists
    crack = Cracker.new("this is so secret ..end..")

    assert_instance_of Cracker, crack
  end

  def test_it_finds_offsets_when_no_date_provided
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal [4,2,8,9], crack.find_offsets
  end

  def test_it_finds_offsets_when_provided_date
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", "191017")

    assert_equal [4,2,8,9], crack.find_offsets
  end

  def test_it_finds_offsets_date_today
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>", Date.today)

    assert_equal [4,2,8,9], crack.find_offsets
  end

  def test_it_splits_the_output_message
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal [")", "&", "8", "N", "0", "'", "B", "V", "(", "-", "J", "N", "u", "!", "A", "@", ")", "9", "X", "e", "u", ",", "3", "e", ">"], crack.split_message
  end

  def test_it_pulls_correct_characters_index_for_keys
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal 30, crack.char_last
    assert_equal 68, crack.char_2nd_to_last
    assert_equal 19, crack.char_3rd_to_last
    assert_equal 12, crack.char_4th_to_last

  end

  def test_it_finds_keys
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal 12, crack.find_key_a
    assert_equal 23, crack.find_key_b
    assert_equal 34, crack.find_key_c
    assert_equal 45, crack.find_key_d
  end

  def test_it_finds_the_full_key
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal 12345, crack.find_full_key
  end

  def test_character_map_a
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/"], crack.character_map_a
  end

  def test_character_map_b
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal ["9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8"], crack.character_map_b
  end

  def test_character_map_c
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal ["J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I"], crack.character_map_c
  end

  def test_character_map_d
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal ["V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U"], crack.character_map_d
  end

  def test_it_cracks_the_character_a_place
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal "t", crack.crack_characters_a_place(")", 0)
  end

  def test_it_cracks_the_message_a_place
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal ["t", "&", "8", "N", " ", "'", "B", "V", "s", "-", "J", "N", "e", "!", "A", "@", "t", "9", "X", "e", "e", ",", "3", "e", "."], crack.crack_message_a_place
  end

  def test_it_cracks_the_character_b_place
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal "h", crack.crack_characters_b_place("&", 1)
  end

  def test_it_cracks_the_message_b_place
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal [")", "h", "8", "N", "0", "i", "B", "V", "(", "o", "J", "N", "u", "c", "A", "@", ")", " ", "X", "e", "u", "n", "3", "e", ">"], crack.crack_message_b_place
  end

  def test_it_cracks_the_character_c_place
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal "i", crack.crack_characters_c_place("8", 2)
  end

  def test_it_cracks_the_message_c_place
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal [")", "&", "i", "N", "0", "'", "s", "V", "(", "-", " ", "N", "u", "!", "r", "@", ")", "9", ".", "e", "u", ",", "d", "e", ">"], crack.crack_message_c_place
  end

  def test_it_cracks_the_character_d_place
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal "s", crack.crack_characters_d_place("N", 3)
  end

  def test_it_cracks_the_message_d_place
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")
    crack.split_message

    assert_equal [")", "&", "8", "s", "0", "'", "B", " ", "(", "-", "J", "s", "u", "!", "A", "e", ")", "9", "X", ".", "u", ",", "3", ".", ">"], crack.crack_message_d_place
  end

  def test_it_cracks_the_message
    crack = Cracker.new(")&8N0'BV(-JNu!A@)9Xeu,3e>")

    assert_equal "this is so secret ..end..", crack.do_cracker
  end

end
