class User

  attr_reader :balance

  START_BANK = 100
  BET = 10

  def initialize(name)
    @name = name
    @balance = START_BANK
    @cards = []
  end

  def take_card?
    @cards.length < 3
  end  

  def take_card(card)
    @cards << card if take_card?
    puts "#{@name} решил взять карту"
  end
end