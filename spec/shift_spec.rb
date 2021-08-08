require './lib/shift'
require './lib/key'
require './lib/offset'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe Shift do
  key = Key.new("02715")
  offset = Offset.new("040895")
  shift = Shift.new(key.keys, offset.offsets)

  it 'exists' do
    expect(shift).to be_a(Shift)
  end

  it 'has keys' do
    expect(shift.keys).to eq([02, 27, 71, 15])
  end

  it 'has offsets' do
    expect(shift.offsets).to eq([1, 0, 2, 5])
  end

  it 'can create a hash of four shifts' do
    expected = {
      A: 3,
      B: 27,
      C: 73,
      D: 20
    }

    expect(shift.shifts).to eq(expected)
  end
end