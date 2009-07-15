module CLI
  class MenuItem
    
    def initialize(shortcut, description=nil, &handler)
      @shortcut = shortcut
      @description = description
      @handler = handler
    end
    
    attr_reader :shortcut, :description
    
    def run
      @handler.call() unless @handler.nil?
    end
    
  end
end