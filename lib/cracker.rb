class Cracker

  attr_reader :date
  attr_accessor :output

  def initialize(output, date = Time.now.strftime("%d%m%y").to_i)
    @output = output
    @date = date
  end

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

  def find_key_a
      position = CHARACTER_MAP.index(@output.last) - offset_a - 14 if @output.length % 4 == 1
      position = CHARACTER_MAP.index(@output[-2]) - offset_a - 14 if @output.length % 4 == 2
      position = CHARACTER_MAP.index(@output[-3]) - offset_a - 67 if @output.length % 4 == 3
      position = CHARACTER_MAP.index(@output[-4]) - offset_a - 77 if @output.length % 4 == 0
      position < 0 ? position + 90 : position
  end

  def find_key_b
      position = CHARACTER_MAP.index(@output.last) - offset_b - 14 if @output.length % 4 == 2
      position = CHARACTER_MAP.index(@output[-2]) - offset_b - 14 if @output.length % 4 == 3
      position = CHARACTER_MAP.index(@output[-3]) - offset_b - 67 if @output.length % 4 == 0
      position = CHARACTER_MAP.index(@output[-4]) - offset_b - 77 if @output.length % 4 == 1
      position < 0 ? position + 90 : position
  end

  def find_key_c
      position = CHARACTER_MAP.index(@output.last) - offset_c - 14 if @output.length % 4 == 3
      position = CHARACTER_MAP.index(@output[-2]) - offset_c - 14 if @output.length % 4 == 0
      position = CHARACTER_MAP.index(@output[-3]) - offset_c - 67 if @output.length % 4 == 1
      position = CHARACTER_MAP.index(@output[-4]) - offset_c - 77 if @output.length % 4 == 2
      position < 0 ? position + 90 : position
  end

  def find_key_d
      position = CHARACTER_MAP.index(@output.last) - offset_d - 14 if @output.length % 4 == 0
      position = CHARACTER_MAP.index(@output[-2]) - offset_d - 14 if @output.length % 4 == 1
      position = CHARACTER_MAP.index(@output[-3]) - offset_d - 67 if @output.length % 4 == 2
      position = CHARACTER_MAP.index(@output[-4]) - offset_d - 77 if @output.length % 4 == 3
      position < 0 ? position + 90 : position
  end

  def rotation_a
    find_key_a + offset_a
  end

  def rotation_b
    find_key_b + offset_b
  end

  def rotation_c
    find_key_c + offset_c
  end

  def rotation_d
    find_key_d + offset_d
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
      if location % 4 == 0
        letter_position = character_map_a.index(letter)
        CHARACTER_MAP[letter_position]
      else
        letter
      end
    end
  end

  def crack_message_b_place
    @output.map!.each_with_index do |letter, location|
      if (location - 1) % 4 == 0
        letter_position = character_map_b.index(letter)
        CHARACTER_MAP[letter_position]
      else
        letter
      end
    end
  end

  def crack_message_c_place
    @output.map!.each_with_index do |letter, location|
      if (location - 2) % 4 == 0
        letter_position = character_map_c.index(letter)
        CHARACTER_MAP[letter_position]
      else
        letter
      end
    end
  end

  def crack_message_d_place
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

  def do_cracker
    split_message
    crack_message_a_place
    crack_message_b_place
    crack_message_c_place
    crack_message_d_place
    @output.join
  end

  CHARACTER_MAP = (" ".."z").to_a - ["\\"]
end
