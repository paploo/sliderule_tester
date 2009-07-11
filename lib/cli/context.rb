module CLI
  class Context
    @@current_contexts = []
    
    def self.push_context(context)
      @@current_contexts.push(context)
    end
    
    def self.pop_context(context)
      @@current_contexts.pop(context)
    end
    
    def self.current_context
      return @@current_contexts[-1]
    end
    
    def initialize
      @command_map = {}
      @handler_map = {}
      yield(self) if block_given?
    end
    
    attr_reader :main_text, :prompt_text
    attr_writer :main_text, :prompt_text
    
    def register_command(command, *aliases, &handler)
      handler_guid = build_guid
    end
    
    def deregister_command(command)
    end
    
    def alias_command(cmd_alias, command)
    end
    
    def respond_to_command?(command)
    end
    
    private
    
    # Returns a 64 bit number that can be assumed unique.
    #
    # Note that to gaurantee easy hex output with to_s(16), the high bit is
    # *always* 1.  All other bits can assume any value, but doesn't need to be
    # random!
    def make_guid
      # 64-64: 1 (width 1 bit)
      # 53-63: rand (width 11 bits)
      # 21-52: ti (width 32 bits)
      # 1-20: tu (width 20 bits)
      # First build out the time to the microsecond into a 64 bit number.

      now = Time.now
      ti = now.to_i # 32 bits
      tu = now.usec # 20 bits
      r = rand(1<<11) # 11 bits

      # Combine so that the first 64 bits are the random number and the last are the time.
      return (1<<63) | (r<<52) | (ti<<20) | tu
    end
    
  end
end