module Generator
  module Logs
    class ArbitraryBaseLogs < Base
      
      def self.title
        return "Arbitrary Base Logs"
      end
      
      def self.description
        return "Logarithms of arbitrary ineger bases."
      end
      
      def self.instructions
        return <<-INST
There are two methods for doing logB(x):
A. Use LL#:
  1. Place 1 on C over the base on LL#.
  2. Read answer on C over x on LL#.
B. Convert problem from y = logB(x) to y = log(x)/log(B), and use L to find the
   log/antilog of x and B.
INST
      end
      
      def initialize
        @b = ((2...16).to_a << :e).sample
        @x = Random.mag_float(-3,4)
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