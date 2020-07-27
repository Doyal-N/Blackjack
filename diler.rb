class Diler < User
  
  PASS = 17

  def initialize(name = 'Croupier')
    super
  end  

  def can_pass?(score)
    score >= PASS
  end  
  
  def take_card?(score)
    score < PASS
  end

end