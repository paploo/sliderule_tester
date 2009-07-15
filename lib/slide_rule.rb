class SlideRule
  
  def initialize(make, model, decade_length)
    @make = make.to_s
    @model = model.to_s
    @decade_length = decade_length.to_f
  end
  
  attr_reader :make, :model, :decade_length
  
  def name
    return [make, model].compact.join(' ')
  end
  
  def to_s
    return name
  end
  
  MODELS = {
    :generic => self.new('Generic', '10"', 10.00),
    :pickett_N4ES => self.new('Pickett', 'N4-ES', 9.84),
    :pickett_N500ES => self.new('Pickett', 'N-500-ES', 9.84),
    :picket_N600ES => self.new('Pickett', 'N600-ES', 5.92),
    :post_1460 => self.new('Post', '1460', 9.86)
  }
end