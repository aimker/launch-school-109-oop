## QUESTION 1
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

# case 1
# hello = Hello.new
# hello.hi

# Here we will receive the message "Hello"

# case 2:
#
# hello = Hello.new
# hello.bye

# Here we will get an error, because there is not a bye method in the lookup chain of the Hello class.

# case 3:
#
# hello = Hello.new
# hello.greet

# Here the greet method of the Greeting class is called, but we get an error, because we do not pass any arguments.

# case 4:
#
# hello = Hello.new
# hello.greet("Goodbye")

# Here we will receive the message "Goodbye". The greet method of the Greeting class is called, with one argument,
# as expected.

# case 5:
#
# Hello.hi

# hi is an instance method, so we will get an error, since there is not an object that calles tha hi method.
