require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/message'

class Enigma
  def encrypt(message, key = Key.generate, date = Offset.generate)
    message = Message.new(message.downcase)
    key = Key.new(key) if key.class != Key
    date = Offset.new(date) if date.class != Offset
    shift = Shift.new(key.keys, date.offsets)
    {
      encryption: message.encrypt(shift),
      key: key.number,
      date: date.date
    }
  end

  def decrypt(cipher, key, date = Offset.generate)
    cipher = Message.new(cipher.downcase)
    key = Key.new(key) if key.class != Key
    date = Offset.new(date) if date.class != Offset
    shift = Shift.new(key.keys, date.offsets)
    {
      decryption: cipher.decrypt(shift),
      key: key.number,
      date: date.date
    }
  end
end