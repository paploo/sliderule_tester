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
    
    # Returns a 128 bit number that can be assumed unique.
    #
    # Note that to gaurantee easy hex output with to_s(16), the high bit is
    # *always* 1.  All other bits can assume any value, but doesn't need to be
    # random!
    def make_guid
      # First build out the time to the microsecond into a 64 bit number.
      now = Time.now
      ti = now.to_i
      tu = now.usec
      t = (1<<63) | (ti<<20) | tu # always 64 bits, though the first 13 are usually the same.

      # Now let's make a 64 bit random number
      r = rand(1<<63) | (1<<63) # Make a 64 bit number, making sure the high bit is a 1.

      # Combine so that the first 64 bits are the random number and the last are the time.
      return (r<<64) | t
    end
    
  end
end