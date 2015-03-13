class Player
  def play_turn(warrior)
    # add your code here
    if warrior.feel.empty? then
      if warrior.health < 20 and warrior.health >= @health then
        warrior.rest!
      else
        warrior.walk!
      end
    elsif warrior.feel.captive? then
      warrior.rescue!
    elsif warrior.feel.enemy? then
      warrior.attack!
    end
    @health = warrior.health
  end
end
