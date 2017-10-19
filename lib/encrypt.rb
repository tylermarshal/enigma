require './lib/encrypter'
require 'pry'

    message = File.readlines(ARGV[0])
    final_message = "#{message[0].chomp}"
    message.shift
    message.each do |line|
      final_message = final_message += " "
      final_message = final_message += line.chomp
    end
    
    encrypter = Encrypter.new(final_message)
    encrypted_message = encrypter.encrypt
    key = encrypter.key
    date = encrypter.date

    output_file = File.open(ARGV[1], 'w')
    output_file.write(encrypted_message)

    puts "Created 'encrypted.txt' with the key #{key} and date #{date}"
