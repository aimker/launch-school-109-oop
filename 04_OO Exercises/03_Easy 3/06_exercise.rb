## QUESTION 6

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

# self.age refers to the getter class set by attr_accessor.
# Instead of self.age, we can write @age.
