require './lib/enigma'

handle = File.open(ARGV[0], 'r')
cipher = handle.read

enigma = Enigma.new
decryption = enigma.decrypt(cipher, ARGV[2], ARGV[3])
message = decryption[:decryption]

writer = File.open(ARGV[1], 'w')
writer.write(message)

handle.close
writer.close

puts "Created 'decrypted.txt' with the key #{ARGV[2]} and date #{ARGV[3]}"