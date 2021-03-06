class Proctor < CLI::Context
  
  def initialize(generator)
    super()
    @slide_rule = CONFIG[:slide_rule] || SlideRule::MODELS[:generic]
    @generator = generator
    @problems = []
    @answers = []
    register_standard_commands()
  end
  
  def main_text
    if(@problems.length == @answers.length)
      @problems << @generator.new
    end
    count = @problems.length
    problem_text = @problems[-1].to_s
    return "Q#{count}: #{problem_text}"
  end
  
  def prompt_text
    CONFIG[:test_prompt] || super()
  end
  
  def header
    buf = " #{@generator.title} ".center(72, '-') + "\n"
    buf << instructions + "\n"
    return buf
  end
  
  def instructions
    return "Instructions:\n#{@generator.instructions}"
  end
  
  def process_answer(answer)
    @answers << AnswerAnalyzer.new(@problems[-1].solution, answer)
    return @answers[-1]
  end
  
  def result_text
    count = @answers.length
    avg_error = (@answers.inject(0.0) {|s,o| s += o.error.abs}) / count.to_f
    error_stddev = Math.sqrt(@answers.inject(0.0) {|s,o| s += (o.error.abs-avg_error)**2}) / count.to_f
    return "You did #{count} problems with an average error of #{avg_error*100.0}% +/- #{error_stddev*100.0}%"
  end
  
  def respond_to_command?(command)
    if command =~ float_regex
      return true
    else
      return super
    end
  end
  
  def run_command(command, *args)
    if command =~ float_regex
      return super('answer', command, *args)
    else
      return super
    end
  end
  
  private
  
  def float_regex
    return (/^([+-])?(\d*)(\.\d*)?([eE][+-]?\d+)?$/)
  end
  
  def register_standard_commands
    register_command('instructions', 'i', 'in', 'ins', 'inst') {puts instructions()}
    
    register_command('ans', 'answer', 'a', 'an') do |ans|
      aa = process_answer(ans.to_f)
      puts "  >> You gave #{aa.answer}"
      puts "  >> Expected #{aa.solution}"
      if @slide_rule.nil?
        puts "  >> Slide read wrong by #{aa.scale_displacement*100.0}% of length"
      else
        puts "  >> Slide read wrong by #{aa.scale_displacement(@slide_rule.decade_length)} inches"
      end
      puts "  >> answer error: #{aa.error*100.0}%"
      puts ""
    end
    
    register_command('end') do
      puts ''
      puts '*' * 10
      puts result_text()
      puts '*' * 10
      puts ''
      context_stack.pop
    end
  end
  
  
end