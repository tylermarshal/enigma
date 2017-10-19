require 'pry'
require './lib/rotation_generator'
require 'date'

class Cracker


  CHARACTER_MAP = (" ".."z").to_a - ["\\"]

  attr_reader :date
  attr_accessor :output

  def initialize(output, date = Time.now.strftime("%d%m%y").to_i)
    @output = output
    @date = date
  end

  def find_offsets
    rotation_generator = RotationGenerator.new(@key, @date)
    rotation_generator.offset_generator
  end


  def find_key_a
      position = char_last - find_offsets[0] - 14 if @output.length % 4 == 1
      position = char_2nd_to_last - find_offsets[0] - 14 if @output.length % 4 == 2
      position = char_3rd_to_last - find_offsets[0] - 67 if @output.length % 4 == 3
      position = char_4th_to_last - find_offsets[0] - 77 if @output.length % 4 == 0
      position < 0 ? position + 90 : position
  end

  def find_key_b
      position = char_last - find_offsets[1] - 14 if @output.length % 4 == 2
      position = char_2nd_to_last - find_offsets[1] - 14 if @output.length % 4 == 3
      position = char_3rd_to_last - find_offsets[1] - 67 if @output.length % 4 == 0
      position = char_4th_to_last - find_offsets[1] - 77 if @output.length % 4 == 1
      position < 0 ? position + 90 : position
  end

  def find_key_c
      position = char_last - find_offsets[2] - 14 if @output.length % 4 == 3
      position = char_2nd_to_last - find_offsets[2] - 14 if @output.length % 4 == 0
      position = char_3rd_to_last - find_offsets[2] - 67 if @output.length % 4 == 1
      position = char_4th_to_last - find_offsets[2] - 77 if @output.length % 4 == 2
      position < 0 ? position + 90 : position
  end

  def find_key_d
      position = char_last - find_offsets[3] - 14 if @output.length % 4 == 0
      position = char_2nd_to_last - find_offsets[3] - 14 if @output.length % 4 == 1
      position = char_3rd_to_last - find_offsets[3] - 67 if @output.length % 4 == 2
      position = char_4th_to_last - find_offsets[3] - 77 if @output.length % 4 == 3
      position < 0 ? position + 90 : position
  end

  def char_last
    CHARACTER_MAP.index(@output.last)
  end

  def char_2nd_to_last
    CHARACTER_MAP.index(@output[-2])
  end

  def char_3rd_to_last
    CHARACTER_MAP.index(@output[-3])
  end

  def char_4th_to_last
    CHARACTER_MAP.index(@output[-4])
  end

  def find_full_key
    (find_key_a.to_s + find_key_b.to_s[1] + find_key_c.to_s[1] + find_key_d.to_s[1]).to_i
  end

  def rotation_a
    find_key_a + find_offsets[0]
  end

  def rotation_b
    find_key_b + find_offsets[1]
  end

  def rotation_c
    find_key_c + find_offsets[2]
  end

  def rotation_d
    find_key_d + find_offsets[3]
  end

  def character_map_a
    CHARACTER_MAP.rotate(rotation_a)
  end

  def character_map_b
    CHARACTER_MAP.rotate(rotation_b)
  end

  def character_map_c
    CHARACTER_MAP.rotate(rotation_c)
  end

  def character_map_d
    CHARACTER_MAP.rotate(rotation_d)
  end

  def crack_message_a_place
    @output.map!.each_with_index do |letter, location|
      crack_characters_a_place(letter, location)
    end
  end

  def crack_characters_a_place(letter, location)
    if location % 4 == 0
      letter_position = character_map_a.index(letter)
      CHARACTER_MAP[letter_position]
    else
      letter
    end
  end

  def crack_message_b_place
    @output.map!.each_with_index do |letter, location|
      crack_characters_b_place(letter, location)
    end
  end

  def crack_characters_b_place(letter, location)
    if (location - 1) % 4 == 0
      letter_position = character_map_b.index(letter)
      CHARACTER_MAP[letter_position]
    else
      letter
    end
  end

  def crack_message_c_place
    @output.map!.each_with_index do |letter, location|
      crack_characters_c_place(letter, location)
    end
  end

  def crack_characters_c_place(letter, location)
    if (location - 2) % 4 == 0
      letter_position = character_map_c.index(letter)
      CHARACTER_MAP[letter_position]
    else
      letter
    end
  end

  def crack_message_d_place
    @output.map!.each_with_index do |letter, location|
      crack_characters_d_place(letter, location)
    end
  end

  def crack_characters_d_place(letter, location)
    if (location - 3) % 4 == 0
      letter_position = character_map_d.index(letter)
      CHARACTER_MAP[letter_position]
    else
      letter
    end
  end

  def split_message
    @output = @output.chars
  end

  def do_cracker
    split_message
    crack_message_a_place
    crack_message_b_place
    crack_message_c_place
    crack_message_d_place
    @output.join
  end
end
