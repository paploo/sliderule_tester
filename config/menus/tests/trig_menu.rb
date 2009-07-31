CONFIG[:menus][:trig_menu] = CLI::Menu.new("Powers Menu") do |m|
  m.prompt_text = CONFIG[:menu_prompt]
  
  tests = [
    ['Conversions', 'Convert angles to/from radians and degrees', Generator::Trig::AngleConversions],
    ['Sin', 'Sin and ArcSin.', Generator::Trig::Sin],
    ['Cos', 'Cos and ArcCos.', Generator::Trig::Cos],
    ['Tan', 'Tan and ArcTan.', Generator::Trig::Tan],
    ['Csc', 'Csc and ArcCsc.', Generator::Trig::Csc],
    ['Sec', 'Sec and ArcSec.', Generator::Trig::Sec],
    ['Cot', 'Cot and ArcCot.', Generator::Trig::Cot],
    ['All', 'A mixture of all trig functions.', Generator::Trig::All],
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