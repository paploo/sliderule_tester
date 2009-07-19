require File.join(File.dirname(__FILE__), 'spec_helper')

describe Random do
  
  it 'should make random floats in (0..1)' do
    float_test(1000, 0.0, 1.0, 10) {Random.float()}
  end
  
  it 'should make random floats with a max value' do
    float_test(1000, 0.0, 10.0, 10) {|min,max| Random.float(max)}
  end
  
  it 'should make random floats with a min and max' do
    float_test(1000, 10.0, 20.0, 10) {|min,max| Random.float(min, max)}
  end
  
  it 'should make a random int' do
    int_test(10000, 0, 100) {Random.int()}
  end
  
  it 'should make a random int within a max value' do
    int_test(1000, 0, 10) {|min,max| Random.int(max)}
  end
  
  it 'should make a random int with a min amd max' do
    int_test(1000, 10, 20) {|min,max| Random.int(min, max)}
  end
  
  it 'should make a random floats in a magnitude range' do
    n = 10000
    
    n.times do
      x = Random.mag_float(1,10)
      x.should >= 1.0
      x.should < 10.0
    end
    
    n.times do
      x = Random.mag_float(0.01,100)
      x.should >= 0.01
      x.should < 100
    end
  end
  
  it 'should make random signs' do
    pending
  end
  
  it 'should select random array values' do
    pending
  end
  
  def float_test(n, min, max, bins, &test_block)
    histogram = Array.new(bins.to_i) {0}
    
    # Get the data and check ranges
    n.times do
      x = test_block.call(min, max)
      
      x.should <= max
      x.should >= min
      
      bin_width = (max-min)/bins.to_f
      index = ((x-min)/bin_width).floor
      index.should < histogram.length
      index.should >= 0
      histogram[index] += 1
    end
    
    # Now check the bin counts are within acceptable error.
    #puts histogram.inspect
    expectation = n.to_f/bins.to_f
    error = 30.0 * Math.sqrt(n)/bins # I sort of felt this one out... need to figure out the real 2 std dev figure.
    #puts [expectation, error].inspect
    histogram.each do |count|
      count.should >= expectation-error
      count.should <= expectation+error
    end
    
    return histogram
  end
  
  def int_test(n, min, max, &test_block)
    bins = max-min+1
    histogram = Array.new(bins.to_i) {0}
    
    # Get the data and check ranges
    n.times do
      x = test_block.call(min, max)
      
      x.should <= max
      x.should >= min
      
      index = x - min
      index.should <= histogram.length
      index.should >= 0
      histogram[index] += 1
    end
      
    # Now check the bin counts are within acceptable error.
    #puts histogram.inspect
    expectation = n.to_f/bins.to_f
    error = 30.0 * Math.sqrt(n)/bins # I sort of felt this one out... need to figure out the real 2 std dev figure.
    #puts [expectation, error].inspect
    histogram.each do |count|
      count.should >= expectation-error
      count.should <= expectation+error
    end

    return histogram
  end
  
end