## QUESTION 7

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end

# The return is not needed, since the sentence is the last statement in the method,
# so it will be returned anyway.
