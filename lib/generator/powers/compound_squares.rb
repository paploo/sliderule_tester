module Generator
  module Basic
    class CompoundSquares < Base
      
      def self.title
        return "Compound Squares and Roots"
      end
      
      def self.description
        return "Compound square and square root problems."
      end
      
      def self.instructions
        return <<-INST
There are several methods to solve a*x^2, depending on the scales available:
A. Using A and B (good for compoun calculations to get a):
  1. Set 1 on C under x on D,
  2. Read answer on A over a on B.
B. Using C and A (requires transfer to A in most real world calculations):
  1. Place 1 on C under a on A,
  2. Place cursor over x on C,
  3. Read answer on A under cursor.
C. Using C and D scale (can handle compound calculations to get a, but takes more slide moves)
  1. Multiply as a * x * x.
INST
      end
      
      def initialize
        @a = Random.mag_float(-3,4)
        @x = Random.mag_float(-3,4)
        @n = 2.0
      end
      
      def solution
        return @a * @x**@n
      end
      
      def to_s
        return "#{@a} * #{@x} ^ 2"
      end
      
    end
  end
end