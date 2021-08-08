require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/message'
require './lib/enigma'

handle = File.open(ARGV[0], 'r')
message = handle.read

enigma = Enigma.new
encryption = enigma.encrypt(message)
enrypted_text = encryption[:encryption]
key = encryption[:key]
date = encryption[:date]

writer = File.open(ARGV[1], 'w')
writer.write(enrypted_text)

handle.close
writer.close

puts "Created 'encrypted.txt' with the key #{key} and date #{date}"