CONFIG[:menus][:slide_rule_library_menu] = CLI::Menu.new("Slide Rule Library") do |m|
  m.prompt_text = CONFIG[:menu_prompt]
  m.main_text = "The current slide rule selection is #{CONFIG[:slide_rule]}."
  
  SlideRule::MODELS.each do |key, model|
    m << CLI::MenuItem.new(nil, model.name) do
      CONFIG[:slide_rule] = model
      puts "Slide rule selection is now the #{model.name}."
      m.main_text = "The current slide rule selection is #{CONFIG[:slide_rule]}."
      m.context_stack.pop
      nil
    end
  end
end