require File.join(File.dirname(__FILE__), 'spec_helper')

describe Random do
  
  it 'should make random floats in (0..1)' do
    n = 1000
    min = 0.0
    max = 1.0
    bin_count = 10
    bins = Array.new(bin_count) {0}
    
    # Get the data, and check the ranges
    n.times do
      x = Random.float
      x.should <= max
      x.should >= min
      index = (x*10).floor
      bins[index] += 1
    end
    
    # Now check bin counts
    puts "#{__LINE__}: #{bins.inspect}"
    expectation = n.to_f/bin_count.to_f
    error = Math.sqrt(n.to_f)
    bins.each_with_index do |count, index|
      count.should >= expectation-error
      count.should <= expectation+error
    end
  end
  
  it 'should make random floats with a max value' do
    n = 1000
    min = 0.0
    max = 10.0
    bin_count = 10
    bins = Array.new(bin_count) {0}
    
    # Get the data, and check the ranges
    n.times do
      x = Random.float(max)
      x.should <= max
      x.should >= min
      index = x.floor
      bins[index] += 1
    end
    
    # Now check bin counts
    puts "#{__LINE__}: #{bins.inspect}"
    expectation = n.to_f/bin_count.to_f
    error = Math.sqrt(n.to_f)
    bins.each_with_index do |count, index|
      count.should >= expectation-error
      count.should <= expectation+error
    end
  end
  
  it 'should make random floats with a min and max' do
    n = 1000
    min = 10.0
    max = 20.0
    bin_count = 10
    bins = Array.new(bin_count) {0}
    
    # Get the data, and check the ranges
    n.times do
      x = Random.float(min, max)
      x.should <= max
      x.should >= min
      index = (x-min).floor
      bins[index] += 1
    end
    
    # Now check bin counts
    puts "#{__LINE__}: #{bins.inspect}"
    expectation = n.to_f/bin_count.to_f
    error = Math.sqrt(n.to_f)
    bins.each_with_index do |count, index|
      count.should >= expectation-error
      count.should <= expectation+error
    end
  end
  
end