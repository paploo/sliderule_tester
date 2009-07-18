module Generator
  module Basic
    class Division < Base
      
      def self.title
        return "Division"
      end
      
      def self.description
        return "Basic division problems."
      end
      
      def self.instructions
        return <<-INST
There are two methods:
A.
  1. Place the denominator on C over the numerator on D,
  2. Read the answer on D under 1.
B.
  1. Place 1 over the numerator on D,
  2. Read the answer on D under the denominator CI.
INST
      end
      
      def initialize
        @x = Random.mag_float(-3,3)
        @y = Random.mag_float(-3,3)
      end
      
      def solution
        return @x/@y
      end
      
      def to_s
        return "#{@x} / #{@y}"
      end
      
    end
  end
end