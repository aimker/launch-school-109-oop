## QUESTION 9

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Here self in self.cats_count refers to the Cat class itself.

## QUESTION 10

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# To create a new Bag instance, we need the color and material values.
