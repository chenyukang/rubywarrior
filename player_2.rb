class Player
  def play_turn(warrior)
    # add your code here
    if warrior.feel.empty?
      if warrior.health <= 13
        warrior.rest!
      else
        warrior.walk!
      end
    else
      if warrior.health <= 13
        warrior.rest!
      else
        warrior.attack!
      end
      
    end
  end
end
