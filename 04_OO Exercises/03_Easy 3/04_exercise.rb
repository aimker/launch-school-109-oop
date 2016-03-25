## QUESTION 4

class Cat
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat"
  end

end

# To get the desired output from the to_s method, we have to declare it like above.
