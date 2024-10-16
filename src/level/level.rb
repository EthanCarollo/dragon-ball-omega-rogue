class Level
    attr_accessor :name, :description, :asset_path, :opponent, :rewards
    def initialize(name, description, opponent, reward_fn = RewardFactory.method(:get_random_reward).to_proc)
        @name = name
        @description = description
        @opponent = opponent
        @rewards = reward_fn.call
    end
end