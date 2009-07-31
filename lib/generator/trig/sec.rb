module Generator
  module Trig
    class Sec < All
      
      def self.title
        return "Secant"
      end
      
      def self.description
        return "Secant and Arc-Secant."
      end
      
      def self.instructions
        return <<-INST
A. Calculate sec(x) as 1/cos(x).
B. Calculate asec(x) as acos(1/x).
These can be done by calculating for cosine, but swhiching the C and CI scale.
INST
      end
      
      private
      
      def test_functions
        return [:sec]
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