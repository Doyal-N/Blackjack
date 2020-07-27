class Hand
  def initialize
    shoe = Shoe.new
    @cards = shoe.cards    
  end

  def deal_cards(card = 2)
    @cards.sample(card).each { |card| @cards.delete card }
  end

  def deal_card
    deal_cards(1)
  end  

end