class SlideRule
  MODELS = {
    :pickett_N4ES => self.new('Pickett', 'N4-ES', 10.00)
  }
  
  def initialize(make, model, decade_length)
    @make = make.to_s
    @model = model.to_s
    @decade_length = decade_length.to_s
  end
  
  attr_reader :make, :model, :decade_length
  
end