require File.join(File.dirname(__FILE__), 'spec_helper')

describe CLI::Context do
  
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
  
end