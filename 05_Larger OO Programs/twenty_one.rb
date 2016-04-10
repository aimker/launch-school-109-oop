class Participant
  # what goes in here? all the redundant behaviors from Player and Dealer?
  attr_accessor :hand, :total

  def initialize
    @hand = Array.new
    @total = score
  end

  def score(ranks = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'])
    value = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
    score = 0
    hand.each do |card|
      score += value[ranks.index(card[1])]
    end
    score += 10 if (score + 10) <= 21 && hand.flatten.include?('A') # Given that the rule allows only one Ace to be equal to 11.
    # binding.pry
    score
  end

  def hit(deck)
    hand.push(deck.pop)
  end

  def bust? # Checks if the given player busted.
    score > 21
  end

  def blackjack? # Checks if there is a blackjack
    score == 21 && hand.length == 2
  end
end

class Player < Participant
end

class Dealer < Participant
end

class Deck
  SUITS = ['Clubs', 'Diamonds', 'Hearts', 'Spades']
  RANKS = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']

  attr_accessor :shuffled

  def initialize
    @shuffled = initialize_shuffled_deck(SUITS, RANKS)
  end

  def initialize_shuffled_deck(suits, ranks)
    deck = suits.product(ranks).shuffle
    deck
  end
end

class Game
  attr_accessor :player, :dealer, :deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start
    # what's the sequence of steps to execute the game play?
    loop do
    deal_cards
    show_cards(true)
    unless player.blackjack? || dealer.blackjack?
      player_turn
      show_cards(true)
      unless player.bust?
        puts "Now it's the dealer's turn"
        sleep 2
        dealer_turn
      end
    end
    show_result
    break unless play_again?
    reset
    end
  end

  def player_turn # Player turn
    card_total = player.score
    game_deck = deck.shuffled
    loop do
      puts "Insert 'hit' to hit or 'stay' to stay:"
      answer = gets.chomp
      if answer.downcase == 'hit'
        player.hit(game_deck)
        card_total = player.score
        show_cards(true)
        break if player.bust? || player.score == 21
      elsif answer.downcase == 'stay'
        puts 'You chose to stay.'
        break
      else
        puts 'Please insert a valid answer'
        next
      end
    end
    card_total
  end

  def dealer_turn
    game_deck = deck.shuffled
    card_total = 0
    loop do
      show_cards
      card_total = dealer.score
      break if dealer.score >= 17
      dealer.hit(game_deck)
      show_cards
      sleep 2
    end
    card_total
  end

  def deal_cards
    2.times do
      player.hand.push(deck.shuffled.pop)
      dealer.hand.push(deck.shuffled.pop)
    end
  end

  def show_cards(players_turn=false)
    system 'clear'
    puts "Player's hand: #{player.hand}"

    if players_turn
      puts "Dealer's hand: #{dealer.hand.select { |card| card != dealer.hand.first }} + 1 more card..."
    else
      puts "Dealer's hand: #{dealer.hand}"
    end

    puts "Your score is #{player.score}"
    puts "Dealer's score is #{dealer.score}" unless player.bust?|| player.blackjack? || players_turn
  end

  def show_result
    if player.blackjack?
      puts 'Blackjack! You won!'
    elsif dealer.blackjack?
      puts 'Blackjack! Dealer won...'
    elsif player.bust?
      puts 'Bust! Dealer won..'
    elsif dealer.bust?
      puts 'Dealer bust! You won!!'
    elsif player.score > dealer.score
      puts 'You won!'
    elsif player.score < dealer.score
      puts 'Dealer won...'
    else
      puts "It's a tie."
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Sorry, must be y or n.'
    end

    answer == 'y'
  end

  def reset
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end
end

Game.new.start
