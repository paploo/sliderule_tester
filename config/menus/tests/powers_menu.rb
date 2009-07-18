CONFIG[:menus][:powers_menu] = CLI::Menu.new("Powers Menu") do |m|
  m.prompt_text = CONFIG[:menu_prompt]
  
  tests = [
    [nil, 'Basic Squares and Roots.', Generator::Powers::BasicSquaresAndRoots],
    [nil, 'Basic Cubes and Cube Roots.', Generator::Powers::BasicCubesAndRoots],
    [nil, 'Compound Squares (i.e. a*x^2).', Generator::Powers::CompoundSquares],
    [nil, 'Compound Roots (i.e. a*sqrt(x)).', Generator::Powers::CompoundRoots],
    [nil, 'Basic Arbitrary Powers.', Generator::Powers::BasicPowers],
    [nil, 'Large and Small Arbitrary Powers.', Generator::Powers::LargeAndSmallPowers]
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