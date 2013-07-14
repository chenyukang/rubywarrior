class Player
  def initialize()
    @health = 20
    @in_attack = false
  end

  def has_obj(arr, obj)
    for x in arr
      if x.to_s == obj
        return true
      end
    end
    return false
  end
  
  def play_turn(warrior)
    if warrior.health < @health
      @in_attack = true
    else
      @in_attack = false
    end
    
    @health = warrior.health
    print "my health: #{@health}\n"
    look = warrior.look
    if has_obj(look, "Wizard")
      warrior.shoot!
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      warrior.walk!
    end
  end
end


