require './lib/message'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe Message do
  message = Message.new("hello world")

  it 'exists' do
    expect(message).to be_a(Message)
  end

  it 'has content' do
    expect(message.content).to eq("hello world")
  end
end