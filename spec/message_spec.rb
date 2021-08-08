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

  it 'can separate content into arrays of characters' do
    expected = [
      ["h", "e", "l", "l"],
      ["o", " ", "w", "o"],
      ["r", "l", "d"]
    ]
    expect(message.separate).to eq(expected)
  end
end