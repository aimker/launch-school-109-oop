## The design with every shape as a class would work, if we want to change the rules of the game sometime.
# With this design, the process would be quicker.
# However, if the rules of the game were to stay the same, the previous design is probably simpler.

VALUES = ['rock', 'paper', 'scissors']

# Shape
class Shape
  attr_accessor :type

  def initialize
    set_type
  end

  def rock?
    false
  end

  def paper?
    false
  end

  def scissors?
    false
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end
end

class Rock < Shape
  def set_type
    @type = 'rock'
  end

  def rock?
    true
  end

  def to_s
    "rock"
  end
end

class Paper < Shape
  def set_type
    @type = 'paper'
  end

  def paper?
    true
  end

  def to_s
    "paper"
  end
end

class Scissors < Shape
  def set_type
    @type = 'scissors'
  end

  def scissors?
    true
  end

  def to_s
    "scissors"
  end

end

# Player
class Player
  attr_accessor :move, :name, :score

  def initialize
    @move = nil
    @score = 0
    set_name
  end

  def human?
    @player_type == :human
  end

  def shape_chooser(choice)
    case choice
    when 'rock'
      self.move = Rock.new
    when 'scissors'
      self.move = Scissors.new
    when 'paper'
      self.move = Paper.new
    end
  end

end

# Human
class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts 'Sorry, must enter a value.'
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts 'Please choose rock, paper, or scissors:'
      choice = gets.chomp.downcase
      break if VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    shape_chooser(choice)
  end
end

# Computer
class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    choice = VALUES.sample
    shape_chooser(choice)
  end
end

# RPSGame
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors!'
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors. Good bye!'
  end

  def display_moves
    puts "#{human.name.capitalize} chose #{human.move}"
    puts "#{computer.name.capitalize} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name.capitalize} won!"
    elsif human.move < computer.move
      puts "#{computer.name.capitalize} won!"
    else
      puts "It's a tie"
    end
  end

  def score_count
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def score_telling
    puts "------------------------"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
    puts "------------------------"
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts 'Sorry, something else was entered.'
    end
    return false if answer == 'n'
    return true if answer == 'y'
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      score_count
      score_telling
      break unless play_again?
    end

    display_goodbye_message
  end
end

game = RPSGame.new
game.play
