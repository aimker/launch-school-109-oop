## Question 2

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# To fix the error in Hello.hi, we either have to call hi method from a hello object,
# or by changing the hi method to self.hi, so it becomes a class method.
