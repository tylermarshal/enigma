require './lib/encrypter'

    message = File.read(ARGV[0]).chomp
    encrypter = Encrypter.new(message)
    encrypted_message = encrypter.encrypt
    key = encrypter.key
    date = encrypter.date

    output_file = File.open(ARGV[1], 'w')
    output_file.write(encrypted_message)

    puts "Created 'encrypted.txt' with the key #{key} and date #{date}"
