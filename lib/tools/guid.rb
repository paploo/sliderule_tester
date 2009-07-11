module Tools
  class Guid
    
    def self.make(width=64)
      case width
      when 64
        return make_64
      when 128
        return make_128
      else
        raise ArgumentError, "Do not know how to make guid of width #{width}."
      end
    end
    
    # Returns a 64 bit number that can be assumed unique.
    #
    # Note that to gaurantee easy hex output with to_s(16), the high bit is
    # *always* 1.  All other bits can assume any value, but doesn't need to be
    # random!
    def self.make_64
      # 64-64: 1 (width 1 bit)
      # 53-63: rand (width 11 bits)
      # 21-52: ti (width 32 bits)
      # 1-20: tu (width 20 bits)
      # First build out the time to the microsecond into a 64 bit number.

      now = Time.now
      ti = now.to_i # 32 bits
      tu = now.usec # 20 bits
      r = rand(1<<11) # 11 bits

      # Combine so that the first 64 bits are the random number and the last are the time.
      return (1<<63) | (r<<52) | (ti<<20) | tu
    end
    
    # This is slower than the 64 bit implementation, but gives 128 bit output.
    #
    # Note that to gaurantee easy hex output with to_s(16), the high bit is
    # *always* 1.  All other bits can assume any value, but doesn't need to be
    # random!
    def self.make_128
      # First build out the time to the microsecond into a 64 bit number.
      now = Time.now
      ti = now.to_i
      tu = now.usec
      t = (1<<63) | (ti<<20) | tu # always 64 bits, though the first 13 are usually the same.

      # Now let's make a 64 bit random number
      r = rand(1<<63) | (1<<63) # Make a 64 bit number, making sure the high bit is a 1.

      # Combine so that the first 64 bits are the random number and the last are the time.
      return (r<<64) | t
    end
    
  end
end