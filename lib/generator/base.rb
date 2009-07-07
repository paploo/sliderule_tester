module Generator
  class Base
    
    # Returns the title for the generator
    def self.title
      return "Base Generator"
    end
    
    # Returns a short description for the generator
    def self.description
      return "Tests nothing, as this is the base generator."
    end
    
    # Returns the setp-by-step instructions on how to solve the problem generated
    def self.instructions
      return "Just enter the number given."
    end
    
    # On a call of new, a new problem is randomly created and the instance is
    # given back.  The instance holds information on output and computation of
    # the problem.
    #
    # Subclasses will override this with their own generation
    def initialize
    end
    
    # Returns the solution to the randomly generated problem.
    def solution
      return nil
    end
    
    # Returns the human presented text form of the problem.
    def to_s
      return "N/A"
    end
    
  end
end