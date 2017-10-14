require 'date'

class Encrypter

  attr_reader :my_message, :date, :key

  def initalize(my_message, key = 5.times.map{rand(9)}.join, date = Time.now.strftime("%d%m%y").to_i)
    @my_message = my_message
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
    @my_message.chars.each_with_index do |character, index|


#     hash = Hash.new
# cat dog wombat.each_with_index { |item, index|
#   hash[item] = index
# }
# hash   #=> {"cat"=>0, "dog"=>1, "wombat"=>2}

  end

  def rotate_message_a_place

  end

  def rotate_message_a_place

  end

  def rotate_message_a_place

  end



  CHARACTER_MAP = {
    1	=>	"a",
    2	=>	"b",
    3	=>	"c",
    4	=>	"d",
    5	=>	"e",
    6	=>	"f",
    7	=>	"g",
    8	=>	"h",
    9	=>	"i",
    10	=>	"j",
    11	=>	"k",
    12	=>	"l",
    13	=>	"m",
    14	=>	"n",
    15	=>	"o",
    16	=>	"p",
    17	=>	"q",
    18	=>	"r",
    19	=>	"s",
    20	=>	"t",
    21	=>	"u",
    22	=>	"v",
    23	=>	"w",
    24	=>	"x",
    25	=>	"y",
    26	=>	"z",
    27	=>	0,
    28	=>	1,
    29	=>	2,
    30	=>	3,
    31	=>	4,
    32	=>	5,
    33	=>	6,
    34	=>	7,
    35	=>	8,
    36	=>	9,
    37	=>	0,
    38	=>	" ",
    39	=>	".",
    40	=>	","
  }

end
