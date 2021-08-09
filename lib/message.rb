require './modules/cryptable'

class Message
  include Cryptable
  attr_reader :content, :alphabet
  
  def initialize(content)
    @content = content
    @alphabet = ("a".."z").to_a << " "
  end

  def separate
    @content.chars.each_slice(4).map do |array_characters|
      array_characters
    end
  end
end