class Game
  def initialize
    @game = GameInterface.new
    @game.hello
    @gambler = Player.new(@game.get_name)
    @game.hi_player(@gambler.name)
    @casino = Diler.new
    @game.start_game_info
    while choice = @game.get_user_data
      play(choice)
    end
  end

  attr_accessor :bank, :game_end

  def play(choice)
    @game.margin
    if choice == 'с'
      start
    elsif choice == 'выход'
      exit
    else
      @game.message('Введите корректный выбор')
    end
  end

  def start
    @game.choice_new_game
    @bank = 0
    @game_end = false
    @result = Result.new
    place_bets
    hand_card
    process
    husking
  end

  def place_bets
    self.bank += @gambler.place_bet
    self.bank += @casino.place_bet
  end

  def hand_card
    @gambler.take_card(@result.deal_cards)
    @casino.take_card(@result.deal_cards)
  end

  def player_turn
    info
    @gambler.game_options(@game.user_choice(@gambler), @result)
    self.game_end = @gambler.open_the_cards
  end

  def casino_move
    @casino.game_options(@result)
    self.game_end = @casino.open_the_cards
  end

  def process
    until @game_end
      player_turn
      break if @game_end || cards_none?

      casino_move
      stop_play if cards_none?
    end
  end

  def husking
    @game.choice_open_cards
    info
    victory
    bank_zero
    card_zero
    know_balance
    self.game_end = true
    exit if impossible_game?
    @game.start_game_info
  end

  def stop_play
    info
    self.game_end = true
  end

  def impossible_game?
    @gambler.balance.zero? || @casino.balance.zero?
  end

  def cards_none?
    @gambler.card_count? && @casino.card_count?
  end

  def bank_zero
    self.bank = 0
  end

  def card_zero
    @gambler.stop_layout
    @casino.stop_layout
  end

  def pick_up_money_tie(money)
    @gambler.get_money(money)
    @casino.get_money(money)
  end

  def know_balance
    @game.frame("--- БАНК ---\nБаланс игрока -  #{@gambler.balance}\nДеньги крупье - #{@casino.balance}")
  end

  def info
    if @game_end
      @casino.show_cardface
      @game.show_score(@casino.name, @result.score(@casino.cards))
    else
      @casino.show_cardback
    end
    @gambler.show_cardface
    @game.show_score(@gambler.name, @result.score(@gambler.cards))
  end

  def victory
    player = @result.score(@gambler.cards)
    diler = @result.score(@casino.cards)
    if @result.tie?(player, diler)
      @game.tie
      pick_up_money_tie(@bank / 2)
    elsif @result.player_win?(player, diler)
      @gambler.user_win(@bank)
    else
      @casino.user_win(@bank)
    end
  end
end
