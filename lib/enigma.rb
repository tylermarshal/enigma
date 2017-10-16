require 'date'
require './lib/decrypter'
require './lib/encrypter'
require './lib/cracker'

class Enigma

  def initialize
    @encrypter = Encrypter.new

  end

  def encrypt(my_message, key = 5.times.map{rand(9)}.join, date = Time.now.strftime("%d%m%y").to_i)
    Encrypter.new(my_message, key, date)
  end

end
