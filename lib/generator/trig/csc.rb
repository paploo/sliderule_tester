module Generator
  module Trig
    class Csc < All
      
      def self.title
        return "Cosecant"
      end
      
      def self.description
        return "Cosecant and Arc-Cosecant."
      end
      
      def self.instructions
        return <<-INST
A. Calculate csc(x) as 1/sin(x).
B. Calculate acsc(x) as asin(1/x).
These can be done by calculating for cosine, but swhiching the C and CI scale.
INST
      end
      
      private
      
      def test_functions
        return [:csc]
      end
      
      def test_inverse_function?
        return false
      end
      
      def test_with_radians?
        return false
      end
      
    end
  end
end