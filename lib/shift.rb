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
    keys.map.with_index do |key, index|
      key + offsets[index]
    end
  end
end