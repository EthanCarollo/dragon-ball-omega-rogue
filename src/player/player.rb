class PlayerRace 
  def self.sayan
    "sayan"
  end
  def self.chilled
    "chilled"
  end
end

class Player
  @instance = new

  def self.instance
    @instance
  end

  private_class_method :new
  attr_accessor :name, :character, :round, :training_points, :trainings, :window, :race

  def setup(window, name, character, race)
    DebugLog.warning("setup player...")
    @window = window
    @trainings = TrainingManager::initialize_trainings
    @training_points = 10
    @race = race

    # FOR DEBUG
    @training_points = 20000

    @round = 0
    @name = name
    @character = character
  end

  def add_training_points(points)
    @training_points += points
    DebugLog.warning "#{points} points d'entraînement ajoutés. Total : #{@training_points}"
  end

  def have_training(training_name)
    @trainings.any? { |t| t.name == training_name }
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
      DebugLog.warning "Entraînement non trouvé."
      return
    end

    if training.cost > @training_points
      DebugLog.warning "Pas assez de points d'entraînement pour acheter #{training_name}."
    else
      @training_points -= training.cost
      DebugLog.warning "#{training_name} acheté ! Points restants : #{@training_points}"
      training.activate(self)
      @trainings.delete(training)
      window.event_manager.notify("Successfully trained #{training_name}")
    end
  end
end
