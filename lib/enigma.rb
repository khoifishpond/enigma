require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/message'
require './modules/crackable'

class Enigma
  include Crackable
  
  def encrypt(message, key = Key.generate, date = Offset.generate)
    message = Message.new(message.downcase)
    key = Key.new(key) if key.class != Key
    date = Offset.new(date) if date.class != Offset
    shift = Shift.new(key, date)
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
    shift = Shift.new(key, date)
    {
      decryption: cipher.decrypt(shift),
      key: key.number,
      date: date.date
    }
  end

  def crack(cipher, date = Offset.generate)
    cipher = Message.new(cipher)
    date = Offset.new(date) if date.class != Offset
    key = brute_force(cipher, date)
    shift = Shift.new(key, date)
    {
      decryption: cipher.decrypt(shift),
      date: date.date,
      key: key.number
    }
  end
end