module Generator
  module Logs
    class AdvancedLogs < Base
      
      def self.title
        return "Advanced Logs"
      end
      
      def self.description
        return "Logarithms of common bases of very large and small numbers."
      end
      
      def self.instructions
        return <<-INST
There are two methods for doing logB(x):
A. Use LL#:
  1. Place 1 on C over the base on LL#.
  2. Read answer on C over x on LL#.
B. Convert problem from y = logB(x) to y = log(x)/log(B), and use L to find the
   log/antilog of x and B. (This is effective for log-base-ten as Log(B) is 1)
INST
      end
      
      def initialize
        @b = Random.element([:e, 10])
        @x = Random.element([Random.mag_float(0.0001,1e-10), Random.mag_float(10000,1e10)]) * Random.sign
        @b_num = @b==:e ? Math::E : @b
      end
      
      def solution
        Math.log(@x,@b_num) # This is backwards from Mathematica!
      end
      
      def to_s
        if @b==:e
          return "ln(#{@x})"
        elsif @b==10
          return "log(#{@x})"
        else
          return "log#{@b_num}(#{@x})"
        end
      end
      
    end
  end
end