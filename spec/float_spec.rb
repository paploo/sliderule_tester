require File.join(File.dirname(__FILE__), 'spec_helper')

describe Float do
  
  it 'should round to sigfigs' do
    2.71828182846.round_sigfigs(1).should == 3.0
    2.71828182846.round_sigfigs(2).should == 2.7
    2.71828182846.round_sigfigs(3).should == 2.72
    2.71828182846.round_sigfigs(4).should == 2.718
    2.71828182846.round_sigfigs(5).should == 2.7183
  end
  
  it 'should split into significand and exponent' do
    2.71828182846.split.should == [2.71828182846, 0]
    -15621.65.split.should == [-1.562165, 4]
    
    # Multiplying up adds a small rounding factor that causes an issue.
    #-0.0003242.split.should == [-3.242, -4]
    (-0.0003242.split[0] - (-3.242)).abs.should < 10e-12
    -0.0003242.split[1].should == -4
  end
  
  it 'should give pretty output' do
    0.0.to_pretty_string.should == '0'
    3.0.to_pretty_string.should == '3'
    323.0.to_pretty_string.should == '323'
    1000.0.to_pretty_string.should == '1000'
    1234.0.to_pretty_string.should == '1234'
    
    -0.00031415.to_pretty_string.should == '-0.0003142'
    0.0031415.to_pretty_string.should == '0.003142'
    3.14159265358979323846.to_pretty_string.should == '3.142'
    
    0.00000546.to_pretty_string.should == '5.46e-6'
    31415926535.0.to_pretty_string.should == '3.142e+10'
    314159265358979.0.to_pretty_string.should == '3.142e+14'
  end
  
end