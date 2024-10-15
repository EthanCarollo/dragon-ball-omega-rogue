class SuperSayanTraining < Training
  def activate(player)
    super(player)  # Appel de la méthode de la classe parente
    puts "#{player.name} se transforme grâce à #{@name} !"
    perform_special_action(player)  # Appelle la méthode d'action spéciale
  end

  # Méthode pour définir l'action spéciale de l'entraînement
  def perform_special_action(player)
    # Logique spécifique à chaque entraînement spécial
    puts "#{player.name} est devenu un Super Saiyan grâce à #{@name} !"
  end
end