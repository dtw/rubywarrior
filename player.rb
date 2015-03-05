class Player
  def play_turn(warrior)
    # add your code here
    if warrior.feel.empty? then
      unless warrior.health < 20 then
        warrior.walk!
      else
        if warrior.health < @health then
          warrior.walk!
        else
          warrior.rest!
        end
      end
    elsif warrior.feel.captive? then
      warrior.rescue!
    elsif warrior.feel.enemy? then
      warrior.attack!
    end
    @health = warrior.health
  end
end
