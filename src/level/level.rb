class Level
    attr_accessor :name, :description, :asset_path, :opponent, :reward_object, :difficulty
    def initialize(name, description, opponent, difficulty, reward_object)
        @name = name
        @description = description
        @opponent = opponent
        @difficulty = difficulty
        @reward_object = reward_object
    end
end