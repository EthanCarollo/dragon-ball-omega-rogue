class RewardFactory

    def self.get_intelligence_reward(amount = 5)
        reward_instance = Reward.new("Intelligence Reward", 
                                    "This reward add #{amount} to intelligence",
                                    "./assets/ability/release_v1.2-single_1.png", 
                                    "./assets/ability/release_v1.2-single_1.png")
        IntelligenceReward.new(reward_instance, amount)
    end

    def self.get_strength_reward(amount = 5)
        reward_instance = Reward.new("Strength Reward",
                                     "This reward add #{amount} to strength",
                                     "./assets/ability/release_v1.2-single_1.png",
                                     "./assets/ability/release_v1.2-single_1.png")
        StrengthReward.new(reward_instance, amount)
    end

    def self.get_intelligence_strength_reward(amount = 5)
        reward_instance = Reward.new("Strength & Intelligence Reward",
                                     "This reward add #{amount} to strength and intelligence",
                                     "./assets/ability/release_v1.2-single_1.png",
                                     "./assets/ability/release_v1.2-single_1.png")
        IntelligenceReward.new(StrengthReward.new(reward_instance, amount), amount)
    end

    def self.get_random_reward()
        return [
            RewardFactory.get_intelligence_reward(6),
            RewardFactory.get_strength_reward(6),
            RewardFactory.get_intelligence_strength_reward(3),
        ]
    end

    def self.get_training_reward(training, asset_path = "./assets/rewards/ssjgod_reward.png", hover_asset_path = "./assets/rewards/ssjgod_reward.png")
        reward_instance = Reward.new("Training Reward", 
                                    "This reward add #{training.name} in training access",
                                    asset_path, 
                                    hover_asset_path)
        TrainingReward.new(reward_instance, training)
    end

    def self.get_ssj_train_reward()
        return RewardFactory.get_training_reward(AttackTraining.new("Entraînement Super Saiyan", 12, SuperSayanAttack.new()), "./assets/rewards/ssj_reward.png", "./assets/rewards/ssj_reward.png")
    end

    def self.get_ssj_god_train_reward()
        return RewardFactory.get_training_reward(AttackTraining.new("Entraînement Super Saiyan God", 30, SuperSayanGodAttack.new()))
    end

end