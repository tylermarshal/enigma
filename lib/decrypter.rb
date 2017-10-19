require 'pry'
require './lib/rotation_generator'

class Decrypter

  CHARACTER_MAP = (" ".."z").to_a - ["\\"]

  attr_reader :key, :date
  attr_accessor :output

  def initialize(output, key, date = Time.now.strftime("%d%m%y").to_i)
    @output = output
    @key = key
    @date = date
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

  def decrypt_message_a_place
    @output.map!.each_with_index do |letter, location|
      if location % 4 == 0
        letter_position = character_map_a.index(letter)
        CHARACTER_MAP[letter_position]
      else
        letter
      end
    end
  end

  def decrypt_message_b_place
    @output.map!.each_with_index do |letter, location|
      if (location - 1) % 4 == 0
        letter_position = character_map_b.index(letter)
        CHARACTER_MAP[letter_position]
      else
        letter
      end
    end
  end

  def decrypt_message_c_place
    @output.map!.each_with_index do |letter, location|
      if (location - 2) % 4 == 0
        letter_position = character_map_c.index(letter)
        CHARACTER_MAP[letter_position]
      else
        letter
      end
    end
  end

  def decrypt_message_d_place
    @output.map!.each_with_index do |letter, location|
      if (location - 3) % 4 == 0
        letter_position = character_map_d.index(letter)
        CHARACTER_MAP[letter_position]
      else
        letter
      end
    end
  end

  def split_message
    @output = @output.chars
  end

  def decrypt
    split_message
    decrypt_message_a_place
    decrypt_message_b_place
    decrypt_message_c_place
    decrypt_message_d_place
    @output.join
  end
end
