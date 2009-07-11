require File.join(File.dirname(__FILE__), 'spec_helper')
require 'cli/context_stack'

describe CLI::ContextStack do
  
  it "should maintain the context stack." do 
    stack = CLI::ContextStack.new
    stack.reset
    stack.current.should == nil
    stack.push(:alpha)
    stack.push(:beta)
    stack.current.should == :beta
    stack.pop
    stack.current.should == :alpha
    stack.pop
    stack.current.should == nil
    stack.push(:gamma)
    stack.reset
    stack.current.should == nil
  end
  
  it "should query command existence through the stack." do
    stack = CLI::ContextStack.new
    
    toplevel_context = CLI::Context.new do |c|
      c.register_command('sqrt') {|x| Math.sqrt(x)}
    end
    
    current_context = CLI::Context.new do |c|
      c.register_command('sqr', 'sq', 'square') {|x| x*x}
    end
    
    stack.push(toplevel_context)
    stack.push(current_context)
    
    stack.respond_to_command?('sqrt').should == true
    stack.respond_to_command?('sq').should == true
    stack.respond_to_command?('foo').should == false
  end
  
  it "should execute commands through the stack." do
    stack = CLI::ContextStack.new
    
    toplevel_context = CLI::Context.new do |c|
      c.register_command('sqrt') {|x| Math.sqrt(x)}
    end
    
    current_context = CLI::Context.new do |c|
      c.register_command('sqr', 'sq', 'square') {|x| x*x}
    end
    
    stack.push(toplevel_context)
    stack.push(current_context)
    
    stack.run_command('sqrt', 2).should be_close(Math.sqrt(2), 10**-12)
    stack.run_command('sq', 2).should == 4
    lambda {stack.run_command('foo').should}.should raise_error(NoMethodError)
    
    stack.reset
  end
  
  it "should respect the prescedence order of commands." do
    stack = CLI::ContextStack.new
    
    toplevel_context = CLI::Context.new do |c|
      c.register_command('log') {|x| Math.log10(x)}
    end
    
    current_context = CLI::Context.new do |c|
      c.register_command('log') {|x| Math.log(x)}
    end
    
    stack.push(toplevel_context)
    stack.push(current_context)
    
    stack.run_command('log', 10).should be_close(Math.log(10), 10**-12)
  end
end