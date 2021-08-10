module Cryptable
  def rotate(shifts)
    message = ""
    separate.each do |characters|
      characters.each_with_index do |character, index|
        if @alphabet.include?(character)
          check_index = @alphabet.index(character)
          rotated_alphabet = @alphabet.rotate(shifts[index])
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