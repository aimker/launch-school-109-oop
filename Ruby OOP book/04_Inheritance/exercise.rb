module Unique
  def honk
    puts "I'm honking!"
  end
end

class Vehicle
  attr_accessor :number_of_objects, :color
  attr_reader :year
  NUMBER_OF_WHEELS = 2

  @@number_of_objects = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    Vehicle.number_of_objects_increment ## We increment this through a class method, because the child initialize method will override the parent initialize method.
  end

  def self.calculate_milage(miles, gallons)
    puts "Milage is #{miles/gallons} mpg."
  end

  def self.number_of_objects_increment ##
    @@number_of_objects += 1
  end

  def self.number_of_objects
    @@number_of_objects
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
  end

  def shutOff
    puts "I'm shutting off!"
    @speed = 0
  end

  def changeColor
    puts "Choose a new color:"
    self.color = gets.chomp.to_s.capitalize
    puts "#{self.color} looks great on your car!"
  end

  def self.calculate_milage(miles, gallons)
    puts "Milage is #{miles/gallons} mpg."
  end

  private
  def vehicle_age
    Time.now.year - year.to_i
  end
end

class MyCar < Vehicle
  NUMBER_OF_WHEELS = 4

  def to_s
    "This car is a #{@color} #{@year} #{@model}, going at a speed of #{@speed} mpg."
  end

end


class MyTruck < Vehicle
  include Unique
  NUMBER_OF_WHEELS = 16

  def to_s
    "This truck is a #{@color} #{@year} #{@model}, going at a speed of #{@speed} mpg."
  end
end


volvo = MyCar.new("2008", "Black", "Volvo C30")
puts volvo

ford = MyCar.new("2008", "Black", "Mondeo")
puts ford

scania = MyTruck.new("2012", "Blue", "Scania")
puts scania
scania.honk
scania.speedUp(100)
puts scania.vehicle_age

puts Vehicle.number_of_objects
puts "------------------"
puts MyCar.ancestors
puts "------------------"
puts MyTruck.ancestors
puts "------------------"
puts Vehicle.ancestors
puts "------------------"


## EXERCISE 8 EXPLANATION
## The hi method is private, so it is not available. We need to either move the method definition above the private keyword.
## or delete the private keyword altogether.
