require_relative './spec_helper'
require './lib/enigma'
require './lib/offset'
require 'date'

describe Enigma do
  enigma = Enigma.new

  it 'exists' do
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrypt a message' do
    encrypted = enigma.encrypt("hello world", "02715", "040895")
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    expect(encrypted).to eq(expected)
  end

  it 'can decrypt a message' do
    encrypted = enigma.decrypt("keder ohulw", "02715", "040895")
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    expect(encrypted).to eq(expected)
  end

  it 'can encrypt a message with just a key' do
    encrypted = enigma.encrypt("hello world", "02715")
    expected = {
      encryption: encrypted[:encryption],
      key: "02715",
      date: encrypted[:date]
    }

    expect(encrypted).to eq(expected)
  end

  it 'can decrypt a message with just a key' do
    encrypted = enigma.encrypt("hello world", "02715")
    expected = {
      decryption: "hello world",
      key: "02715",
      date: encrypted[:date]
    }

    expect(enigma.decrypt(encrypted[:encryption], "02715")).to eq(expected)
  end

  it "can encrypt a message with a random key and today's date" do
    encrypted = enigma.encrypt("hello world")
    expected = {
      encryption: encrypted[:encryption],
      key: encrypted[:key],
      date: encrypted[:date]
    }

    expect(encrypted).to eq(expected)
  end

  it 'can brute force its way to a cracked key' do
    encrypted = enigma.encrypt("hello world end", "08304", "291018")
    date = Offset.new("291018")
    cipher = Message.new(encrypted[:encryption])

    expect(enigma.brute_force(cipher, date).number).to eq("08304")
  end

  it 'can crack an encryption with a date' do
    encrypted = enigma.encrypt("hello world end", "08304", "291018")
    expected = {
      decryption: "hello world end",
      date: "291018",
      key: "08304"
    }
    
    expect(enigma.crack(encrypted[:encryption], "291018")).to eq(expected)
  end
end