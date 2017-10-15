require 'date'

class Encrypter

  attr_reader :date, :key
  attr_accessor :my_message

  def initalize(my_message, key = 5.times.map{rand(9)}.join, date = Time.now.strftime("%d%m%y").to_i)
    @my_message = ["t", "h", "i", "s", " ", "i", "s", " ", "s", "o", " ", "s", "e", "c", "r", "e", "t", " ", ".", ".", "e", "n", "d", ".", "."]
    @date = Date.new
    @key = key
  end

  def convert_key_to_digits(key)
    #  @key.to_s.chars
    ["1","2","3","4","5"]
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

  def convert_date
    Time.now.strftime("%d%m%y").to_i
  end

  def square_date
    convert_date ** 2
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

  def rotate_message_a_place
    @my_message.map!.each_with_index do |letter, location|
      if location % 4 == 0
        letter_position = character_map.index(letter)
        character_map_a[letter_position]
      else
        letter
      end
    end
  end

  def rotate_message_b_place
    @my_message.map!.each_with_index do |letter, location|
      if (location - 1) % 4 == 0
        letter_position = character_map.index(letter)
        character_map_b[letter_position]
      else
        letter
      end
    end
  end

  def rotate_message_c_place
    @my_message.map!.each_with_index do |letter, location|
      if (location - 2) % 4 == 0
        letter_position = character_map.index(letter)
        character_map_c[letter_position]
      else
        letter
      end
    end
  end

  def rotate_message_c_place
    @my_message.map!.each_with_index do |letter, location|
      if (location - 3) % 4 == 0
        letter_position = character_map.index(letter)
        character_map_d[letter_position]
      else
        letter
      end
    end
  end

  def character_map_a
    character_map.rotate(rotation_a)
  end

  def character_map_b
    character_map.rotate(rotation_b)
  end

  def character_map_c
    character_map.rotate(rotation_c)
  end

  def character_map_d
    character_map.rotate(rotation_d)
  end


  CHARACTER_MAP = (" ".."z").to_a


end
