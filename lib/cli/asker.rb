module CLI
  # TODO: This should be replaced by readline?
  # require 'readline'
  # 
  # loop do
  #   line = Readline::readline('> ')
  #   Readline::HISTORY.push(line)
  #   puts "You typed: #{line}"
  # end
  class Asker
    @@commands = {}
    
    def self.register_command(command, &block)
      @@commands[command.to_s] = block
    end
    
    def self.deregister_command(command)
      @@commands.delete[command.to_s]
    end
    
    def self.command_registered?(command)
      @@commands.has_key?(command.to_s)
    end
    
    # Given a question text, it asks it and collects the answer
    def self.ask(question, suffix=': ')
      # Ask the question
      STDOUT << question.to_s + suffix
      # Get the response
      resp = gets
      response = resp && resp.chomp
      # If it is a registered command, handle it.
      run_command(response) if command_registered?(response)
      # Always return it.
      return response
    end
    
    # Given a question, it will continue re-asking the question until valid
    # input is reached.  To determine valid input, the block validates the input
    # by returning true or false
    def self.ask_and_validate(question, suffix=': ')
      valid = false
      while( !valid )
        response = self.ask(question, suffix)
        valid = command_registered?(response)
        valid = yield(response) if !valid && block_given?
        puts "Invalid response #{response.inspect}, please try again." unless valid
      end
      return response
    end
    
    def self.run_command(command)
      @@commands[command.to_s].call
    end
    
    class << self
      private :run_command
    end
    
  end
end