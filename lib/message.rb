class Message
  attr_reader :content, :alphabet
  
  def initialize(content)
    @content = content
    @alphabet = ("a".."z").to_a << " "
  end

  def separate
    @chunks = @content.chars.each_slice(4).map do |array_characters|
      array_characters
    end
  end

  def encrypt(shift)
    something = ""
    @chunks.each do |chunk|
      a = @alphabet[(@alphabet.index(chunk[0]) + shift.shifts[:A]) % @alphabet.size] unless chunk[0].nil?
      b = @alphabet[(@alphabet.index(chunk[1]) + shift.shifts[:B]) % @alphabet.size] unless chunk[1].nil?
      c = @alphabet[(@alphabet.index(chunk[2]) + shift.shifts[:C]) % @alphabet.size] unless chunk[2].nil?
      d = @alphabet[(@alphabet.index(chunk[3]) + shift.shifts[:D]) % @alphabet.size] unless chunk[3].nil?
      something << [a, b, c, d].compact.join
    end
    something
  end
end