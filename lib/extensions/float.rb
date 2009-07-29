class Float
  
  alias_method :to_original_s, :to_s
  def to_s
    return to_pretty_string
  end
  
  def inspect
    return self.to_original_s
  end
  
  def to_pretty_string
    sigfigs = 4
    sig, exp = self.split
    if(exp>5 || exp<-4)
      str = sig.round_sigfigs(sigfigs).to_original_s + 'e' + ('%+d' % exp)
    else
      str = self.round_sigfigs(sigfigs).to_original_s
    end
    return str.gsub(/\.0+$/,'')
  end
  
  # Rounds to the number of significant digits given
  def round_sigfigs(sigfigs)
    raise RangeError, "#{self.class.name}##{__method__}:: #{sigfigs} must be in range (0..500)", caller unless (0..500).include?(sigfigs)
    return self if self.zero? || self.infinite? || self.nan?
    mag = self.abs
    sign = (self<0) ? -1 : 1
    q = 10**( (sigfigs.to_i - 1) - (Math.log10(mag).floor) )
    return (sign * ((mag*q).round.to_f) / (q.to_f))
  end
  
  # Split a floating point number into the significand and exponent for scientific
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




class Float
  
  def to_rad
    return self * 0.0174532925199432957692369076849
  end
  
  def to_deg
    return self * 57.2957795130823208767981548141
  end
  
end