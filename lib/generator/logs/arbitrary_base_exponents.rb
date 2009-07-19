module Generator
  module Logs
    class ArbitraryBaseExponents < Base
      
      def self.title
        return "Arbitrary Base Exponents"
      end
      
      def self.description
        return "Exponentiation of integer bases and e."
      end
      
      def self.instructions
        return <<-INST
There are two methods for doing this:
A. Use LL#:
  1. Place 1 on C over the base on LL#.
  2. Read answer on LL# under exponent on C.
B. In extreme circumstances, convert y = b^x to log(y) = x*log(b), and use L to
   find the log/antilog.  (This is less efficient and usually less accurate.)
INST
      end
      
      def initialize
        @b = Random.element( ((2...16).to_a << :e) )
        @x = Random.mag_float(0.1,10) * Random.sign
        @b_num = @b==:e ? Math::E : @b
      end
      
      def solution
        return @b_num**@x
      end
      
      def to_s
        if @b==:e
          return "exp(#{@x})"
        else
          return "#{@b}^#{@x}"
        end
      end
      
    end
  end
end