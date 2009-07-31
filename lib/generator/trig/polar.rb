module Generator
  module Trig
    class Polar < Base
      
      def self.title
        return "Polar Coordinate Conversions"
      end
      
      def self.description
        return "Conversion to/from polar coordinates."
      end
      
      def self.instructions
        return <<-INST
A. Convert into rectangular coordinates via:
  1. x = r * cos(theta)
  2. y = r * sin(theta)
B. Convert into polar coordinates via:
  1. theta = atan(y/x)
  2. Either
    - r = x / cos(theta)
    - r = y / sin(theta)
  It is important to calculate with the correct quadrant for theta.
INST
      end
      
      def initialize
        @x = Random.float(0.0,20.0) - 10.0
        @y = Random.float(0.0,20.0) - 10.0
        
        @r = Math.sqrt(@x**2 + @y**2)
        @rad = Math.atan2(@y, @x)
        @deg = @rad.to_deg
        
        @to_polar = Random.bool
        @first_coord = Random.bool
      end
      
      def solution
        if(@to_polar)
          return (@first_coord ? @r : @deg)
        else
          return (@first_coord ? @x : @y)
        end
      end
      
      def to_s
        if(@to_polar)
          coord_name = (@first_coord ? 'r' : 'theta (deg); -180<=theta<=+180')
          return "[#{@x}, #{@y}] --> [r, theta].  What is the value of #{coord_name}?"
        else
          coord_name = (@first_coord ? 'x' : 'y')
          return "[#{@r}, #{@deg} deg] --> [x, y].  What is the value of #{coord_name}?"
        end
      end
      
    end
  end
end