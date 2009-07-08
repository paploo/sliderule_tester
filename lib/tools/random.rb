module Random
  
  def self.mag_float(magnitude=1)
    n = nil
    if(magnitude.kind_of?(Numeric))
      n = magnitude.to_i
    elsif(magnitude.kind_of?(Array))
      n = magnitude.sample.to_i
    elsif(magnitude.kind_of?(Range))
      n = magnitude.to_a.sample.to_i
    else
      n = magnitude.to_i
    end
    
    return rand()*10**n
  end
  
  def self.float(*args)
    case args.length
    when 0
      min = 0.0
      max = 1.0
    when 1
      min = 0.0
      max = args[0]
    when 2
      min = args[0]
      max = args[1]
    else
      raise ArgumentError, "Unexpected number of arguments.", caller
    end
    
    return rand()*(max.to_f-min.to_f) + min.to_f
  end
  
end

if $0==__FILE__
  puts Random.mag_float
  puts Random.mag_float(5)
  puts Random.mag_float(-1)
  puts Random.mag_float((1..3))
  
  puts Random.float()
  puts Random.float(20)
  puts Random.float(5,6)
end