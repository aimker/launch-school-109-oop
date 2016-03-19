class Person
  attr_accessor :name, :first_name, :last_name

  def initialize(full_name)
    full_name_processing(full_name)
  end

  def name
    if @last_name == ""
      @name = @first_name
    else
      @name = @first_name + " " + @last_name
    end
  end

  def name=(full_name) # Exercise 3
    full_name_processing(full_name)
  end

  def full_name_processing(full_name)
    @name = full_name
    @first_name = full_name.split.first
    @last_name = full_name.split.length > 1 ? full_name.split.last : ""
  end

  def to_s
    name
  end

end

bob = Person.new('Robert')
bob.name                 # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
puts bob.inspect
bob.last_name = 'Smith'
bob.name
puts bob.inspect

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name
puts bob.inspect

# Exercise 4
puts "----------------"

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts bob.name == rob.name

# Exercise 5
puts "----------------"

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
