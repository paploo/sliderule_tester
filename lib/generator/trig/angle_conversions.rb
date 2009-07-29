module Generator
  module Trig
    class BasicPowers < Base
      
      def self.title
        return "Angle Conversions"
      end
      
      def self.description
        return "Conversion to/from radians and degrees."
      end
      
      def self.instructions
        return <<-INST
Treat as a ratio proportion using the 'r' (180/pi --> ~57.30) on the degrees
scale as so:
A. If converting to radians:
  1. Place the 'r' on C over the 1 on D.
  2. Read radians on D under degrees on C.
B. If converting to degrees:
  1. Place the 1 on C over the 'r' on D.
  2. Read the degrees on D under the radians on C.
INST
      end
      
      def initialize
        @deg = Random.float(0.0,360.0)
        @rad = @deg.to_rad
        @to_rad = Random.bool
      end
      
      def solution
        @to_rad ? @rad : @deg
      end
      
      def to_s
        if @to_rad
          return "#{deg} deg in radians"
        else
          return "#{rad} rads in degrees"
        end
      end
      
    end
  end
end