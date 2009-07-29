require 'app'

loop do
  begin
    CLI::Prompt.ask(CONFIG[:context_stack])
  rescue SystemExit => se
    raise se
  rescue Interrupt => i
    raise i
  rescue Exception => e
    puts "Recieved exception: #{e.class.name}: #{e.inspect}\n\t" + e.backtrace.join("\n\t")
    exit(1)
  end
end