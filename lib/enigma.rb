require 'date'
require './lib/decrypter'
require './lib/encrypter'
require './lib/cracker'

class Enigma

  def encrypt(my_message, key = 5.times.map{rand(9)}.join, date = Time.now.strftime("%d%m%y").to_i)
    encrypter = Encrypter.new(my_message, key, date)
    encrypter.encrypt
  end

  def decrypt(output, key = 5.times.map{rand(9)}.join, date = Time.now.strftime("%d%m%y").to_i)
    decrypter = Decrypter.new(output, key, date)
    decrypter.decrypt
  end

  def crack(output, date = Time.now.strftime("%d%m%y").to_i)
    crack = Cracker.new(output, date)
    crack.do_cracker
  end

end
