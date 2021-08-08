require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/message'

class Enigma
  def encrypt(message, key = Key.generate, date = Offset.generate)
    message = Message.new(message.downcase)
    if key.class != Key
      key = Key.new(key)
    end
    if date.class != Offset
      offset = Offset.new(date)
    end
    shift = Shift.new(key.keys, offset.offsets)
    {
      encryption: message.encrypt(shift),
      key: key.number,
      date: offset.date
    }
  end

  def decrypt(cipher, key, date = Offset.generate)
    cipher = Message.new(cipher.downcase)
    if key.class != Key
      key = Key.new(key)
    end
    if date.class != Offset
      offset = Offset.new(date)
    end
    shift = Shift.new(key.keys, offset.offsets)
    {
      decryption: cipher.decrypt(shift),
      key: key.number,
      date: offset.date
    }
  end
end