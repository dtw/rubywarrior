class Player
  def play_turn(warrior)
    # have we reached the back wall yet?
    if @advance != true then
      # is there a space behind?
      if warrior.feel(:backward).empty? then
        warrior.walk!:backward
      # is there a captive behind?
      elsif warrior.feel(:backward).captive? then
        warrior.rescue!:backward
      end
    # is there a space in front?
    elsif warrior.feel.empty? then
      # am I taking damage?
      unless warrior.health < @health then
        # am I at full health?
        if warrior.health < 20 then
          warrior.rest!
        else
          warrior.walk!
        end
      else
        # taking damage but healthy enough to charge
        if warrior.health > 12 then
          warrior.walk!
        # taking damage and need to rest
        else
          warrior.walk!:backward
        end
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
