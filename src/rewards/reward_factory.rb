class RewardFactory

    def self.get_intelligence_reward(amount = 5)
        reward_instance = Reward.new("Intelligence Reward", 
                                    "This reward add #{amount} to intelligence",
                                    "./assets/ability/release_v1.2-single_1.png", 
                                    "./assets/ability/release_v1.2-single_1.png")
        IntelligenceReward.new(reward_instance, amount)
    end

end