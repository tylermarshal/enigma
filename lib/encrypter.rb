require 'date'

class Encrypter

  attr_reader :date, :key
  attr_accessor :my_message

  def initialize(my_message, key = 5.times.map{rand(10)}.join, date = Time.now.strftime("%d%m%y").to_i)
    @my_message = my_message
    @date = date
    @key = key
  end

  def convert_key_to_digits
     @key.to_s.chars
  end

  def key_a
    split_key = convert_key_to_digits
    a = split_key[0] + split_key[1]
    a.to_i
  end

  def key_b
    split_key = convert_key_to_digits
    b = split_key[1] + split_key[2]
    b.to_i
  end

  def key_c
    split_key = convert_key_to_digits
    c = split_key[2] + split_key[3]
    c.to_i
  end

  def key_d
    split_key = convert_key_to_digits
    d = split_key[3] + split_key[4]
    d.to_i
  end

  # def convert_date
  #   Time.now.strftime("%d%m%y").to_i
  # end

  def square_date
    @date.to_i ** 2
  end

  def date_last_four_digits
    date = square_date.to_s
    date[date.length - 4 ,4]
  end

  def separate_offset_digits
    date_last_four_digits.chars
  end

  def offset_a
    separate_offset_digits[0].to_i
  end

  def offset_b
    separate_offset_digits[1].to_i
  end

  def offset_c
    separate_offset_digits[2].to_i
  end

  def offset_d
    separate_offset_digits[3].to_i
  end

  def rotation_a
    key_a + offset_a
  end

  def rotation_b
    key_b + offset_b
  end

  def rotation_c
    key_c + offset_c
  end

  def rotation_d
    key_d + offset_d
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

  def encrypt_message_a_place
    @my_message.map!.each_with_index do |letter, location|
      if location % 4 == 0
        letter_position = CHARACTER_MAP.index(letter)
        character_map_a[letter_position]
      else
        letter
      end
    end
  end

  def encrypt_message_b_place
    @my_message.map!.each_with_index do |letter, location|
      if (location - 1) % 4 == 0
        letter_position = CHARACTER_MAP.index(letter)
        character_map_b[letter_position]
      else
        letter
      end
    end
  end

  def encrypt_message_c_place
    @my_message.map!.each_with_index do |letter, location|
      if (location - 2) % 4 == 0
        letter_position = CHARACTER_MAP.index(letter)
        character_map_c[letter_position]
      else
        letter
      end
    end
  end

  def encrypt_message_d_place
    @my_message.map!.each_with_index do |letter, location|
      if (location - 3) % 4 == 0
        letter_position = CHARACTER_MAP.index(letter)
        character_map_d[letter_position]
      else
        letter
      end
    end
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

  CHARACTER_MAP = (" ".."z").to_a - ["\\"]
end
