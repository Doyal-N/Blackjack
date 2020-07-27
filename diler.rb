class Diler < User
  
  PASS = 17

  def initialize(name = 'Croupier')
    super
  end  

  def game_options(result)
    if take_card?(result.score(@cards)) 
      taken_card(result.deal_card)
    elsif can_pass?(result.score(@cards))
      miss_a_turn  
    else 
      open_cards 
  end 

  def can_pass?(score)
    score >= PASS
  end  
  
  def take_card?(score)
    score < PASS
  end

end