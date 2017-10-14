require 'date'

class Enigma

  def initalize
    @encrypter = Encrypter.new

  end

  def encrypt(my_message, key = 5.times.map{rand(9)}.join, date = Time.now.strftime("%d%m%y").to_i)
    Encrypter.new(my_message, key, date)
  end

end
