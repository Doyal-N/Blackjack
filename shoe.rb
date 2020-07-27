class Shoe
 
  attr_reader :cards

  def initialize
    deck = DeckOfCards.new
    @deck = deck.deck
    @cards = mix_cards
  end    

  def mix_cards
    cards = []
    cards << @deck.shuffle
  end
end