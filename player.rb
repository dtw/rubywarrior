class Player
  def play_turn(warrior)
    # is there a space in front?
    if warrior.feel.empty? then
      # am I hurt AND not taking damage?
      if warrior.health < 20 and warrior.health >= @health then
        warrior.rest!
      else
        warrior.walk!
      end
    # is there a captive in front?
    elsif warrior.feel.captive? then
      warrior.rescue!
    # is there any enemy in front?
    elsif warrior.feel.enemy? then
      warrior.attack!
    end
    # store current health
    @health = warrior.health
    # test if your back is to the wall
    if @advance != true then
      @advance = warrior.feel(:backward).wall?
    end
  end
end
