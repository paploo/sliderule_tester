require 'app'

stack = CLI::ContextStack.new

context_alpha = CLI::Context.new do |c|
  c.main_text = "CONTEXT ALPHA"
  c.prompt_text = "$ "
  c.register_command('exit', 'EXIT', 'quit', 'QUIT') {puts "Thank you for coming."; Kernel.exit(0)}
  c.register_command('help', '?') {puts "#{stack.commands.flatten.sort.inspect}"}
  c.register_command('sqrt') {|x| Math.sqrt(x.to_f)}
end

context_bravo = CLI::Context.new do |c|
  c.main_text = "CONTEXT BRAVO"
  c.prompt_text = "$ "
  c.register_command('sqr', 'sq', 'square') {|x| puts x.to_f*x.to_f}
end

color_menu = CLI::Menu.new("Colors") do |m|
  m.prompt_text = "$ "
  m << CLI::MenuItem.new('Red', 'A scarlet color') { puts "You selected red" }
  m << CLI::MenuItem.new('Orange') { puts "You selected orange" }
  m << CLI::MenuItem.new('Up', 'Go up one menu') { stack.pop; nil }
end

main_menu = CLI::Menu.new("Main") do |m|
  m.prompt_text = "$ "
  m << CLI::MenuItem.new('colors') { stack.push(color_menu); nil }
end

stack.push(context_alpha)
stack.push(context_bravo)
stack.push(main_menu)

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