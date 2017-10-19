require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotation_generator'
require_relative 'test_helper'
require 'pry'

class RotationGeneratorTest < Minitest::Test

  def test_key_generator
    rotation_generator = RotationGenerator.new(12345, "191017")

    assert_equal [12,23,34,45], rotation_generator.key_generator
  end

  def test_differe_key_generator
    rotation_generator = RotationGenerator.new(97876, "191017")

    assert_equal [97,78,87,76], rotation_generator.key_generator
  end

  def test_changes_date_squared_last_four_digits_to_chars
    rotation_generator = RotationGenerator.new(12345, "191017")

    assert_equal ["1", "0", "1", "7"], rotation_generator.date_last_four_digits
  end

  def test_changes_different_date_squared_last_four_digits_to_chars
    rotation_generator = RotationGenerator.new(12345, "110515")

    assert_equal ["0", "5", "1", "5"], rotation_generator.date_last_four_digits
  end

  def test_it_changes_date_today
    rotation_generator = RotationGenerator.new(12345, Date.today)

    assert_equal "191017", rotation_generator.convert_date_today
    assert_equal ["1", "0", "1", "7"], rotation_generator.date_last_four_digits
    assert_equal [4,2,8,9], rotation_generator.offset_generator

  end

  def test_offset_generator
    rotation_generator = RotationGenerator.new(12345, "171017")

    assert_equal [4,2,8,9], rotation_generator.offset_generator
  end

  def test_rotation_generator
    rotation_generator = RotationGenerator.new(12345, "171017")

    assert_equal [16, 25, 42, 54], rotation_generator.rotate_generator
  end

end
