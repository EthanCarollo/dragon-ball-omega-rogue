class IntelligenceReward < Reward
    def initialize(reward, amount)
        super(reward.name, reward.description, reward.asset_path, reward.hover_asset_path)
        @reward = reward
        @amount = amount
    end
    
    def get_reward
        @reward.get_reward
        Player.instance.character.stats.intelligence += @amount
    end
end