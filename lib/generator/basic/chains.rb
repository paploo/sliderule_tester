module Generator
  module Basic
    class Chains < Generator::Base
      
      def self.title
        return "Mult/Divide Chains"
      end
      
      def self.description
        return "Chains of multiplication and division."
      end
      
      def self.instructions
        return "Postion the 1 on the D scale over the first argument on the C scale, then read the number on the C scale under the second argument."
      end
      
      def initialize
        num_count = Random.int(2,5)
        denom_count = Random.int(2,5)
        
        @numerators = Array.new(num_count) { Random.mag_float(-2,2) }
        @denominators = Array.new(denom_count) { Random.mag_float(-2,2) }
      end
      
      def solution
        num = @numerators.inject(1) {|prod, x| prod*x}
        denom = @denominators.inject(1) {|prod, x| prod*x}
        return num/denom
      end
      
      def to_s
        return '( ' + @numerators.join(' * ') + ' ) / ( ' + @denominators.join(' * ') + ' )'
      end
      
    end
  end
end