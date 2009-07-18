module Generator
  module Basic
    class Ratios < Base
      
      def self.title
        return "Ratios"
      end
      
      def self.description
        return "Basic ratio problems."
      end
      
      def self.instructions
        return <<-INST
If given x/a = c/d:
1. Place c on C over d on D,
2. Read off x on C over a on D.
(This is really the same as c / d * c, which is the basic move of the alternation method for complex terms)
INST
      end
      
      def initialize
        @a = Random.mag_float(-3,4)
        @c = Random.mag_float(-3,4)
        @d = Random.mag_float(-3,4)
      end
      
      def solution
        return (@c/@d)*@a
      end
      
      def to_s
        return "(x / #{@a}) = (#{@c} / #{@d})"
      end
      
    end
  end
end