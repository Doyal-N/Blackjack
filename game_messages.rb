class GameMessages
  def self.message(text)
    puts
    puts text
    puts
  end 
  
  def self.frame(text)
    size = text.size + 6
    elem = '*' * size
    puts
    puts elem
    puts "+ #{text} +"
    puts 
  end
end  