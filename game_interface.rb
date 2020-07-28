module GameInterface
  def get_user_data
    gets.strip
  end

  def get_name
    puts 'Введите имя '
    name = get_user_data
    raise 'Как к вам обрашаться?' if name == ''
    name
    error = 3
  rescue RuntimeError
    error -= 1
    puts 'Ошибка. Имя не может быть пустым.'
    retry if error.positive?
  end

  def ask_user(user)
    puts 'Что вы хотите?'
    puts 'Введите 'п' - пропустить ход.' if user.pass
    puts 'Введите 'в' - взять карту.' if user.take_a_card
    puts 'Введите 'о' - открыть карты.'
    puts 'Введите 'выход' для выхода.'
  end
  
  def user_choice(user)
    ask_user(user)
    choice = get_user_data
    exit if choice == 'выход'
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