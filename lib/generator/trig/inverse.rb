module Generator
  module Trig
    class Inverse < All
      
      def self.title
        return "Inverse"
      end
      
      def self.description
        return "Inverse Trig Functions: ArcSin, ArcCos, ArcTan."
      end
      
      def self.instructions
        return <<-INST
To compute inverse trig functions, do the same steps as normal except
in reverse.
INST
      end
      
      private
      
      def test_functions
        return [:sin, :cos, :tan]
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