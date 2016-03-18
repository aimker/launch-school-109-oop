class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
puts bob.name

## We get the error because we have only read rights on name, and no setter method,
## which means that we cannot change the name of the instance variable 'name'.
## We can either use the attr_accessor (or attr_writer if we only want write rights) method, or set a
## setter method, like below:

class NewPerson
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end

end

bob = NewPerson.new("Steve")
bob.name = "Bob"
puts bob.name
