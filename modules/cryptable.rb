module Cryptable
  ALPHABET = ("a".."z").to_a << " "
  
  def rotate(shifts)
    message = ""
    separate.each do |characters|
      characters.each_with_index do |character, index|
        if ALPHABET.include?(character)
          check_index = ALPHABET.index(character)
          rotated_alphabet = ALPHABET.rotate(shifts[index])
          message << rotated_alphabet[check_index]
        else
          message << character
        end
      end
    end
    message
  end

  def encrypt(shift)
    shifts = shift.shifts
    rotate(shifts)
  end

  def decrypt(shift)
    shifts = shift.shifts.map do |shift|
      shift * -1
    end
    rotate(shifts)
  end
end