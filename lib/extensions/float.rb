class Float
  
  alias_method :to_original_s, :to_s
  def to_s(sigfigs=4)
    return to_app_string
  end
  
  def inspect
    return self.to_original_s
  end
  
  # Convert to a string formatted for our use
  def to_app_string
    sigfigs = 4
    n = sigfigs.nil? ? self : self.round_sigfigs(sigfigs)
    sig, exp = self.split
    #puts [n, sig, exp].inspect
    if(exp > 5)
      str = '%0.12e' % n
    elsif(exp < -4)
      str = '%0.12e' % n
    else
      str = '%0.12f' % n
    end
    
    #r = /^([+-]?[0-9]+\.[0-9][1-9]*)(0*)([Ee][+-][0-9]+)?$/
    r = /^([+-]?[0-9]+\.[0-9]+[1-9])(0*)([Ee][+-][0-9]+)?$/
    m = str.match(r)
    if(m)
      #puts m.inspect
      return m[1].to_s+m[3].to_s
    else
      return str
    end
  end
  
  # Rounds to the number of significant digits given
  def round_sigfigs(sigfigs)
    raise RangeError, "#{self.class.name}##{__method__}:: #{sigfigs} must be in range (0..500)", caller unless (0..500).include?(sigfigs)
    return self if self.zero?
    mag = self.abs
    sign = (self<0) ? -1 : 1
    q = 10**( (sigfigs.to_i - 1) - (Math.log10(mag).floor) )
    return (sign * ((mag*q).round.to_f) / (q.to_f))
  end
  
  # Split a floatin point number into the significand and exponent for scientific
  # notation.
  def split
    return [0.0, 0] if self.zero?
    
    value = self.abs
    sign = (self>=0.0 ? 1.0 : -1.0)
    q = Math.log10(value)
    ip, fp = q.divmod(1)
    return [sign * 10**fp, ip]
  end
  
end

if $0==__FILE__
  puts 0.0
  puts 3.0
  puts -0.00031415
  puts 0.0031415
  puts 0.00000546.to_s
  puts 3.14159265358979323846.to_s
  puts 323.0
  puts 1000
  puts 1234
  puts 31415926535.0.to_s
  puts 314159265358979.0.to_s
end