STDERR.puts "#{'*'*72}\nThis application is designed for Ruby 1.9.1,\nYou may experience bugs and crashes running ruby #{RUBY_VERSION}.\n#{'*'*72}" if RUBY_VERSION<'1.9.1'

require File.join(File.dirname(__FILE__), 'config', 'preconfig')

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require 'init'

require File.join(File.dirname(__FILE__), 'config', 'postconfig')