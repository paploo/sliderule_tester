module CLI
  # A menuing class that takes many entries, displays them, handles I/O, and
  # uses a block as a handler.
  #
  # Any object that responds to +to_s+ should work as an entry, as the +to_s+ form
  # is used for display and identification.  So while strings are the most
  # common type of entry, an entry class could be used instead, which holds meta
  # data.  Just be sure that the Array#index method works with it!
  class Menu
    
    def initialize(title, *entries, &handler)
      @title = title
      @entries = entries.flatten
      @handler = handler
    end
    
    attr_reader :title, :entries
    
    def to_s
      string = ''
      string << "*** #{title.to_s} ***\n"
      entries.each_with_index do |entry, index|
        string << '%#2d' % (index+1) + ' - ' + entry.to_s + "\n"
      end
      return string
    end
    
    def ask
      STDOUT.puts self.to_s
      choice = CLI::Asker.ask_and_validate("Your choice") {|ch| !choice_to_entry_index(ch).nil?}
      index = choice_to_entry_index(choice)
      @handler.call(index&&entries[index]) unless @handler.nil?
    end
    
    private
    
    # Proceses the input menu entry, by name or num, and returns the index of
    # the entry.
    def choice_to_entry_index(choice)
      num = choice.to_i
      return num-1 if num>0 && num<=entries.length
      return entries.index(choice.to_s) if entries.include?(choice.to_s)
      return nil
    end
    
  end
end