CONFIG[:slide_rule] = SlideRule::MODELS[:generic]

CONFIG[:context_stack] = CLI::ContextStack.new

CONFIG[:root_context] = CLI::Context.new do |c|
  c.main_text = "Root Context"
  c.prompt_text = '# '
  c.register_command('exit', 'EXIT', 'quit', 'QUIT') {puts "Good bye."; Kernel.exit(0)}
  c.register_command('help', '?') {puts "#{c.context_stack.commands.flatten.sort.inspect}"}
end

CONFIG[:context_stack].push CONFIG[:root_context]

require File.join(File.dirname(__FILE__), 'menus')

CONFIG[:context_stack].push CONFIG[:menus][:main_menu]