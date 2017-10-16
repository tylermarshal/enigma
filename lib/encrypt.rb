require './lib/encrypter'

    message = File.read(ARGV[0]).chomp
    key = ARGV[2]
    date = ARGV[3]
    encrypter = Encrypter.new(message, key, date)
    encrypted_message = encrypter.encrypt

    output_file = File.open(ARGV[1], 'w')
    output_file.write(encrypted_message)
