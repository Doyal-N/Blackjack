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
  end 

  def can_pass?(score)
    score >= PASS && !@pass
  end  
  
  def take_card?(score)
    score < PASS && !@take_a_card
  end

end