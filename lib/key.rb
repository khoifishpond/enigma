class Key
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def self.generate
    digits = (0..9).to_a
    number = ""
    5.times do
      number << digits.sample.to_s
    end
    new(number)
  end

  def keys
    @number.chars.each_cons(2).map do |numbers|
      numbers.join.to_i
    end
  end
end