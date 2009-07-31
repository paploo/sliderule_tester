module Generator
  module Trig
    class Cot < All
      
      def self.title
        return "Cotangent"
      end
      
      def self.description
        return "Cotangent and Arc-Cotangent."
      end
      
      def self.instructions
        return <<-INST
A. Calculate cot(x) as
  1. 1/tan(x), or
  2. tan(x'), where x' is the compliment of x.
B. Calculate acot(x) as
  1. atan(1/x)
  2. The compliment of atan(x)
These can be done by calculating for cosine, but swhiching the C and CI scale.
INST
      end
      
      private
      
      def test_functions
        return [:cot]
      end
      
      def test_inverse_functions?
        return true
      end
      
      def test_with_radians?
        return false
      end
      
    end
  end
end