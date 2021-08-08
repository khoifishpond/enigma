require './lib/shift'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe Shift do
  key = "02715"
  date = "040895"
  shift = Shift.new(key, date)

  it 'exists' do
    expect(shift).to be_a(Shift)
  end

  it 'has a key' do
    expect(shift.key).to eq("02715")
  end

  it 'has a date' do
    expect(shift.date).to eq("040895")
  end
end