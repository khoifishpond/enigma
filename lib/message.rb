require './modules/cryptable'

class Message
  include Cryptable
  attr_reader :content
  
  def initialize(content)
    @content = content
  end

  def separate
    @content.chars.each_slice(4).map do |characters|
      characters
    end
  end
end