require 'app'

stack = CLI::ContextStack.new

context_alpha = CLI::Context.new do |c|
  c.main_text = "CONTEXT ALPHA"
  c.prompt_text = "$ "
  c.register_command('exit', 'EXIT', 'quit', 'QUIT') {puts "Thank you for coming."; Kernel.exit(0)}
  c.register_command('sqrt') {|x| Math.sqrt(x)}
end

context_bravo = CLI::Context.new do |c|
  c.main_text = "CONTEXT BRAVO"
  c.prompt_text = "$ "
  c.register_command('sqr', 'sq', 'square') {|x| x*x}
end

stack.push(context_alpha)
stack.push(context_bravo)

loop do
  begin
    CLI::Prompt.ask(stack)
  rescue SystemExit => se
    raise se
  rescue Interrupt => i
    raise i
  rescue Exception => e
    puts "Recieved exception: #{e.class.name}: #{e.inspect}\n\t" + e.backtrace.join("\n\t")
  end
end

# gen = Generator::Basic::Chains.new
# puts gen.to_s
# puts gen.solution.to_s
# 
# puts ''
# 
# aa = AnswerAnalyzer.new(Math::PI, Math::PI*Math.sqrt(10))
# puts aa.to_s
# 
# puts ''
# 
# CLI::Asker.register_command('exit') { puts "EXIT" }
# 
# menu = CLI::Menu.new('Alphabet', ['alpha', 'bravo', 'charlie', 'delta', 'echo', 'foxtrot', 'golf', 'hotel', 'india', 'juliet']) do |entry|
#   puts "You selected #{entry}"
# end
# menu.ask