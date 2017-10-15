class Decrypter

  def initialize(output, key, date = Time.now.strftime("%d%m%y").to_i)
    @output = output
    @key = key
    @date = date
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

  def square_date
    @date ** 2
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

  CHARACTER_MAP = (" ".."z").to_a

end
