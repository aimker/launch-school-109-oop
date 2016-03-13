class MyCar

  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speedUp(increment)
    puts "I'm speeding up!"
    @speed += increment
  end

  def break (increment)
    puts "I'm slowing down..."
    @speed -= increment
  end

  def currentSpeed
    puts "My current speed is #{@speed} kph."

  def shutOff
    puts "I'm shutting off!"
    @speed = 0
  end

  def changeColor
    puts "Choose a new color:"
    self.color = gets.chomp.to_s.capitalize
    puts "#{self.color} looks great on your car!"
  end

end
