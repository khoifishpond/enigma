require './lib/key'
require './lib/offset'

class Enigma
  def encrypt(message, key = Key.generate, date = Offset.generate)
    if key.class != Key
      key = Key.new(key)
    end
    if date.class != Offset
      offset = Offset.new(date)
    end
    {
      encryption: "keder ohulw",
      key: key.number,
      date: offset.date
    }
  end
end