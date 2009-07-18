module Generator
  module Powers
    class LargeAndSmallPowers < Base
      
      def self.title
        return "Large/Small Powers"
      end
      
      def self.description
        return "Power problems involving large or small exponents."
      end
      
      def self.instructions
        return <<-INST
To calculate as simple powers, using these tricks as necessary:
* For very small bases (i.e. <1), invert, exponentiate as normal, and invert the
  answer.
  (i.e. 0.25^5 --> 1/(4^5) --> 1/1024 --> 0.00098)
* For very large bases, factor out powers of ten.
* For very large exponents:
  - Break-up into several smaller pieces:
    (i.e. 2^32 = (2^8)^4 = 256*256*256*256)
  - Or, similalry, factor out pieces:
    (i.e. 2^32 = (2^8)^4 = 256^4 = (2.56^4)*(100^4) = 43*10^8 = 4.3e9 
  - Convert into logs and back using L:
    (i.e. 2^32 --> 32*Log(2) --> 9.63 --> 4.3e9)
INST
      end
      
      def initialize
        @x = Random.mag_float(-3,4)
        @n = Random.mag_float(-2,2)
      end
      
      def solution
        return @x**@n
      end
      
      def to_s
        return "#{@x} ^ #{@n}"
      end
      
    end
  end
end