module Generator
  module Basic
    class Fractions < Base
      
      def self.title
        return "Fractions"
      end
      
      def self.description
        return "Basic multiplication of fractions."
      end
      
      def self.instructions
        return <<-INST
Same as for normal multiplication, except that when a fraction is encountered,
multiply using CI instead of C.
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
        values = @values.collect {|x| x<1.0 ? "1/#{1/x}" : x}
        return values.join(' * ')
      end
      
    end
  end
end