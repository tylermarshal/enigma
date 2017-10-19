require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require_relative 'test_helper'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_it_exists
    e = Enigma.new

    assert_instance_of Enigma, e
  end

  def test_it_encrypts
    e = Enigma.new
    output = e.encrypt("this is so secret ..end..", "12345", Date.today)

    assert_equal ")&8N0'BV(-JNu!A@)9Xeu,3e>", output
  end

  def test_it_encrypts_two_letter
    e = Enigma.new
    output = e.encrypt("hi", 12345)

    assert_equal "x'", output
  end

  def test_it_encrypts_capitals_numbers_special_characters
    e = Enigma.new
    output = e.encrypt("Bl@cK Ha7", 82378)

    assert_equal ">*n`G9v^3", output
  end

  def test_it_decrypts
    e = Enigma.new
    output = e.decrypt(")&8N0'BV(-JNu!A@)9Xeu,3e>", "12345", Date.today)

    assert_equal "this is so secret ..end..", output
  end

  def test_it_decrypts_two_letter
    e = Enigma.new
    output = e.decrypt("x'", 12345)

    assert_equal "hi", output
  end

  def test_it_decrypts_capitals_numbers_special_characters
    e = Enigma.new
    output = e.decrypt(">*n`G9v^3", 82378)

    assert_equal "Bl@cK Ha7", output
  end

  def test_it_cracks
    e = Enigma.new
    output = e.crack(")&8N0'BV(-JNu!A@)9Xeu,3e>", Date.today)

    assert_equal "this is so secret ..end..", output
  end


  def test_it_encrypts_capitals_numbers_special_characters
    e = Enigma.new
    output = e.crack(">*n`G9v^39[+a,6+*")

    assert_equal "Bl@cK Ha7 ..end..", output
  end
end
