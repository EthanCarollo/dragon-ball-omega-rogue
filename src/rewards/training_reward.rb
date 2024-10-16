class TrainingReward < Reward
    def initialize(reward, training)
        super(reward.name, reward.description, reward.asset_path, reward.hover_asset_path)
        @reward = reward
        @training = training
    end
    
    def get_reward
        @reward.get_reward
        Player.instance.add_training(@training)
    end
end