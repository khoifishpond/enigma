require './lib/message'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe Message do
  message = Message.new

  it 'exists' do
    expect(message).to be_a(Message)
  end
end