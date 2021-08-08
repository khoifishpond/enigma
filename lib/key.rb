class Key
  attr_reader :digits

  def initialize
    @digits = (0..9).to_a
  end

  def generate
    @key = ""
    5.times do
      @key << @digits.sample.to_s
    end
    @key
  end

  def keys(key = @key)
    key.chars.each_cons(2).reduce([]) do |array, numbers|
      array << numbers.join.to_i
    end
  end
end