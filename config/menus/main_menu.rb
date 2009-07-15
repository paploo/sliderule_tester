CONFIG[:menus][:main_menu] = CLI::Menu.new("Main") do |m|
  m.prompt_text = CONFIG[:menu_prompt]
  m.main_text = lambda {"Welcome to the tester, type '?' for help and 'exit' to exit.\nThe current slide rule selection is #{CONFIG[:slide_rule]}."}
  
  m << CLI::MenuItem.new('Lib', 'The slide rule library') { m.context_stack.push(CONFIG[:menus][:slide_rule_library_menu]); nil }
  m << CLI::MenuItem.new('Basic', 'Basic operations like multiplication and division.') { m.context_stack.push(CONFIG[:menus][:basic_menu]); nil }
end