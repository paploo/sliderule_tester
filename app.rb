require File.join(File.dirname(__FILE__), 'config', 'preconfig')

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require 'init'

require File.join(File.dirname(__FILE__), 'config', 'postconfig')