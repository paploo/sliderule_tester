module Generator
  module Powers
    class BasicSquaresAndRoots < Base
      
      def self.title
        return "Basic Squares and Roots"
      end
      
      def self.description
        return "Basic square and square root problems."
      end
      
      def self.instructions
        return <<-INST
There are several methods, depending on the scales available:
A. Use the A scale, which is the square of the C scale.
B. Use the Sqrt(x) scale, which is the square root of the C scale.
C. Set 1 on C over x on LL#
  1. read the square on the correct LL scale under 2
  2. read teh square on the correct LL scale under 5 (as in 0.5)
INST
      end
      
      def initialize
        @x = Random.mag_float(-3,4)
        @n = [0.5, 2.0].sample
      end
      
      def solution
        return @x**@n
      end
      
      def to_s
        if( @n >= 1.0 )
          return "#{@x}^2"
        else
          return "sqrt(#{@x})"
        end
      end
      
    end
  end
end