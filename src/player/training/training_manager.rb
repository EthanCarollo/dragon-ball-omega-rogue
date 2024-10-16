class TrainingManager
  def self.initialize_trainings
    trainings = []
    trainings << StrengthTraining.new("Entraînement de force", 5, 4)
    trainings << IntelligenceTraining.new("Entraînement d'intelligence", 5, 4)
    trainings << SuperSayanTraining.new("Entraînement Super Saiyan", 12)
    trainings
  end
end