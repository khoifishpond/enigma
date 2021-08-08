require 'date'

class Offset
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def self.generate
    new(Date.today.strftime("%d%m%y"))
  end

  def offsets
    date_squared = @date.to_i ** 2
    date_squared.digits.reverse.pop(4)
  end
end