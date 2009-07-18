module Generator
  module Powers
    class BasicCubesAndRoots < Base
      
      def self.title
        return "Basic Cubes and Cube Roots"
      end
      
      def self.description
        return "Basic cube and cube root problems."
      end
      
      def self.instructions
        return <<-INST
There are several methods, depending on the scales available:
A. Use the K scale, which is the square of the C scale.
B. Use the cuberoot(x) scale, which is the cube root of the C scale.
C. Set 1 on C over x on LL#
  1. read the square on the correct LL scale under 3
  2. read teh square on the correct LL scale under 0.3333 (as in 1/3rd)
INST
      end
      
      def initialize
        @x = Random.mag_float(-3,4)
        @n = [1/3.0, 3.0].sample
      end
      
      def solution
        return @x**@n
      end
      
      def to_s
        if( @n >= 1.0 )
          return "#{@x} ^ 3"
        else
          return "cuberoot(#{@x})"
        end
      end
      
    end
  end
end