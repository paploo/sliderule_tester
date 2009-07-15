module CLI
  class ContextStack
    
    def initialize()
      reset()
    end
    
    def push(context)
      context.context_stack = self
      @current_contexts.push(context)
    end
    
    def pop
      context = @current_contexts.pop
      context.context_stack = nil
    end
    
    def peek(index)
      return @current_contexts[index]
    end
    
    def current
      return peek(-1)
    end
    
    def reset
      @current_contexts = []
    end
    
    def commands
      return @current_contexts.collect {|context| context.commands}
    end
    
    def respond_to_command?(command)
      @current_contexts.reverse.each do |context|
        return true if context.respond_to_command?(command)
      end
      return false
    end
    
    def run_command(command, *args)
      # First let all contexts try to run the command.
      @current_contexts.reverse.each do |context|
        return context.run_command(command, *args) if context.respond_to_command?(command)
      end
      # Now error.
      raise NoMethodError, "No command found for #{command.to_s.inspect} in any valid context.", caller
    end
    
  end
end