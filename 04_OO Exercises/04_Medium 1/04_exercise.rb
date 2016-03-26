class Greeting
  def greet(message)
    puts "#{message}"
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

hello_object = Hello.new
hello_object.hi

goodbye_object = Goodbye.new
goodbye_object.bye
