$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require 'init'

# TO DO
# Need Random float method that can give even probabilities of values in different magnitudes.
# Need a pretty output on floats (need own float wrapper or just override float's to_s method, maybe with sigfigs arg... or gimme class?)

class Float
  
  alias_method :to_original_s, :to_s
  def to_s(sigfigs=4)
    n = sigfigs.nil? ? self : self.round_sigfigs(sigfigs)
    sig, exp = self.split
    puts [sig, exp].inspect
    if(exp > 5)
      puts 'a'
      return '%0.15e' % n
    elsif(exp < -4)
      puts 'b'
      return '%0.15e' % n
    else
      puts 'c'
      return '%0.15f' % n
    end
  end
  
  def inspect
    return self.to_original_s
  end
  
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

puts 0.000314
puts 0.00314
puts 3.14159265358979323846.to_s
puts 31415926535.0.to_s
puts 314159265358979.0.to_s
puts ""

gen = Generator::Basic::Chains.new
puts gen.to_s
puts gen.solution.inspect