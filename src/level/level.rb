class Level
    attr_accessor :name, :description, :asset_path, :opponent, :rewards
    def initialize(name, description, asset_path, opponent, rewards = RewardFactory.get_random_reward)
        @name = name
        @description = description
        @asset_path = asset_path
        @opponent = opponent
        @rewards = rewards
    end
end