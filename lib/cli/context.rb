require 'tools/guid'

module CLI
  class Context
    
    def initialize
      clear_commands()
      self.prompt_text = '> '
      yield(self) if block_given?
    end
    
    attr_reader :prompt_text, :context_stack
    attr_writer :main_text, :prompt_text, :context_stack
    
    def main_text
      if @main_text.kind_of?(Proc)
        return @main_text.call()
      else
        return @main_text
      end
    end
    
    def register_command(command, *aliases, &handler)
      # Store the handler against a guid.
      handler_guid = Tools::Guid.make
      @handler_map[handler_guid] = handler
      
      # Map the command to the guid.
      @command_map[command.to_s] = handler_guid
      
      # Now assign aliases
      alias_command(command, *aliases)
    end
    
    def deregister_command(command)
      # Remove the command from the handler map.
      @command_map.delete(command.to_s)
      
      # TODO: Eventually this should garbage collect handlers!
    end
    
    def alias_command(command, *aliases)
      handler_guid = @command_map[command.to_s]
      aliases.flatten.each do |cmd_alias|
        @command_map[cmd_alias.to_s] = handler_guid
      end
    end
    
    def clear_commands
      @command_map = {}
      @handler_map = {}
    end
    
    def commands
      return @command_map.keys
    end
    
    def respond_to_command?(command)
      return commands.include?(command.to_s)
    end
    
    def run_command(command, *args)
      handler = @handler_map[@command_map[command.to_s]]
      if !handler.nil?
        return handler.call(*args)
      else
        raise NoMethodError, "No command found for #{command.to_s.inspect} in context #{self.to_s}.", caller
      end
    end
    
  end
end