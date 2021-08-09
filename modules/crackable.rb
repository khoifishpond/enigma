require './lib/key'
require './lib/message'

module Crackable
  def brute_force(cipher, date)
    key = Key.generate
    shift = Shift.new(key, date)
    until cipher.decrypt(shift).end_with?(" end") do
      cracked_key = Key.generate
      shift = Shift.new(cracked_key, date)
    end
    cracked_key
  end
end