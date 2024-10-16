class SuperSayanTraining < Training
  def activate(player)
    super(player)  
    puts "#{player.name} se transforme grâce à #{@name} !"
    perform_special_action(player) 
  end

  def perform_special_action(player)
    player.character.add_attack(SuperSayanAttack.new())
  end
end