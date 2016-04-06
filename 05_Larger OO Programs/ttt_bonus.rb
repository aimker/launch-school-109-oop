require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  attr_reader :squares

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts "     |     |"
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}"
    puts "     |     |"
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def squares_array
    markers = [0]
    @squares.each_value {|square| markers.push(square.marker)}
    markers
  end

  def unmarked_keys
    @squares.keys.select{|key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      if squares_array.values_at(*line).uniq.length == 1 && squares_array.values_at(*line).first != ' '
        return squares_array.values_at(*line).first
      end
    end
    nil
  end

  def reset
    (1..9).each do |key|
      @squares[key] = Square.new
    end
  end
end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def to_s
    marker
  end
end

class Player
  attr_accessor :score, :nickname, :marker

  def initialize(marker, nickname)
    @marker = marker
    @score = 0
    @nickname = nickname
  end
end

class TTTGame

  attr_reader :board, :human, :computer
  attr_accessor :current_player

  def initialize
    @board = Board.new
    @human_marker = pick_marker
    @human = Player.new(@human_marker, "Aimkerinho")
    @computer_marker = comp_marker
    @computer = Player.new(@computer_marker, "R2-D2")
    @current_player = @human.marker
    @first_to_move = @human.marker
  end

  def play
    display_welcome_message
    # pick_marker
    # system 'clear'
    loop do
      display_board
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        # clear_screen_and_display_board
        clear_screen_and_display_board if human_turn?
      end
      clear_screen_and_display_board
      score_keeper
      display_result
      if is_there_a_tournament_winner?
        display_tournament_winner
        score_reset
      end
      break unless play_again?
      reset
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
    puts ""
  end

  def pick_marker
    human_marker = nil
    puts "Pick your marker (O or X):"
    loop do
      human_marker = gets.chomp.upcase
      break if %w(O X).include? human_marker
      puts "Choose a valid marker"
    end
    human_marker
  end

  def comp_marker
    return 'O' if human.marker == 'X'
    return 'X' if human.marker == 'O'
  end

  def clear # Exercise 1
    system 'clear'
  end

  def display_board # Exercise 2
    puts "#{human.nickname} is a #{human.marker}. #{computer.nickname} is a #{computer.marker}."
    puts "#{human.nickname}: #{human.score}, #{computer.nickname}: #{computer.score}"
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_result
    if board.winning_marker == human.marker
      puts "#{human.nickname} won!"
    elsif board.winning_marker == computer.marker
      puts "#{computer.nickname} won!"
    else
      puts "It's a tie!"
    end
  end

  def score_keeper
    if board.winning_marker == human.marker
      human.score += 1
    elsif board.winning_marker == computer.marker
      computer.score += 1
    end
  end

  def score_reset
    human.score = 0
    computer.score = 0
  end

  def is_there_a_tournament_winner?
    human.score == 5 || computer.score == 5
  end

  def display_tournament_winner
    if human.score == 5
      puts "#{human.nickname} won the 5-score tournament!"
    elsif computer.score == 5
      puts "#{computer.nickname} won the 5-score tournament!"
    end
  end

  def current_player_moves
    if current_player == human.marker
      human_moves
      self.current_player = computer.marker
    elsif current_player == computer.marker
      computer_moves
      self.current_player = human.marker
    end
  end

  def human_turn?
    current_player == human.marker
  end

  def joinor(delimiter=', ', last_word ='or') # BONUS 1
    joined_squares = board.unmarked_keys
    joined_squares[-1] = joined_squares.last.to_s.prepend(" ").prepend(last_word) unless board.unmarked_keys.length == 1
    joined_squares.join(delimiter)
  end

  def human_moves
    puts "Choose a square  (#{joinor}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] =  human.marker
  end

  def computer_attack_position(brd, square, empty) # Attacking block
    Board::WINNING_LINES.each do |line|
      empty = 0
      line.each { |place| empty = place if brd.squares[place].marker == ' '}
      if brd.squares_array.values_at(*line).count(computer.marker) == 2 && empty != 0
        square = empty
        return square
        break
      end
    end
    0
  end

  def computer_defend_position(brd, square, empty) # Defensive block
    Board::WINNING_LINES.each do |line|
      empty = 0
      line.each { |place| empty = place if brd.squares[place].marker == ' ' }
      if brd.squares_array.values_at(*line).count(human.marker) == 2 && empty != 0
        square = empty
        return square
        break
      end
    end
    0
  end

  def is_central_available?(brd) # Checks if central piece is free
    brd.unmarked_keys.include?(5)
  end

  def computer_moves
    square = 0
    empty_square = 0
    # binding.pry
    square = computer_attack_position(board, square, empty_square) if square == 0
    # binding.pry
    square = computer_defend_position(board, square, empty_square) if square == 0
    # binding.pry
    square = 5 if square == 0 && is_central_available?(board)
    square = board.unmarked_keys.sample if square == 0
    board[square] = computer.marker
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def reset
    board.reset
    self.current_player = @first_to_move
    system 'clear'
    puts ''
    puts "Let's play again!"
  end
end

game = TTTGame.new
game.play
