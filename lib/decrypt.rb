require './lib/decrypter'

output = File.read(ARGV[0]).chomp
key = ARGV[2]
date = ARGV[3]
decrypter = Decrypter.new(output, key, date)
decrypted_output = decrypter.decrypt

output_file = File.open(ARGV[1], 'w')
output_file.write(decrypted_output)

puts "Created 'decrypted.txt' with the key #{key} and date #{date}"
