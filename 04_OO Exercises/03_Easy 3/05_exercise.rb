## QUESTION 5

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer # Will present an error, since it is a class method
tv.model # This instance method will be called correctly

Television.manufacturer # manufacturer is a class method, so this is the correct way to call it.
Television.model # model is an instance method, so we need to call it from a class object, not the class itself.
