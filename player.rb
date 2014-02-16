class Player
  def play_turn(warrior)
    # add your code here
    if warrior.feel.empty? then
    	warrior.walk!
    elsif warrior.feel.enemy? then
	warrior.attack!
    end
  end
end
