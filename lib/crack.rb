class Crack

  def initialize(output, date = Time.now.strftime("%d%m%y").to_i)
    @output = output
    @date = date
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

  def find_key_a
    

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

  CHARACTER_MAP = (" ".."z").to_a - ["\\"]



end
