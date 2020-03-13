
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

# prompt user to hit or stand
def userInput(deck, player, dealer) 
  puts "Hit or stand?"
  input = gets.chomp()

  if input == 'h'
    player.push(*deck.shift)
    showGame(player, dealer)
  elsif input == 's'
    dealerPlay()
  else
    puts 'Please enter a valid instruction'
    userInput(deck, player, dealer)
  end
end


until calcScore(player) >= 21 do
  userInput(deck, player, dealer)
end



# if user not lost, dealer plays until >= 17
def dealerPlay()
  pass
end