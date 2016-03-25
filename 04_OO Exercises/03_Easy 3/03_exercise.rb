## QUESTION 3

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# We can very simply create 2 different classes with the code below

bella = AngryCat.new(5, 'Bella')
liza = AngryCat.new(3, 'Liza')

# The two objects have different age and name.
