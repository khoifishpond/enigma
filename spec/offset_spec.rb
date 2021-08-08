require_relative './spec_helper'
require './lib/offset'
require 'date'

describe Offset do
  offset = Offset.new("040895")

  it 'exists' do
    expect(offset).to be_a(Offset)
  end

  it 'has a date' do
    expect(offset.date).to eq("040895")
  end

  it 'can generate a default date' do
    default_date = Offset.generate
    present_date = Date.today.strftime("%d%m%y")

    expect(default_date.date).to eq(present_date)
  end

  it 'can create four offsets from date' do
    expect(offset.offsets).to eq([1, 0, 2, 5])
  end
end