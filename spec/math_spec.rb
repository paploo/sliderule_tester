require File.join(File.dirname(__FILE__), 'spec_helper')

describe Math do
  
  it 'should define sec and asec' do
    x = Math.sec(1.0)
    x.should be_close(1.85081571768092561791175324140, 1e-12) # Value verified via mathematica
    
    theta = Math.asec(x)
    theta.should be_close(1.0, 1e-12)
  end
  
  it 'should define csc and acsc' do
    x = Math.csc(1.0)
    x.should be_close(1.18839510577812121626159945237, 1e-12)
    
    theta = Math.acsc(x)
    theta.should be_close(1.0, 1e-12)
  end
  
  it 'should define cot and acot' do
    x = Math.cot(1.0)
    x.should be_close(0.642092615934330703006419986594, 1e-12)
    
    theta = Math.acot(x)
    theta.should be_close(1.0, 1e-12)
  end
  
end