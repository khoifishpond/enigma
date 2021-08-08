require_relative './spec_helper'
require './lib/message'
require './lib/key'
require './lib/offset'
require './lib/shift'

describe Message do
  message = Message.new("hello world!")
  cipher = Message.new("keder ohulw!")
  key = Key.new("02715")
  offset = Offset.new("040895")
  shift = Shift.new(key.keys, offset.offsets)

  it 'exists' do
    expect(message).to be_a(Message)
  end

  it 'has content' do
    expect(message.content).to eq("hello world!")
  end

  it 'has an alphabet' do
    expect(message.alphabet).to eq(("a".."z").to_a << " ")
  end

  it 'can separate content into arrays of characters' do
    expected = [
      ["h", "e", "l", "l"],
      ["o", " ", "w", "o"],
      ["r", "l", "d", "!"]
    ]
    expect(message.separate).to eq(expected)
  end

  it 'encrypt a message' do
    expect(message.encrypt(shift)).to eq("keder ohulw!")
  end

  it 'can decrypt a message' do
    expect(cipher.decrypt(shift)).to eq("hello world!")
  end
end