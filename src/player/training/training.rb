class Training
  attr_accessor :name, :cost

  def initialize(name, cost)
    @name = name
    @cost = cost
  end

  # Méthode pour activer l'entraînement
  def activate(player)
    puts "#{@name} a été activé par #{player.name}."
  end
end