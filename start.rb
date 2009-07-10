require 'app'

gen = Generator::Basic::Chains.new
puts gen.to_s
puts gen.solution.to_s

puts ''

aa = AnswerAnalyzer.new(Math::PI, Math::PI*Math.sqrt(10))
puts aa.to_s

puts ''

aa = AnswerAnalyzer.new(Math::PI, 3.1)
puts aa.to_s