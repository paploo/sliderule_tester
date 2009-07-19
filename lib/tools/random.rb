module Random
  
  def self.int(*args)
    min, max = process_range_args(0, 100, *args)
    return rand(max-min+1)+min
  end
  
  def self.float(*args)
    min, max = process_range_args(0.0, 1.0, *args)
    return rand()*(max.to_f-min.to_f) + min.to_f
  end
  
  def self.mag_float(*args)
    min, max = process_range_args(0.0, 1.0, *args)
    value = self.float(1.0, 10.0)
    power = self.int(Math.log10(min), Math.log10(max)-1)
    return value * 10**power
  end
  
  def self.sign
    return rand(2).zero? ? -1 : 1
  end
  
  def self.element(array)
    return array[rand(array.length)]
  end
  
  def self.process_range_args(default_min, default_max, *args)
    case args.length
    when 0
      min = default_min
      max = default_max
    when 1
      min = default_min
      max = args[0]
    when 2
      min = args[0]
      max = args[1]
    else
      raise ArgumentError, "Unexpected number of arguments.", caller
    end
    
    return [min, max]
  end
  
  class << self
    private :process_range_args
  end
  
end