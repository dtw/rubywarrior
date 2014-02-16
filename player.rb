class Player
  def play_turn(warrior)
    # add your code here
	  if warrior.feel.empty? then
    	unless warrior.health < 20 then
				warrior.walk!
			else
				warrior.rest!
			end
		else
	    if warrior.feel.enemy? then
				warrior.attack!
 	    end
		end
  end
end
