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
        return <<-INST
1. Place 1 over the first number on D,
2. Read answer on D under second number on C.
INST
      end
      
      def initialize
        @values = []
        Random.int(2,4).times do
          @values <<  Random.mag_float(0.001,10000)
        end
      end
      
      def solution
        return @values.inject(1.0) {|p,x| p *= x}
      end
      
      def to_s
        return @values.join(' * ')
      end
      
    end
  end
end