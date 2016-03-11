### We create a new object in Ruby by typing the class name (existing or new), followed by the new method.
## Below is an example, with a new class.

# class Human
# end
#
# bob = Human.new

## Modules offer an alternative way of polymprphism in Ruby. In modules we can declare a
## set of methods, that can be used in multiple classes. It is not however independent, it has to be included in a class, in order to be used.

module HumanFunctions
  def walk
    puts "Hey, I'm walking!"
  end

  def speak(message)
    puts "I say #{message}"
  end
end

class Human
  include HumanFunctions
end

bob = Human.new
bob.walk
bob.speak("Hey!")
