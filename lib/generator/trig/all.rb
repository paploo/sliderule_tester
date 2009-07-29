module Generator
  module Trig
    class All < Base
      
      def self.title
        return "All Functions"
      end
      
      def self.description
        return "Practice randomly selected trig problems."
      end
      
      def self.instructions
        return <<-INST
Use the methods outlined in the specific tests.
INST
      end
      
      def initialize
        @method = Random.element(supported_functions())
        @angle_deg = random_angle(@method)
        @angle_rad = @angle_deg.to_rad
      end
      
      def solution
        Math.send(@method, @angle_rad)
      end
      
      def to_s
        if Random.bool
          return "#{method.to_s}(#{@angle_deg} deg)"
        else
          return "#{method.to_s}(#{@angle_rad} rad)"
        end
      end
      
      private
      
      # Subclasses should override this to change the list of functions being
      # tested.
      def supported_functions
        return [:sin, :cos, :tan, :sec, :csc, :cot, :asin, :acos, :atan, :asec, :acsc, :acot]
      end
      
      # Return a random angle, in RADIANS in one of the following range groups.
      # This does not return an even distribution fomr 0 to 90 degrees, instead it
      # returns an even distribution from within each range.  This allows better
      # testing of specialty ranges.
      #
      # To facilitate all trig functions, we symmetrically divide around 45 degrees.
      #
      # TODO: Given the method, we should know what ranges we care about.  For
      # example, for sins we want to divide up the small angles a lot, but 80
      # to 90 can be treated as one domain.  Cosine is the reverse (which means
      # just using the compliment of whatever was generated for sin?, and tangent
      # is completely symmetrical.
      def random_angle(method)
        all_domains = [
          [0.00000000000000000000, 0.01000000000000000000], # 0 deg to 0.57 deg
          [0.00000000000000000000, 0.10000000000000000000], # 0.57 deg to 5.7 deg
          [0.10000000000000000000, 0.17453292519943295769], # 5.7 deg to 10 deg
          [0.17453292519943295769, 0.78539816339744830962], #10 deg to 45 deg
          [0.78539816339744830962, 1.39626340159546366154], #45 deg to 80 deg
          [1.39626340159546366154, 1.47079632679489661923], #80 deg to 84.3 deg
          [5.42957795130823208768, 1.56079632679489661923], #84.3 deg to 89.43 deg
          [1.56079632679489661923 ,5.72957795130823208768], #89.43 deg to 90 deg
        ] 
        
        return Random.float(*(Random.element(domains)))
      end
      
    end
  end
end