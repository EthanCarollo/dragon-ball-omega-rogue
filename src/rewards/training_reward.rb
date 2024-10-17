class TrainingReward < Reward
    def initialize(reward, training)
        super("Training #{reward.name}", "#{reward.description}, add #{training.name} in training access", reward.asset_path, reward.hover_asset_path)
        @reward = reward
        @training = training
    end
    
    def get_reward
        @reward.get_reward
        Player.instance.add_training(@training)
    end
end

class TrainingPointReward < Reward
    def initialize(reward, maount)
        super("Training #{reward.name}", "#{reward.description}, add #{amount} to training point", "./assets/rewards/training_reward.png", "./assets/rewards/training_reward.png")
        @reward = reward
    end
    
    def get_reward
        @reward.get_reward
        Player.instance.add_training_points(@amount)
    end
end