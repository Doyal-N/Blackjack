class GameInterface
  def get_user_data
    STDOUT.write 'Ваш текст >>> '
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
    frame("Привет, #{name}. Начнем игру!")
  end

  def choice_open_cards
    message('Открываем...')
  end

  def choice_new_game
    frame('Новая игра...')
  end

  def hello
    frame('Приветсвуем в казино!')
  end  
  
  def tie
    message('Ничья')
  end

  def show_score(name, score)
    puts
    puts "#{name}: #{score}"
  end

  def start_game_info
    puts "Введите 'с' для старта"
    puts "Введите 'выход' для выхода."
  end  

  def message(text)
    puts
    puts text
    puts
  end 
  
  def frame(text)
    size = text.size + 6
    elem = '*' * size
    puts
    puts elem
    puts "+ #{text} +"
    puts 
  end
end
