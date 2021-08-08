require './lib/key'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe Key do
  key = Key.new

  it 'exists' do
    expect(key).to be_a(Key)
  end

  it 'has an array of digits' do
    expect(key.digits).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'can generate a default key' do
    key = double('key')

    allow(key).to receive(:generate).and_return("02715")
  end
end