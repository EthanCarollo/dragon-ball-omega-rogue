# So, the whole reward system use decorator, it just decorate the get_reward function in fact
class Reward
    attr_accessor :name, :description, :asset_path, :hover_asset_path

    def initialize(name = "Reward", description = "It will improve your character", asset_path = "./assets/ability/release_v1.2-single_1.png", hover_asset_path = "./assets/ability/release_v1.2-single_1.png")
        @name = name
        @description = description
        @asset_path = asset_path
        @hover_asset_path = hover_asset_path
    end

    def deep_copy
        Marshal.load(Marshal.dump(self))
    end

    def get_reward

    end
end