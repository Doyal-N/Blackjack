class User

  attr_reader :balance

  START_BANK = 100
  BET = 10
  MAX_CARD = 3

  def initialize(name)
    @name = name
    @balance = START_BANK
    @cards = []
    @take_a_card = false
    @pass = false
    @open_the_cards = false
  end

  def place_bet
    @balance -= BET
  end

  def miss_a_turn
    puts "#{@name} пропускает ход"
    self.pass = true
  end

  def taken_card(card)
    puts "#{@name} взял карту"
    take_card(card)
    self.take_a_card = true
  end

  def open_cards
    puts "Открываем карты"
    self.open_the_cards = true
  end

  def take_card(card)
    @cards << card if take_card?
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

  def stop_layout
    @card = []
  end  

  #методы-предикаты
  def card_count? 
    @cards.length == MAX_CARD
  end  

  def take_card?
    @cards.length < MAX_CARD
  end  

  def open_cards?(user_choice)
    user_choice == 'о'
  end
  
  


end