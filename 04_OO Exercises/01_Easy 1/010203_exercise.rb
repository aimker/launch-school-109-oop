## QUESTION 1

# 1. TrueClass 2. String 3. Array 4. Fixnum
# To find an object's class we have to call the class function on it. For example true.class

## QUESTION 2

# We just have to include the module to the Car and Truck classes.
# To check if it works, we just have to call the instance method on a car object and a truck object.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

volvo = Car.new
volvo.go_fast

scania = Truck.new
scania.go_fast

## QUESTION 3

# The class method returns the class name of the object. So in the #{self.class} part,
# if the car's object is Car, then 'Car' will be printed.
