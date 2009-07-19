# A class to get a solution and an answer, and compare it to the correct solution.
class AnswerAnalyzer
  
  # Given the solution value and the answer value, give back a correctness
  def initialize(solution, answer)
    @solution = solution.to_f
    @answer = answer.to_f
    cache()
  end
  
  attr_reader :solution, :answer, :delta, :error, :significand_delta, :significand_error
  
  # Returns the displacement of your reading on the scale.  With no arg, it is the
  # fraction of the total length that you are off.  With an argument, it returns
  # the total number of units you are off.  (e.g. If you pass 10 for a 10" scale, the
  # result will be in inches.)
  def scale_displacement(rule_length = 1.0)
    return @delta_u * rule_length
  end
  
  # Give a human readable output
  def to_s
    return "You gave #{answer}, the solution is #{solution}.  (slide read wrong by #{scale_displacement*100.0}% of length, answer error: #{error*100.0}%)"
  end
  
  
  private
  
  def cache()
    @delta = @answer - @solution
    @error = @delta / @solution
    
    @solution_sig, @solution_exp = @solution.split
    @answer_sig, @answer_exp = @answer.split
    
    @significand_delta = @answer_sig - @solution_sig
    @significand_error = @significand_delta / @solution_sig
    
    @scale_displacement = calcualte_scale_displacement()
  end
  
  # Calculates the fraction of the sliderules' you are off from the correct answer:
  def calcualte_scale_displacement
    return nil if @solution_sig.zero? || @answer_sig.zero?
    
    @u_solution = Math.log10(@solution_sig.abs)
    @u_answer = Math.log10(@answer_sig.abs)
    @delta_u = @u_answer - @u_solution
    return @delta_u
  end
  
end