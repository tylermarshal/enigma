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
  27	=>	"0",
  28	=>	"1",
  29	=>	"2",
  30	=>	"3",
  31	=>	"4",
  32	=>	"5",
  33	=>	"6",
  34	=>	"7",
  35	=>	"8",
  36	=>	"9",
  37	=>	"0",
  38	=>	" ",
  39	=>	".",
  40	=>	","
}

character_map = (" ".."z").to_a
character_map_a = character_map.rotate(16)
character_map_b = character_map.rotate(25)
character_map_c = character_map.rotate(42)
character_map_d = character_map.rotate(54)
message =  "this is so secret ..end..".chars

message =  "this is so secret ..end.."
count = 0
while count < message.length
  letter_position = character_map.index(message[count])
  message[count] = character_map_a[letter_position]
  count += 4
end


character_map = (" ".."z").to_a
character_map_a = character_map.rotate(108)
character_map_b = character_map.rotate(25)
character_map_c = character_map.rotate(42)
character_map_d = character_map.rotate(54)
message =  "this is so secret ..end..".chars

message.map!.each_with_index do |letter, location|
  if location % 4 == 0
    letter_position = character_map.index(letter)
    character_map_a[letter_position]
  else
    letter
  end
end

message.map!.each_with_index do |letter, location|
  if (location - 1) % 4 == 0
    letter_position = character_map.index(letter)
    character_map_b[letter_position]
  else
    letter
  end
end

message.map!.each_with_index do |letter, location|
  if (location - 2) % 4 == 0
    letter_position = character_map.index(letter)
    character_map_c[letter_position]
  else
    letter
  end
end

message.map!.each_with_index do |letter, location|
  if (location - 3) % 4 == 0
    letter_position = character_map.index(letter)
    character_map_d[letter_position]
  else
    letter
  end
end





@output.map!.each_with_index do |letter, location|
  if location % 4 == 0
    letter_position = character_map_a.index(letter)
    CHARACTER_MAP[letter_position]
  else
    letter
  end
end

every_4th = []
last_one = []
output.each_with_index do |letter, location|
  every_4th = []
  if location % 4 == 0
    every_4th << letter
    last_one = every_4th.last
  end
  last_one
end

output = ")&8N0'BV(-JNu!A@)9Xeu,3e>"
output_length_remainder = output.length % 4
if output_length_remainder == 1
  CHARACTER_MAP.index(output.last) - 14
elsif output_length_remainder == 2
  14
elsif output_length_remainder == 3
  67
else
  77
end
