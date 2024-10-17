class Level
    attr_accessor :name, :description, :asset_path, :opponent, :reward_fn, :difficulty
    def initialize(name, description, opponent, difficulty, reward_fn = RewardFactory.method(:get_random_reward).to_proc)
        @name = name
        @description = description
        @opponent = opponent
        @difficulty = difficulty
        @reward_fn = reward_fn
    end
end