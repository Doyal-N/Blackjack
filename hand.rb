class Hand
   
  def initialize
    shoe = Shoe.new
    @cards = shoe.cards    
  end

  def deal_cards(amount = 2)
    @cards.sample(amount).each { |card| @cards.delete card }
  end

  def deal_card
    deal_cards(1)
  end  

end