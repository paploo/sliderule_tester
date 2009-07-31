module Generator
  module Trig
    class Secant < All
      
      def self.title
        return "Secant"
      end
      
      def self.description
        return "Secant, Cosecant, Cotangent, and their inverses."
      end
      
      def self.instructions
        return <<-INST
I. Secant:
  A. Calculate sec(x) as 1/cos(x).
  B. Calculate asec(x) as acos(1/x).
  These can be done by calculating for cosine, but swhiching the C and CI scale.
II. Cosecant:
  A. Calculate csc(x) as 1/sin(x).
  B. Calculate acsc(x) as asin(1/x).
  These can be done by calculating for cosine, but swhiching the C and CI scale.
III. Cotangent:
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
        return [:sec, :csc, :cot]
      end
      
      def test_inverse_function?
        return true
      end
      
      def test_with_radians?
        return false
      end
      
    end
  end
end