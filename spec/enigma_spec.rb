require './lib/enigma'
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
      # TODO: fix encryption value
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end
end