require 'abbrev'

require 'cli/menu_item'

module CLI
  class Menu < Context
    
    def initialize(title)
      @title = title
      clear_menu_items()
      super()
    end
    
    attr_reader :title
    
    def <<(menu_item)
      @menu_items << menu_item
      @menu_item_map[menu_item.shortcut.downcase.to_s] = menu_item unless menu_item.shortcut.nil?
      cache_commands()
    end
    
    def clear_menu_items
      # Take advantage of ruby 1.9's ordered hashes.
      STDERR.puts "WARNING: Expected the ordered behavior of ruby 1.9 hashes.  Menus will be presented in random order now and number shortcuts may not work!" if RUBY_VERSION < '1.9.0'
      @menu_items = []
      @menu_item_map = {}
      @menu_item_commands = {}
    end
    alias_method :clear, :clear_menu_items
    
    def main_text
      buffer = "\n"
      buffer << " #{title} ".center(72, '-') << "\n"
      buffer << super() << "\n" unless super().nil?
      @menu_items.each_with_index do |item, index|
        shortcut = item.shortcut
        buffer << "  [#{index+1}] "
        buffer << "#{shortcut}" unless shortcut.nil?
        buffer << ": " unless shortcut.nil? || item.description.nil?
        buffer << "#{item.description}" unless item.description.nil?
        buffer << "\n"
      end
      buffer << "\n"
    end
    
    def commands
      return super | @menu_item_commands.keys
    end
    
    def run_command(command, *args)
      if @menu_item_commands.has_key?(command.to_s)
        item = @menu_item_commands[command.to_s]
        return item.run
      else
        return super
      end
    end
    
    private
    
    # Gathers the list of all commands derived from menu items and caches the
    # mapping.
    def cache_commands
      # First get the numbers, because that is easy.
      @menu_items.each_with_index do |item, index|
        @menu_item_commands[(index+1).to_s] = item
      end
      
      # Now get the names.
      @menu_item_map.keys.abbrev.each do |abbrev, shortcut|
        item = @menu_item_map[shortcut]
        @menu_item_commands[abbrev.downcase] = item
      end
    end
    
  end
end