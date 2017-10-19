require 'date'
require './lib/rotation_generator'

class Encrypter

  CHARACTER_MAP = (" ".."z").to_a - ["\\"]

  attr_reader :date, :key
  attr_accessor :my_message

  def initialize(my_message, key = 5.times.map{rand(10)}.join, date = Time.now.strftime("%d%m%y").to_i)
    @my_message = my_message
    @date = date
    @key = key
  end

  def find_rotations
    rotation_generator = RotationGenerator.new(@key, @date)
    rotation_generator.rotate_generator
  end

  def character_map_a
    CHARACTER_MAP.rotate(find_rotations[0])
  end

  def character_map_b
    CHARACTER_MAP.rotate(find_rotations[1])
  end

  def character_map_c
    CHARACTER_MAP.rotate(find_rotations[2])
  end

  def character_map_d
    CHARACTER_MAP.rotate(find_rotations[3])
  end

  def encrypt_message_a_place
    @my_message.map!.each_with_index do |letter, location|
      encrypt_characters_a_place(letter, location)
    end
  end

  def encrypt_characters_a_place(letter, location)
    if location % 4 == 0
      letter_position = CHARACTER_MAP.index(letter)
      character_map_a[letter_position]
    else
      letter
    end
  end

  def encrypt_message_b_place
    @my_message.map!.each_with_index do |letter, location|
      encrypt_characters_b_place(letter, location)
    end
  end

  def encrypt_characters_b_place(letter, location)
    if (location - 1) % 4 == 0
      letter_position = CHARACTER_MAP.index(letter)
      character_map_b[letter_position]
    else
      letter
    end
  end

  def encrypt_message_c_place
    @my_message.map!.each_with_index do |letter, location|
      encrypt_characters_c_place(letter, location)
    end
  end

  def encrypt_characters_c_place(letter, location)
    if (location - 2) % 4 == 0
      letter_position = CHARACTER_MAP.index(letter)
      character_map_c[letter_position]
    else
      letter
    end
  end

  def encrypt_message_d_place
    @my_message.map!.each_with_index do |letter, location|
      encrypt_characters_d_place(letter, location)
    end
  end

  def encrypt_characters_d_place(letter, location)
    if (location - 3) % 4 == 0
      letter_position = CHARACTER_MAP.index(letter)
      character_map_d[letter_position]
    else
      letter
    end
  end

  def split_message
    @my_message = @my_message.chars
  end

  def encrypt
    split_message
    encrypt_message_a_place
    encrypt_message_b_place
    encrypt_message_c_place
    encrypt_message_d_place
    @my_message.join
  end
end
