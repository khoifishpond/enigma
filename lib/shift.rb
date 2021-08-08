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
    shifts = {}
    shifts[:A] = keys[0] + offsets[0]
    shifts[:B] = keys[1] + offsets[1]
    shifts[:C] = keys[2] + offsets[2]
    shifts[:D] = keys[3] + offsets[3]
    shifts
  end
end