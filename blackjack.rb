
# create deck of cards
deck = []

class Card
  def initialize(suit, value, points)
    @suit = suit
    @value = value
    @points = points
  end

  def suit
    @suit
  end

  def value
    @value
  end

  def points
    @points
  end

  def to_s
    puts "#{suit}, #{value} (#{points})"
  end

end

suits = ['hearts', 'diamonds', 'spades', 'clubs']
card_values = [ ['Q', 10], ['J', 10], ['K', 10], ['A', 11] ]

for i in 2..10
  card_values.push([i.to_s, i])
end

suits.each do |suit|
  card_values.each do |value|
    card = Card.new(suit, value[0], value[1])
    deck.push(card)
  end
end

# shuffle deck
deck.shuffle!


# calculate score of a hand
def calcScore(hand)
  return hand.inject(0) { |sum, n| sum + n.points }
end

# show game state
def showGame(player, dealer) 
  puts '-----------'

  puts "Player: #{calcScore(player)} points"
  player.each { |card| card.to_s }

  puts '-----------'

  puts "Dealer: #{calcScore(dealer)} points"
  dealer.each { |card| card.to_s }

  puts '-----------'
end


# opening hand
player = []
dealer = []

player.push(*deck.slice!(0, 2))
dealer.push(*deck.slice!(0, 2))

showGame(player, dealer)


# function for prompting user
def userInput(deck, player, dealer, stop) 
  puts "Hit (h) or stand (s)?"
  input = gets.chomp()

  if input == 'h'
    player.push(*deck.shift)
    showGame(player, dealer)
  elsif input == 's'
    dealerPlay(deck, player, dealer)
    stop = true
  else
    puts 'Please enter a valid instruction'
    userInput(deck, player, dealer, stop)
  end

  return stop
end


# if user not lost, dealer plays until >= 17
def dealerPlay(deck, player, dealer)
  until calcScore(dealer) >= 17 do
    dealer.push(*deck.shift)
    showGame(player, dealer)
  end 

  if calcScore(dealer) > 21 
    puts 'You won!'
  elsif 21 - calcScore(dealer) < 21 - calcScore(player)
    puts 'You lost!'
  else
    puts 'It\'s a draw!'
  end
end




# game play
unless calcScore(player) == 21 || calcScore(dealer) == 21
  loop do
    stop = userInput(deck, player, dealer, stop)
    break if stop || calcScore(player) >= 21
  end
end

  

# if code gets here and player has more than 21 points, they lost
puts 'You lost!' if calcScore(player) > 21
if calcScore(player) == 21
  puts 'You won!'
elsif calcScore(dealer) == 21
  puts 'You lost!'
end