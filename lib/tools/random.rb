module Random
  
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