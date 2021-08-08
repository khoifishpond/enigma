require './lib/shift'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe Shift do
  shift = Shift.new

  it 'exists' do
    expect(shift).to be_a(Shift)
  end
end