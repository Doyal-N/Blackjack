class Hand
  def initialize
    shoe = Shoe.new
    @cards = shoe.cards    
  end

  def deal_cards(count = 2)
    @cards.sample(count).each { |card| @cards.delete card }
  end

  def deal_card
    deal_cards(1)
  end  

end