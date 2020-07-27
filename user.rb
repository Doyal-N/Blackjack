class User

  attr_reader :balance

  START_BANK = 100
  BET = 10
  MAX_CARD = 3

  def initialize(name)
    @name = name
    @balance = START_BANK
    @cards = []
  end

  def card_count? 
    @cards.length == MAX_CARD
  end  

  def take_card?
    @cards.length < MAX_CARD
  end  

  def take_card(card)
    @cards << card if take_card?
    puts "#{@name} решил взять карту"
  end

  def place_bet
    @balance -= BET
  end
  
  def get_money(amount)
    @balance += amount
  end

  def user_win(bank)
    get_money(bank)
    puts "#{@name} победил"
  end  

  def show_cardback
    @cards.each { print('  ', '†') }
    puts 'Карты скрыты'
  end

  def show_cardface 
    @cards.each { |card| print('  ', "#{card.sign}#{card.suit}") }
  end   





end