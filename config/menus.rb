CONFIG[:menus] = {}

menu_dir = File.join(File.dirname(__FILE__), 'menus')

require File.join(menu_dir, 'tests', 'basic_menu')

require File.join(menu_dir, 'slide_rule_library_menu')
require File.join(menu_dir, 'main_menu')