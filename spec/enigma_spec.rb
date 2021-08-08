require './lib/enigma'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe Enigma do
  enigma = Enigma.new

  it 'exists' do
    expect(enigma).to be_a(Enigma)
  end
end