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
        return ""
      end
      
      def initialize
        @x = Random.mag_float(0.01,1000.0)
        @y = Random.mag_float(0.01,1000.0)
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