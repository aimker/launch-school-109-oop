## QUESTION 1

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

trip = RoadTrip.new
trip.predict_the_future

# The result will be a string returned with a random choice from the array in the choices method.
