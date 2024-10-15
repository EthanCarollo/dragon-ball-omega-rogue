class TrainingManager
  def self.initialize_trainings
    trainings = []
    trainings << Training.new("Entraînement de force", 5)
    trainings << Training.new("Entraînement d'agilité", 8)
    trainings << SuperSayanTraining.new("Entraînement Super Saiyan", 12)
    trainings
  end
end