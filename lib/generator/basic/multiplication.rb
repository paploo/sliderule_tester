module Generator
  module Basic
    class Multiplication < Base
      
      def self.title
        return "Multiplication"
      end
      
      def self.description
        return "Basic multiplication problems."
      end
      
      def self.instructions
        return "Postion the 1 on the D scale over the first argument on the C scale, then read the number on the C scale under the second argument."
      end
      
      def initialize
        @x = Random.mag_float(0.01,1000.0)
        @y = Random.mag_float(0.01,1000.0)
      end
      
      def solution
        return @x*@y
      end
      
      def to_s
        return "#{@x} * #{@y}"
      end
      
    end
  end
end