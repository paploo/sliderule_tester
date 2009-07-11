require 'app'

gen = Generator::Basic::Chains.new
puts gen.to_s
puts gen.solution.to_s

puts ''

aa = AnswerAnalyzer.new(Math::PI, Math::PI*Math.sqrt(10))
puts aa.to_s

puts ''

CLI::Asker.register_command('exit') { puts "EXIT" }

menu = CLI::Menu.new('Alphabet', ['alpha', 'bravo', 'charlie', 'delta', 'echo', 'foxtrot', 'golf', 'hotel', 'india', 'juliet']) do |entry|
  puts "You selected #{entry}"
end
menu.ask