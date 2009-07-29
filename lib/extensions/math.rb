module Math
  
  def self.sec(x)
    return 1.0/cos(x)
  end
  
  def self.csc(x)
    return 1.0/sin(x)
  end
  
  def self.cot(x)
    return 1.0/tan(x)
  end
  
  def self.asec(x)
    return acos(1.0/x)
  end
  
  def self.acsc(x)
    return asin(1.0/x)
  end
  
  def self.acot(x)
    return atan(1/x)
  end
  
end