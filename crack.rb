require './lib/enigma'

handle = File.open(ARGV[0], 'r')
cipher = handle.read

enigma = Enigma.new
cracked = enigma.crack(cipher, ARGV[2])
message = cracked[:decryption]
key = cracked[:key]

writer = File.open(ARGV[1], 'w')
writer.write(message)

handle.close
writer.close

puts "Created '#{ARGV[1]}' with a cracked key #{key} and date #{ARGV[2]}"