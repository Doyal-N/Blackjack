class User

  START_BANK = 100
  BET = 10
  MAX_CARD = 3

  attr_reader :balance, :name, :cards
  attr_accessor :take_a_card, :pass, :open_the_cards

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
    BET
  end

  def miss_a_turn
    GameMessages.message('Игрок пропускает ход')
    self.pass = true
  end

  def taken_card(card)
    GameMessages.message('Игрок взял карту')
    take_card(card)
    self.take_a_card = true
  end

  def open_cards
    GameMessages.message('Открываем карты')
    self.open_the_cards = true
  end

  def take_card(card)
    @cards.concat(card) if take_cards?
  end

  def get_money(amount)
    @balance += amount
  end

  def user_win(bank)
    get_money(bank)
    GameMessages.frame("#{@name} победил")
  end  

  def show_cardback
    puts
    @cards.each { print('  ', '†') }
    puts
  end

  def show_cardface 
    puts
    @cards.each { |card| print('  ', "#{card.sign}#{card.suit}") }
    puts
  end   

  def stop_layout
    @cards = []
    @take_a_card = false
    @pass = false
    @open_the_cards = false
  end  

  #методы-предикаты
  def card_count? 
    @cards.length == MAX_CARD
  end  

  def take_cards?
    @cards.length < MAX_CARD
  end  

  def open_cards?(user_choice)
    user_choice == 'о'
  end
end