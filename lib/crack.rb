require './lib/cracker'

output = File.read(ARGV[0]).chomp
date = ARGV[2]
cracker = Cracker.new(output, date)
cracked_output = cracker.do_cracker
key = cracker.find_full_key

output_file = File.open(ARGV[1], 'w')
output_file.write(cracked_output)

puts "Created 'cracked.txt' with the cracked key #{key} and date #{date}"
