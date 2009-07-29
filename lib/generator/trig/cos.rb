module Generator
  module Trig
    class Cos < All
      
      def self.title
        return "Cosine"
      end
      
      def self.description
        return "Cosine and Arc-Cosine."
      end
      
      def self.instructions
        return <<-INST
There are several methods to calculate the cosine, depending on the angle range.
Note that for some problems it can beneficial to just compute the sine of the
complement.

A. For angles over 89.43 degrees
  1. Find the compliment of the angle.
  2. Convert to radians; this is your answer.
B. For angles between 84.3 degrees and 89.43 degrees
  1. Find the compliment of the angle (in degrees).
  2. Look up the sine of the compliment on the SRT scale.
C. For angle between 10 degrees and 84.3 degrees.
  1. Use the S scale with either:
    = The reverse markings, or
    - The compliment of the angle
D. For angles under 10 degrees, one can usually get away with 1.0, but in cases
   where more precision is necessary, the Taylor series can be used:
  1. Convert the angle to radians (let u be the angle in radians).
  2. cos(u) ~= 1 - (1/2)u^2.
INST
      end
      
      private
      
      def test_functions
        return [:cos]
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