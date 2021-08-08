class Key
  attr_reader :digits
  
  def initialize
    @digits = (0..9).to_a
  end
end