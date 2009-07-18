module Generator
  module Basic
    class BasicPowers < Base
      
      def self.title
        return "Basic Powers"
      end
      
      def self.description
        return "Basic power problems."
      end
      
      def self.instructions
        return <<-INST
To calculate arbitrary x^n:
1. Set 1 on C over x on LL#
2. Read answer on appropriate LL# under n on C.
(Multiplication of result requires transfer from LL# to C)
INST
      end
      
      def initialize
        @x = Random.mag_float(-3,4)
        @n = Random.mag_float(-3,4)
      end
      
      def solution
        return @x**@n
      end
      
      def to_s
        return "#{@x} ^ #{@n}"
      end
      
    end
  end
end