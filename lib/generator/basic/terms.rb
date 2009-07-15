module Generator
  module Basic
    class Terms < Generator::Base
      
      def self.title
        return "Mult/Divide Complex Terms"
      end
      
      def self.description
        return "Chains of multiplication and division."
      end
      
      def self.instructions
        return <<-INST
1. TODO.
INST
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