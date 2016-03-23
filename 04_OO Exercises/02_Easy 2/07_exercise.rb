# QUESTION 7

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

# cats_count counts the cat objects that are initiated. To test the code, we can check the @@cats_count value,
# initate a new instance, and then check the @@cats_count again.

puts Cat::cats_count
cat = Cat.new('Siamese')
puts Cat::cats_count
