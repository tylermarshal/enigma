require "pry"
require 'date'

class RotationGenerator

  attr_reader :split_key, :date, :key, :offset, :rotation

  def initialize(key, date)
    @split_key = key.to_s.chars
    @date = date
    @key = []
    @offset = []
    @rotation = []
  end

  def key_generator
    @key << (split_key[0] + split_key[1]).to_i
    @key << (split_key[1] + split_key[2]).to_i
    @key << (split_key[2] + split_key[3]).to_i
    @key << (split_key[3] + split_key[4]).to_i
  end

  def convert_date_today
    if @date == Date.today
      @date = Date.today.strftime("%d%m%y")
    end
  end

  def square_date
    convert_date_today
    @date = (@date.to_i ** 2).to_s
  end

  def date_last_four_digits
    @date[@date.length - 4 ,4].chars
  end

  def offset_generator
    square_date
    @offset << date_last_four_digits[0].to_i
    @offset << date_last_four_digits[1].to_i
    @offset << date_last_four_digits[2].to_i
    @offset << date_last_four_digits[3].to_i
  end

  def rotate_generator
    key_generator
    offset_generator
    @rotation << @key[0] + @offset[0]
    @rotation << @key[1] + @offset[1]
    @rotation << @key[2] + @offset[2]
    @rotation << @key[3] + @offset[3]
  end
end
