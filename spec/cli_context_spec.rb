require File.join(File.dirname(__FILE__), 'spec_helper')

describe CLI::Context do
  
  it "should maintain the context stack." do 
    CLI::Context.reset
    CLI::Context.current.should == nil
    CLI::Context.push(:alpha)
    CLI::Context.push(:beta)
    CLI::Context.current.should == :beta
    CLI::Context.pop
    CLI::Context.current.should == :alpha
    CLI::Context.pop
    CLI::Context.current.should == nil
    CLI::Context.reset
    CLI::Context.current.should == nil
  end
  
  it "should allow registration, deregistration, aliasing, and querying of commands on an instance." do
    context = CLI::Context.new
    context.register_command('sqrt') {|x| Math.sqrt(x)}
    context.register_command('sqr', 'sq', 'square') {|x| x*x}
    
    context.respond_to_command?('sqrt').should == true
    context.respond_to_command?('sqr').should == true
    context.respond_to_command?('sq').should == true
    context.respond_to_command?('square').should == true
    context.respond_to_command?('foo').should == false
    
    context.alias_command('sqr', 'square_it')
    context.respond_to_command?('square_it').should == true
    context.respond_to_command?('foo').should == false
  end
  
  it "should execute a command on instances" do
    context = CLI::Context.new do |c|
      c.register_command('sqrt') {|x| Math.sqrt(x)}
      c.register_command('sqr', 'sq', 'square') {|x| x*x}
    end
    
    context.run_command('sqrt', 2).should be_close(Math.sqrt(2), 10**-12)
    context.run_command('sq', 2).should == 4
    
    lambda {context.run_command('foo')}.should raise_error(NoMethodError)
  end
  
  it "should query command existence through the stack." do
    CLI::Context.reset
    
    toplevel_context = CLI::Context.new do |c|
      c.register_command('sqrt') {|x| Math.sqrt(x)}
    end
    
    current_context = CLI::Context.new do |c|
      c.register_command('sqr', 'sq', 'square') {|x| x*x}
    end
    
    CLI::Context.push(toplevel_context)
    CLI::Context.push(current_context)
    
    CLI::Context.respond_to_command?('sqrt').should == true
    CLI::Context.respond_to_command?('sq').should == true
    CLI::Context.respond_to_command?('foo').should == false
    
    CLI::Context.reset
  end
  
  it "should execute commands through the stack." do
    CLI::Context.reset
    
    toplevel_context = CLI::Context.new do |c|
      c.register_command('sqrt') {|x| Math.sqrt(x)}
    end
    
    current_context = CLI::Context.new do |c|
      c.register_command('sqr', 'sq', 'square') {|x| x*x}
    end
    
    CLI::Context.push(toplevel_context)
    CLI::Context.push(current_context)
    
    CLI::Context.run_command('sqrt', 2).should be_close(Math.sqrt(2), 10**-12)
    CLI::Context.run_command('sq', 2).should == 4
    lambda {CLI::Context.run_command('foo').should}.should raise_error(NoMethodError)
    
    CLI::Context.reset
  end
  
  it "should respect the prescedence order of commands." do
    CLI::Context.reset
    
    toplevel_context = CLI::Context.new do |c|
      c.register_command('log') {|x| Math.log10(x)}
    end
    
    current_context = CLI::Context.new do |c|
      c.register_command('log') {|x| Math.log(x)}
    end
    
    CLI::Context.push(toplevel_context)
    CLI::Context.push(current_context)
    
    CLI::Context.run_command('log', 10).should be_close(Math.log(10), 10**-12)
  end
  
end