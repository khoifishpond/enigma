module Cryptable
  def encrypt(shift)
    cipher = ""
    shifts = shift.shifts.values
    separate.each do |characters|
      characters.each_with_index do |character, index|
        if @alphabet.include?(character)
          check_index = @alphabet.index(character)
          rotated_alphabet = @alphabet.rotate(shifts[index])
          cipher << rotated_alphabet[check_index]
        else
          cipher << character
        end
      end
    end
    cipher
  end

  def decrypt(shift)
    message = ""
    shifts = shift.shifts.values
    separate.each do |characters|
      characters.each_with_index do |character, index|
        if @alphabet.include?(character)
          check_index = @alphabet.index(character)
          rotated_alphabet = @alphabet.rotate(-shifts[index])
          message << rotated_alphabet[check_index]
        else
          message << character
        end
      end
    end
    message
  end
end