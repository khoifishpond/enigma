require './lib/key'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe Key do
  key = Key.new

  it 'exists' do
    expect(key).to be_a(Key)
  end
end