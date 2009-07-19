CONFIG[:menus][:logs_menu] = CLI::Menu.new("Logs Menu") do |m|
  m.prompt_text = CONFIG[:menu_prompt]
  
  tests = [
    [nil, 'Basic Logarithms.', Generator::Logs::SimpleLogs],
    [nil, 'Basic Exponents.', Generator::Logs::SimpleExponents],
    [nil, 'Advanced Logarithms.', Generator::Logs::AdvancedLogs],
    [nil, 'Advanced Exponents.', Generator::Logs::AdvancedExponents],
  ]
  
  tests.each do |name, desc, generator|
    m << CLI::MenuItem.new(name, desc) do
      test = Proctor.new(generator)
      puts test.header
      m.context_stack.push(test)
      nil
    end
  end
  
  m << CLI::MenuItem.new('Up', 'Go up one menu') { m.context_stack.pop; nil }
end