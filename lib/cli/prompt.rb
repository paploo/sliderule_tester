require 'readline'

require 'cli/context_stack'
require 'cli/context'

module CLI
  # Uses readline to prompt the user, using the context.
  class Prompt
    
    def self.ask(context_stack)
      # Get the current context.
      current_context = context_stack.current
      
      # Output the main text.
      puts current_context.main_text.to_s unless current_context.main_text.nil?
      
      # Get the input, doing it over and over until it is valid.
      while(true)
        input = Readline::readline(current_context.prompt_text.to_s)
        Readline::HISTORY.push(input)
        cmd, *args = parse_command_line(input)
        if(context_stack.respond_to_command?(cmd))
          break
        else
          puts "Unrecognized command #{cmd}, please try again."
        end
      end
      
      # Process valid input
      result = context_stack.run_command(cmd, *args)
      puts "--> #{result}" unless result.nil?
    end
    
    def self.parse_command_line(input)
      # This needs to handle quoted arugments!
      return input.split(/\s+/)
    end
    
  end
end