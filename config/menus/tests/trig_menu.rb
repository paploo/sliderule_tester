CONFIG[:menus][:trig_menu] = CLI::Menu.new("Powers Menu") do |m|
  m.prompt_text = CONFIG[:menu_prompt]
  
  tests = [
    ['Conversions', 'Convert angles to/from radians and degrees', Generator::Trig::AngleConversions],
    ['Sin', 'Sine.', Generator::Trig::Sin],
    ['Cos', 'Cosine.', Generator::Trig::Cos],
    ['Tan', 'Tangent.', Generator::Trig::Tan],
    ['Inverse', 'ArcSin, ArcCos, and ArcTan', Generator::Trig::Inverse],
    ['Inverted', 'Sec, Csc, and Cot and their inverses', Generator::Trig::Csc],
    ['All', 'A mixture of all trig functions and their inverses.', Generator::Trig::All],
    ['Polar', 'Conversions to/from Polar Coordinates.', Generator::Trig::Polar],
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