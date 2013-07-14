class Player
  def initialize()
    @health = 20
    @in_attack = false
    @step = 0
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
    @step = @step + 1
    @health = warrior.health
    look = warrior.look
    
    print "my health: #{@health}\n"
    print "my look: #{look}\n"
    print "my fell:  #{warrior.feel}\n"
    
    if @step == 1
      warrior.pivot!(:backward)
    elsif has_obj(look, "Wizard")
      warrior.shoot!
    elsif not warrior.feel.empty?
      if warrior.feel.captive?
        warrior.rescue!
      elsif has_obj(look, "Archer")
        warrior.attack!
      else
        warrior.walk!
      end
    else
      warrior.walk!
    end
  end
end



