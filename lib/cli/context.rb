require 'tools/guid'

module CLI
  class Context
    @@current_contexts = []
    
    def self.push(context)
      @@current_contexts.push(context)
    end
    
    def self.pop
      @@current_contexts.pop
    end
    
    def self.current
      return @@current_contexts[-1]
    end
    
    def self.reset
      @@current_contexts = []
    end
    
    def self.respond_to_command?(command)
      @@current_contexts.reverse.each do |context|
        return true if context.respond_to_command?(command)
      end
      return false
    end
    
    def self.run_command(command, *args)
      @@current_contexts.reverse.each do |context|
        return context.run_command(command, *args) if context.respond_to_command?(command)
      end
      raise NoMethodError, "No command found for #{command.to_s.inspect} in any valid context.", caller
    end
    
    def initialize
      @command_map = {}
      @handler_map = {}
      yield(self) if block_given?
    end
    
    attr_reader :main_text, :prompt_text
    attr_writer :main_text, :prompt_text
    
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
    
    def respond_to_command?(command)
      return @command_map.has_key?(command.to_s)
    end
    
    def run_command(command, *args)
      handler = @handler_map[@command_map[command.to_s]]
      if !handler.nil?
        handler.call(*args)
      else
        raise NoMethodError, "No command found for #{command.to_s.inspect} in context #{self.to_s}.", caller
      end
    end
    
  end
end