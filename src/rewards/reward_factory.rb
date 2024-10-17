class RewardFactory

    def self.get_intelligence_reward(amount = 5)
        reward_instance = Reward.new()
        IntelligenceReward.new(reward_instance, amount)
    end

    def self.get_strength_reward(amount = 5)
        reward_instance = Reward.new()
        StrengthReward.new(reward_instance, amount)
    end

    def self.get_intelligence_strength_reward(amount = 5)
        reward_instance = Reward.new()
        IntelligenceReward.new(StrengthReward.new(reward_instance, amount), amount)
    end

    def self.get_training_reward(training, asset_path = "./assets/rewards/ssjgod_reward.png", hover_asset_path = "./assets/rewards/ssjgod_reward.png")
        reward_instance = Reward.new("Reward", "It will improve your character", asset_path, hover_asset_path)
        TrainingReward.new(reward_instance, training)
    end

    def self.get_ssj_train_reward()
        return RewardFactory.get_training_reward(AttackTraining.new("Entraînement Super Saiyan", 12, SuperSayanAttack.new()), "./assets/rewards/ssj_reward.png", "./assets/rewards/ssj_reward.png")
    end

    def self.get_ssj_god_train_reward()
        return RewardFactory.get_training_reward(AttackTraining.new("Entraînement Super Saiyan God", 30, SuperSayanGodAttack.new()))
    end

    def self.get_random_reward()
        int_reward = RewardFactory.get_intelligence_reward(6)
        str_reward = RewardFactory.get_strength_reward(6)
        int_str_reward = RewardFactory.get_intelligence_strength_reward(3)
        return [
            [int_reward, RewardFactory.get_intelligence_reward(2)].sample,
            str_reward,
            [SenzuReward.new(int_str_reward), int_str_reward, SenzuReward.new(RewardFactory.get_strength_reward(2))].sample,
        ].shuffle
    end

    def self.get_ssj_reward()
        player = Player.instance
        intelligence_reward = RewardFactory.get_intelligence_reward(6)
        
        if player.race == PlayerRace.sayan and player.have_training("Entraînement Super Saiyan") == false and player.character.have_attack("Super Sayan transformation") == false
            return [
                [intelligence_reward, SenzuReward.new(intelligence_reward)].sample,
                RewardFactory.get_ssj_train_reward,
                RewardFactory.get_intelligence_strength_reward(3),
        ].shuffle
        end
        return [
            [intelligence_reward, SenzuReward.new(intelligence_reward)].sample,
            RewardFactory.get_strength_reward(6),
            RewardFactory.get_intelligence_strength_reward(3),
        ].shuffle
    end

end