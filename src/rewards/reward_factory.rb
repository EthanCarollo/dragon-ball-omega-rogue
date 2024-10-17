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

    def self.get_random_reward()
        int_reward = RewardFactory.get_intelligence_reward(6)
        str_reward = RewardFactory.get_strength_reward(6)
        int_str_reward = RewardFactory.get_intelligence_strength_reward(3)
        return [
            [int_reward, RewardFactory.get_intelligence_reward(2), TrainingPointReward.new(RewardFactory.get_intelligence_reward(2), [4,7].sample)].sample,
            [str_reward, RewardFactory.get_strength_reward(2), TrainingPointReward.new(RewardFactory.get_strength_reward(2), 8)].sample,
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
        return RewardFactory.get_random_reward
    end

    # This is like my little shitty function where I do a big switch for decorate the reward, cause it's data driven
    def self.decorateReward(reward, decorator)
        if decorator["name"] == "senzu"
            return SenzuReward.new(reward)
        elsif decorator["name"] == "strength"
            return StrengthReward.new(reward, decorator["amount"])
        elsif decorator["name"] == "intelligence"
            return IntelligenceReward.new(reward, decorator["amount"])
        elsif decorator["name"] == "training_point"
            return TrainingPointReward.new(reward, decorator["amount"])
        elsif decorator["name"] == "ssj_reward"
            return TrainingReward.new(reward, AttackTraining.new("Entraînement Super Saiyan", 12, SuperSayanAttack.new()))
        elsif decorator["name"] == "ssjgod_reward"
            return TrainingReward.new(reward, AttackTraining.new("Entraînement Super Saiyan God", 30, SuperSayanGodAttack.new()))
        elsif decorator["name"] == "kamehameha_reward"
            return TrainingReward.new(reward, AttackTraining.new("Entraînement Kamehameha", 6, StrengthAttack.new("Kamehameha", 40, 60)))
        elsif decorator["name"] == "garic_cannon_reward"
            return TrainingReward.new(reward, AttackTraining.new("Entraînement Garric Cannon", 6, IntelligenceAttack.new("Garric Cannon", 40, 60)))
        elsif decorator["name"] == "death_ball_reward"
            return TrainingReward.new(reward, AttackTraining.new("Entraînement Garric Cannon", 28, IntelligenceAttack.new("Death Ball", 92, 134)))
        elsif decorator["name"] == "spirit_sword_reward"
            return TrainingReward.new(reward, AttackTraining.new("Entraînement Spirit Sword", 43, IntelligenceAttack.new("Spirit Sword", 140, 150)))
        elsif decorator["name"] == "supernova_reward"
            return TrainingReward.new(reward, AttackTraining.new("Entraînement Supernova", 12, IntelligenceAttack.new("Supernova", 40, 300)))
        elsif decorator["name"] == "masenko_reward"
            return TrainingReward.new(reward, AttackTraining.new("Entraînement Masenko", 54, IntelligenceAttack.new("Masenko", 34, 76)))
        elsif decorator["name"] == "hellzone_grenade_reward"
            return TrainingReward.new(reward, AttackTraining.new("Entraînement Hellzone", 39, IntelligenceAttack.new("Hellzone", 12, 400)))
        elsif decorator["name"] == "genki_dama_reward"
            return TrainingReward.new(reward, AttackTraining.new("Entraînement Genki Dama", 200, IntelligenceAttack.new("Genki Dama", 490, 4000)))
        else
            DebugLog.error("Decorator doesn't exist for : #{decorator}")
            return reward
        end
    end

    def self.get_reward(rewards, name)
            all_rewards = rewards.map{ |reward| 
                returned_reward = Reward.new
                reward["decor"].each do |decorator_string|
                    returned_reward = RewardFactory.decorateReward(returned_reward, decorator_string)
                end
                returned_reward
            }
            DebugLog.info("SUCCESS : Successfully created rewards : #{name}")
            return all_rewards.sample(3)
        rescue
            DebugLog.error("ERROR : Error with creating reward with : #{name}, return default random reward")
            RewardFactory.get_random_reward
    end

end