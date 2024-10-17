class AttackTraining < Training
  def initialize(name, cost, attack)
    super(name, cost)
    @attack = attack 
  end

  def activate(player)
    super(player)  
    DebugLog.warning "#{player.name} se transforme grâce à #{@name} !"
    perform_special_action(player) 
  end

  def perform_special_action(player)
    player.character.add_attack(@attack)
  end
end