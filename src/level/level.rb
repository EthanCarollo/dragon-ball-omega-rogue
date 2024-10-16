class Level
    attr_accessor :name, :description, :asset_path, :opponent, :rewards
    def initialize(name, description, opponent, rewards = RewardFactory.get_random_reward)
        @name = name
        @description = description
        @opponent = opponent
        @rewards = rewards
    end
end