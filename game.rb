class Game
  include GameInterface 

  def initialize
    @gambler = Player.new(get_name)
    @casino = Diler.new
    @bank = 0
    @game_over = false
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
  
  end  

end