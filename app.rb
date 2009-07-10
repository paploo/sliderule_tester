$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require 'init'

# TO DO
# Need Random float method that can give even probabilities of values in different magnitudes.
# Need a pretty output on floats (need own float wrapper or just override float's to_s method, maybe with sigfigs arg... or gimme class?)

puts 0.000314
puts 0.00314
puts 0.00000546.to_s
puts 3.14159265358979323846.to_s
puts 31415926535.0.to_s
puts 314159265358979.0.to_s
puts ""

gen = Generator::Basic::Chains.new
puts '++ ' + gen.to_s
puts '-- ' + gen.solution.to_s