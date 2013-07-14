class Player
  def initialize()
    @health = 20
    @in_attack = false
  end
  
  def play_turn(warrior)
    if warrior.health < @health
      @in_attack = true
    else
      @in_attack = false
    end
    
    @health = warrior.health
    if warrior.feel.empty?
      if warrior.feel.captive?
        warrior.rescue!
      elsif warrior.health < 20 and (not @in_attack)
        warrior.rest!
      else
        warrior.walk!
      end
    else
      warrior.attack!
    end
  end
end
