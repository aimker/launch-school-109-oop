# Move
class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def paper?
    @value == 'paper'
  end

  def rock?
    @value == 'rock'
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

  def to_s
    @value
  end

end

# Player
class Player
  attr_accessor :move, :name, :score, :move_history

  def initialize
    @move = nil
    @score = 0
    @move_history = []
    set_name
  end

  def human?
    @player_type == :human
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
      choice = gets.chomp
      break if Move::VALUES.include? choice.downcase
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
    self.move_history.push(self.move)
  end
end

# Computer
class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    self.move_history.push(self.move)
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
      "#{human.name.capitalize} won!"
    elsif human.move < computer.move
      "#{computer.name.capitalize} won!"
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

  def move_history
    puts "Moves History:"
    puts "--------------"
    puts "#{human.name} | #{computer.name}"
    human.move_history.length.times do |index|
      puts "#{human.move_history[index]} #{computer.move_history[index]}"
    end
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
      move_history
      break unless play_again?
    end

    display_goodbye_message
  end
end

game = RPSGame.new
game.play
