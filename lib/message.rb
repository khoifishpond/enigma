class Message
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

  def encrypt(shift)
    cipher = ""
    separate.each do |characters|
      characters.each_with_index do |character, index|
        if @alphabet.include?(character)
          cipher << @alphabet[(@alphabet.index(characters[index]) + shift.shifts.values[index]) % @alphabet.size] unless characters[index].nil?
        else
          cipher << character
        end
      end
    end
    cipher
  end

  def decrypt(shift)
    message = ""
    separate.each do |characters|
      characters.each_with_index do |character, index|
        if @alphabet.include?(character)
          message << @alphabet[(@alphabet.index(characters[index]) - shift.shifts.values[index]) % @alphabet.size] unless characters[index].nil?
        else
          message << character
        end
      end
    end
    message
  end
end