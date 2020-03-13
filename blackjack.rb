
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
    puts "#{suit}, #{value} (#{points} points)"
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
  score = hand.inject(0) { |sum, n| sum + n.points }
  return score
end


# opening hand
sam = []
dealer = []

sam.push(*deck.slice!(0, 2))
dealer.push(*deck.slice!(0, 2))

# puts 'Deck'
# deck.each { |card| card.to_s }
puts "Sam: #{calcScore(sam)}"
sam.each { |card| card.to_s }

puts "Dealer: #{calcScore(dealer)}"
dealer.each { |card| card.to_s }


# prompt user to hit or stand


# if user not lost, dealer plays until >= 17