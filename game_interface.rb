module GameInterface
  def get_user_data
    gets.strip
  end

  def get_name
    puts 'Введите имя '
    name = get_user_data
  end

  def user_choice(user)
    ask_user(user)
    choice = get_user_data
    exit if choice == 'выход'
    choice
  end

  def ask_user(user)
    puts 'Что вы хотите?'
    puts "Введите 'п' - пропустить ход." unless user.pass
    puts "Введите 'в' - взять карту." unless user.take_a_card
    puts "Введите 'о' - открыть карты."
    puts "Введите 'выход' для выхода."
  end
  
  def hi_player(name)
    GameMessages.message("Привет, #{name}. Начнем игру!")
  end

  def choice_open_cards
    GameMessages.message('Открываем карты...')
  end

  def choice_new_game
    GameMessages.message('Новая игра...')
  end
  
  def tie
    GameMessages.message('Ничья')
  end

  def show_score(name, score)
    puts "#{name}: #{score}"
  end

  def start_game_info
    puts "Введите 'с' для старта"
    puts "Введите 'выход' для выхода."
  end  

end