class Level
    attr_accessor :name, :description, :asset_path, :opponent, :reward_fn
    def initialize(name, description, opponent, reward_fn = RewardFactory.method(:get_random_reward).to_proc)
        @name = name
        @description = description
        @opponent = opponent
        @reward_fn = reward_fn
    end
end