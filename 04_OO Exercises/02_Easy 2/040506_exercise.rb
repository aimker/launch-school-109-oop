class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  # def type
  #   @type
  # end
  #
  # def type=(t)
  #   @type = t
  # end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

# Instead of defining setter and getter methods, we can use the attr_accessor method, as shown above,
# to simplify our code.

## QUESTION 5

# excited_dog = "excited dog"
# This is a common variable with a local scope.

# @excited_dog = "excited dog"
# This is an instance variable, and we can tell because of the @ prefix in the variable name.

# @@excited_dog = "excited dog"
# This is an instance variable, and we can tell because of the @@ prefix in the variable name.

## QUESTION 6

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# The self.manufacturer is a class method. Methods that start with self. are class methods.
# You can call the method with the notation class.method (in our case Television.manufacturer).
