require_relative './spec_helper'
require './lib/key'

describe Key do
  before(:each) do
    @key = Key.new("02715")
  end
  
  it 'exists' do
    expect(@key).to be_a(Key)
  end

  it 'has a number' do
    expect(@key.number).to eq("02715")
  end

  it 'can generate a default key' do
    default_key = Key.generate

    expect(default_key).to be_a(Key)
    expect(default_key.number.size).to eq(5)
  end

  it 'can split the key into an array of 4 smaller keys' do
    expect(@key.keys).to eq([02, 27, 71, 15])
  end
end