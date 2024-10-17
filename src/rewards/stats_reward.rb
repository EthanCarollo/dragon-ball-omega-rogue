# This is my decorator

class IntelligenceReward < Reward
    def initialize(reward, amount)
        super("Intelligence #{reward.name}", "#{reward.description}, add #{amount} to intelligence", "./assets/rewards/intelligence_reward.png", "./assets/rewards/intelligence_reward.png")
        @reward = reward
        @amount = amount
    end
    
    def get_reward
        @reward.get_reward
        Player.instance.character.stats.intelligence += @amount
    end
end

class StrengthReward < Reward
    def initialize(reward, amount)
        super("Strength #{reward.name}", "#{reward.description}, add #{amount} to strength", "./assets/rewards/muscle_reward.png", "./assets/rewards/muscle_reward.png")
        @reward = reward
        @amount = amount
    end

    def get_reward
        @reward.get_reward
        Player.instance.character.stats.strength += @amount
    end
end

class SenzuReward < Reward
    def initialize(reward)
        super("Senzu #{reward.name}", "#{reward.description}, heal completely the player", "./assets/rewards/senzu_reward.png", "./assets/rewards/senzu_reward.png")
        @reward = reward
    end

    def get_reward
        @reward.get_reward
        Player.instance.character.hp = Player.instance.character.max_hp
    end
end