class Game
  include GameInterface 

  attr_accessor :bank, :game_end

  def initialize
    @gambler = Player.new(get_name)
    @casino = Diler.new
    @bank = 0
    @game_end = false
    @result = Result.new
    hi_player(@get_name)
    start_game_info
    while (choice = get_user_data)
      play(choice)      
    end
  end

  def play(choice)
    if choice == 'с'
      start
    elsif choice == 'выход'
      exit
    else 
      puts 'Введите корректный выбор'    
    end  
  end
  
  def start
    choice_new_game
    place_bets
    hand_card

  end  

  def place_bets
    self.bank = @gambler.place_bet + @casino.place_bet
  end

  def hand_card
    @gambler.take_card(@result.deal_cards)
    @casino.take_card(@result.deal_cards)
  end

  def player_turn
    @gambler.game_options(user_choice(@gambler), @result)
    self.game_end = @gambler.open_the_cards
  end 
  
  def casino_move
    
  end

end