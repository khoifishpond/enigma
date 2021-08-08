require './lib/offset'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe Offset do
  offset = Offset.new

  it 'exists' do
    expect(offset).to be_a(Offset)
  end
end