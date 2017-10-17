class KeyFinder

  def initalize(key)
    @key = key
  end


  def convert_key_to_digits
     @key.to_s.chars
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


end
