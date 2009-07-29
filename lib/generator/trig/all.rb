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
        @base_function = Random.element(supported_functions())
        @angle_deg = random_angle(@base_function)
        @angle_rad = @angle_deg.to_rad
        @x = Math.send(@base_function, @angle_rad)
        
        @test_inverse = test_inverse_functions? ? Random.bool : false
        @test_with_rads = test_with_radians? ? Random.bool : false
      end
      
      def solution
        if( @test_inverse && @test_with_rads )
          return @angle_rad
        elsif( @test_inverse && !@test_with_rads )
          return @angle_deg
        elsif( !@test_inverse && @test_with_rads )
          return @x
        elsif( !@test_inverse && !@test_with_rads
          return @x
        end
      end
      
      def to_s
        if( @test_inverse && @test_with_rads )
          return "a#{method.to_s}(#{x}) = ? rads"
        elsif( @test_inverse && !@test_with_rads )
          return "a#{method.to_s}(#{x}) = ? degrees"
        elsif( !@test_inverse && @test_with_rads )
          return "#{method.to_s}(#{@angle_rad} rad)"
        elsif( !@test_inverse && !@test_with_rads
          return "#{method.to_s}(#{@angle_deg} deg)"
        end
      end
      
      private
      
      # Subclasses should override this to change the list of functions being
      # tested.
      def test_function
        return [:sin, :cos, :tan, :sec, :csc, :cot]
      end
      
       # Subclasses should change this to indicate if the inverse of the functions
       # being tested can be tested.
      def test_inverse_functions?
        return true
      end
      
      # Subclasses should change this to indicate if some problems should have
      # angles in radians instead of degrees.
      def test_with_radians?
        return true
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
      def random_angle(function)
        RandomAngle.for_function(function)
      end
      
      module RandomAngle
        INTERVALS = {
          :really_tiny => [0.00000000000000000000, 0.01000000000000000000], # 0 deg to 0.57 deg
          :tiny        => [0.00000000000000000000, 0.10000000000000000000], # 0.57 deg to 5.7 deg
          :small       => [0.10000000000000000000, 0.17453292519943295769], # 5.7 deg to 10 deg
          :medium_low  => [0.17453292519943295769, 0.78539816339744830962], # 10 deg to 45 deg
          :medium_high => [0.78539816339744830962, 1.39626340159546366154], # 45 deg to 80 deg
          :big         => [1.39626340159546366154, 1.47079632679489661923], # 80 deg to 84.3 deg
          :huge        => [5.42957795130823208768, 1.56079632679489661923], # 84.3 deg to 89.43 deg
          :really_huge => [1.56079632679489661923, 1.57079632679489661923], # 89.43 deg to 90 deg

          :low         => [0.00000000000000000000, 0.17453292519943295769], # 0 deg to 10 deg
          :medium      => [0.17453292519943295769, 1.39626340159546366154], # 10 deg to 80 deg
          :high        => [1.39626340159546366154, 1.57079632679489661923], # 80 deg to 90 deg
        }

        DOMAINS = {
          :sin => [:really_tiny, :tiny, :small, :medium, :high],
          :cos => [:low, :medium, :big, :huge, :really_huge],
          :tan => [:rally_tiny, :tiny, :small, :medium_low, :medium_high, :big, :huge, :really_huge]
        }

        FUNCTION_DOMAIN_ALIASES = {
          :sin => :sin,
          :cos => :cos,
          :tan => :tan,
          :csc => :sin,
          :sec => :cos,
          :cot => :tan
        }

        def self.for_function(func)
          domain_alias = FUNCTION_DOMAIN_ALIASES[func]
          domain = DOMAINS[domain_alias]
          interval_key = Random.element(domain)
          interval = INTERVALS[interval_key]
          Random.float(*interval)
        end

      end
      
    end
  end
end