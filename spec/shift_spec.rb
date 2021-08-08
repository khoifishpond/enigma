require './lib/shift'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe Shift do
  key = "02715"
  shift = Shift.new(key)

  it 'exists' do
    expect(shift).to be_a(Shift)
  end

  it 'has a key' do
    expect(shift.key).to eq("02715")
  end
end