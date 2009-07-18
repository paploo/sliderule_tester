module Generator
  module Powers
    class CompoundRoots < Base
      
      def self.title
        return "Compound Squares and Roots"
      end
      
      def self.description
        return "Compound square and square root problems."
      end
      
      def self.instructions
        return <<-INST
There are several methods to solve a*sqrt(x), depending on the scales available:
A. Using A and B:
  1. Set 1 on C under a on D,
  2. Read answer on D under x on B.
B. Using C and A (requires transfer to A in most real world calculations):
  1. Place 1 on C over a on Sqrt(x),
  2. Place cursor over x on D,
  3. Read answer on Sqrt(x) under cursor.
C. Using C and D scale (this is equivalent to method B, but takes more steps!)
  1. Multiply as a * a * x, and then take the square root.
INST
      end
      
      def initialize
        @a = Random.mag_float(-3,4)
        @x = Random.mag_float(-3,4)
        @n = 0.5
      end
      
      def solution
        return @a * @x**@n
      end
      
      def to_s
        return "#{@a} * sqrt(#{@x})"
      end
      
    end
  end
end