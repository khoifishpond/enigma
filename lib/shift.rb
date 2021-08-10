class Shift
  attr_reader :key, :offset
  
  def initialize(key, offset)
    @key = key
    @offset = offset
  end

  def keys
    @key.keys
  end

  def offsets
    @offset.offsets
  end

  def shifts
    shifts = []
    keys.each_with_index do |key, index|
      shifts << key + offsets[index]
    end
    shifts
  end
end