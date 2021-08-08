require './lib/offset'
require 'date'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe Offset do
  offset = Offset.new

  it 'exists' do
    expect(offset).to be_a(Offset)
  end

  it 'has a present date' do
    present_date = Date.today.strftime("%d%m%y")

    expect(offset.date).to eq(present_date)
  end

  it 'can create four offsets from date' do
    test_date = "040895"

    expect(offset.offsets(test_date)).to eq([1, 0, 2, 5])
  end
end