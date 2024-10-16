
class Player
  @instance = new

  def self.instance
    @instance
  end

  private_class_method :new
  attr_accessor :name, :character, :round, :training_points, :trainings

  def setup(name, character)
    puts("setup player...")
    @trainings = TrainingManager::initialize_trainings
    @training_points = 10
    
    # FOR DEBUG
    @training_points = 20000

    @round = 0
    @name = name
    @character = character
  end

  def add_training_points(points)
    @training_points += points
    puts "#{points} points d'entraînement ajoutés. Total : #{@training_points}"
  end

  def add_training(training)
    @trainings << training
  end

  def available_trainings
    @trainings.select { |t| t.cost <= @training_points }
  end

  def buy_training(training_name, window)
    training = @trainings.find { |t| t.name == training_name }
    if training.nil?
      puts "Entraînement non trouvé."
      return
    end

    if training.cost > @training_points
      puts "Pas assez de points d'entraînement pour acheter #{training_name}."
    else
      @training_points -= training.cost
      puts "#{training_name} acheté ! Points restants : #{@training_points}"
      training.activate(self)
      @trainings.delete(training)
      window.event_manager.notify("Successfully trained #{training_name}")
    end
  end
end
