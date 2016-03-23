## QUESTION 5

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# The instance variable is the @name in the Pizza class.
# The name variable in the Fruit class is just a local variable in the initialize method.

## QUESTION 6

class Cube
  attr_accessor :volume

  def initialize(volume)
    @volume = volume
  end

  def volume
    @volume
  end

  def volume=(new_volume)
    @volume = new_volume
  end

end

# we can access the @volume instance variable, either by using the attr_accessor method,
# or by creating setter and getter methods.

## QUESTION 7

# What will be printed is a text with the object class and the object ID.
# To confirm what to_s does by default for objects, we can consult the Ruby API on the Object class.

## QUESTION 8

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# self.age refers to the object that calls the instance method.
