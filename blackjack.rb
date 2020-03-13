
# create deck of cards
deck = []

suits = ['hearts', 'diamonds', 'spades', 'clubs']

card_values = [ ['Q', 10], ['J', 10], ['K', 10], ['A', 11] ]

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



end

for i in 2..10
  card_values.push([i.to_s, i])
end

suits.each do |suit|
  card_values.each do |value|
    card = Card.new(suit, value[0], value[1])
    deck.push(card)
  end
end

