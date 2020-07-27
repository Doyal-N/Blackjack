class Player < User

  def game_options(user_choice, result)
    if can_pass?(user_choice)
      miss_a_turn
    elsif take_card?(user_choice)
      taken_card(result.deal_card)
    elsif open_cards?(user_choice)
      open_cards
    end
  end  
  
  def can_pass?(user_choice)
    user_choice == 'п'
  end  
  
  def take_card?(user_choice)
    user_choice == 'в'
  end
end