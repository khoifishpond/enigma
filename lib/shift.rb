class Shift
  attr_reader :keys, :offsets
  
  def initialize(keys, offsets)
    @keys = keys
    @offsets = offsets
  end

  def shifts
    shifts = {}
    shifts[:A] = @keys[0] + @offsets[0]
    shifts[:B] = @keys[1] + @offsets[1]
    shifts[:C] = @keys[2] + @offsets[2]
    shifts[:D] = @keys[3] + @offsets[3]
    shifts
  end
end