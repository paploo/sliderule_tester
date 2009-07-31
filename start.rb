# Load the application stack.
require 'app'

# Define a subroutine to handle interrupts more robustly.
def handle_interrupt
  # Ask for input.
  puts "*** INTERRUPT RECEIVED: Are you sure you want to exit? [yes/no]"
  
  # Wait until we get some actual text, resetting if we get more interrupts from
  # an over-zealous panicker.
  response = nil
  while( response.nil? )
    begin
      response = gets.chomp.to_s.downcase
    rescue Interrupt => i
      response = nil
    end
  end
  
  # Process the response.
  if( ['y', 'yes'].include?(response) )
    puts "*** INTERRUPT: Exiting."
    exit(1)
  else
    puts "*** INTERRUPT CANCELLED: Continuing."
  end
end


# The main event loop!
loop do
  begin
    CLI::Prompt.ask(CONFIG[:context_stack])
  rescue SystemExit => se
    raise se
  rescue Interrupt => i
    handle_interrupt()
  rescue Exception => e
    puts "Recieved exception: #{e.class.name}: #{e.inspect}\n\t" + e.backtrace.join("\n\t")
    exit(1)
  end
end