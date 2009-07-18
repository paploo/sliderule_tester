CONFIG[:menus][:basic_menu] = CLI::Menu.new("Basic Menu") do |m|
  m.prompt_text = CONFIG[:menu_prompt]
  
  tests = [
    ['Multiplication', '2-4 random numbers multiplied.', Generator::Basic::Multiplication],
    ['Division', '2-4 random numbers divided.', Generator::Basic::Division],
    ['Fractions', 'Multiplication fractions.', Generator::Basic::Fractions],
    ['Terms', 'A complex term with a compound numerator and denominator.', Generator::Basic::Terms],
    ['Ratios', 'Ratio proportion problems.', Generator::Basic::Ratios]
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