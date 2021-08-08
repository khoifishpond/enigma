require './lib/enigma'
require 'date'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe Enigma do
  enigma = Enigma.new

  it 'exists' do
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrypt a message' do
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it 'can decrypt a message' do
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  it 'can encrypt a message with just a key' do
    expected = {
      decryption: "keder ohulw",
      key: "02715",
      date: Date.today.strftime("%d%m%y")
    }

    expect(enigma.encrypt("hello world", "02715"))
  end

  it 'can decrypt a message with just a key' do
    encrypted = enigma.encrypt("hello world", "02715")
    expected = {
      decryption: "hello world",
      key: "02715",
      date: Date.today.strftime("%d%m%y")
    }

    expect(enigma.decrypt(encrypted[:encryption], "02715")).to eq(expected)
  end
end