class Player
  def initialize()
    @health = 20
    @in_attack = false
    @step = 0
    @look = nil
    @backlook = nil
  end
  
  def has_obj(obj)
    for x in @look
      if x.to_s == obj
        return true
      end
    end
    return false
  end
  
  def back_has(obj)
    for x in @backlook
      if x.to_s == obj
        return true
      end
    end
    return false
  end
  
  def first()
    return @look.first.to_s
  end
  
  def rest_have(obj)
    @look.each_index { |index, obj|
      if index != 0
        if @look[index].to_s == obj
          return true
        end
      end
    }
    return false
  end
  
  def play_turn(warrior)
    
    if warrior.health < @health
      @in_attack = true
    else
      @in_attack = false
    end
    
    @health = warrior.health
    @look = warrior.look
    @backlook = warrior.look(:backward)
    
    print "health: #{@health}\n"
    if @health < 20 and warrior.feel.empty? and (not @in_attack)
      if has_obj("Wizard") and @health < 20
        warrior.walk!(:backward)
      elsif back_has("Archer")
        warrior.pivot!
      else
        warrior.rest!
      end
    elsif not warrior.feel.empty?
      if warrior.feel.captive?
        warrior.rescue!
      elsif warrior.feel.wall?
        warrior.pivot!
      elsif @health < 15
        warrior.walk!(:backward)
      else
        warrior.attack!
      end
    elsif has_obj("Archer") or has_obj("Wizard")
      warrior.shoot!
    else
      warrior.walk!
    end
  end
end






