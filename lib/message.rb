class Message
  attr_reader :content
  
  def initialize(content)
    @content = content
  end

  def separate
    @content.chars.each_slice(4).map do |array_characters|
      array_characters
    end
  end
end