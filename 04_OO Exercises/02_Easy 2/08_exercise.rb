# QUESTION 8

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

## QUESTION 9
# In such a case, the Bingo object would use the play method of the Bingo class,
# based on the lookup chain of the Bingo class.

## QUESTION 10

# - Creating objects allow programmers to think more abstractly about the code they are writing.
# - Objects are represented by nouns so are easier to conceptualize.
# - It allows us to only expose functionality to the parts of code that need it,
#   meaning namespace issues are much harder to come across.
# - It allows us to easily give functionality to different parts of an application without duplication.
# - We can build applications faster as we can reuse pre-written code.
# - As the software becomes more complex this complexity can be more easily managed.
