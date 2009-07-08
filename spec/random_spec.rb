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
    
    # Now check the bin counts are within 1 std dev.
    puts histogram.inspect
    expectation = n.to_f/bins.to_f
    error = Math.sqrt(n.to_f) # 1 std dev
    histogram.each do |count|
      count.should >= expectation-error
      count.should <= expectation+error
    end
    
    return histogram
  end
  
end