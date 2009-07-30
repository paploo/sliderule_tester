module Generator
  module Trig
    class Tan < All
      
      def self.title
        return "Tangent"
      end
      
      def self.description
        return "Tangent and Arc-Tangent."
      end
      
      def self.instructions
        return <<-INST
There are several methods to calculate the tangent, depending on the angle range.

A. For angles under 0.57 degrees:
  1. Convert to radians; this is your answer.
B. For angles between 0.57 degrees and 5.7 degrees:
  2. Use the SRT scale, read the answer on C.
C. For angle between 5.7 degrees and 45 degrees.
  1. Use the T scale with the forward markings, read the answer on C:
D. For angles betwee 45 degrees and 84.3 degrees
  1. Use the T scale with the reverse markings, read the anwser on CI:
E. For angles between 84.3 degrees and 89.43 degrees:
  1. Use the SRT scale, read the answer on CI.
F. For angles between 89.43 degrees and 90.0 degrees, a taylor expansion is
   necessary:
  1. Find the compliment angle. (x' = 90 deg - x)
  2. Convert the angle to radians. (let u' be the complement angle in radians)
  3. tan(u) ~= 1/u'
INST
      end
      
      private
      
      def test_functions
        return [:tan]
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