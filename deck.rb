require_relative 'card'
class Deck

  SIGNS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUITS = ['♥', '♦', '♣', '♠']
  
  attr_reader :deck

  def initialize
    @deck = get_cards
  end

  def get_cards 
    deck = []
    SUITS.each do |suit|
      SIGNS.each do |sign|
        deck << Card.new(suit, sign)  
      end 
    end
    deck
  end
end
