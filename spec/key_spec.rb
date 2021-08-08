require './lib/key'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe Key do
  before(:each) do
    @key = Key.new
  end
  
  it 'exists' do
    expect(@key).to be_a(Key)
  end

  it 'has an array of digits' do
    expect(@key.digits).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'can generate a default key' do
    key = double('key')

    allow(key).to receive(:generate).and_return("02715")
  end

  it 'can split up the the default key into 4 smaller keys' do
    key = "02715"

    expect(@key.keys(key)).to eq([02, 27, 71, 15])
  end
end