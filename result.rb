class Result < Hand

  WIN = 21
  BASIC = 10
  ACE = 1
  ACE_2 = 11

  def score(cards)
    total= 0
    num = 0
    cards.each do |card|
      num += ACE if card.sign == 'A'
      total += get_basic_score(card)
    end
    add_ace(total, num)
  end

  def get_basic_score(card)
    if ['J', 'Q', 'K'].include? card.sign
      BASIC
    elsif card.sign == 'A'
      ACE
    else
      card.sign.to_i
    end
  end

  def add_ace(total, num)
    num.times do
      ace = ACE_2 - ACE
      total += ace if total + ace <= WIN + 5
    end
    total
  end

  def tie?(player_score, diler_score)
    player_score == diler_score
  end

  def win?(score)
    WIN == score
  end

  def player_difference?(player_score, diler_score)
    score_difference(player_score) < score_difference(diler_score)
  end

  def player_win?(player_score, diler_score)
    win?(player_score) || player_difference?(player_score, diler_score)
  end

  def score_difference(score)
    (WIN - score).abs
  end
  
end  