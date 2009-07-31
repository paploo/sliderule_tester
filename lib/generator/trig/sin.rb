module Generator
  module Trig
    class Sin < All
      
      def self.title
        return "Sine"
      end
      
      def self.description
        return "Sine and Arc-Sine."
      end
      
      def self.instructions
        return <<-INST
There are several methods to calculate the sine, depending on the angle range.

A. For angles under 0.57 degrees:
  1. Convert to radians; this is your answer.
B. For angles between 0.57 degrees and 5.7 degrees:
  2. Use the ST/SRT scale.
C. For angle between 5.7 degrees and 80 degrees:
  1. Use the S scale.
D. For angles between 80 degrees and 90 degrees, one can usually get
   away with 1.0, but in cases where more precision is necessary, the Taylor
   series can be used:
  1. Find the compliment of the angle (x' = 90 deg - x)
  3. Convert the angle to radians (let u' be the compliment angle in radians).
  4. sin(u) = cos(u') ~= 1 - (1/2)(u')^2.
INST
      end
      
      private
      
      def test_functions
        return [:sin]
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