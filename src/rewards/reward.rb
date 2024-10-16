# So, the whole reward system use decorator, it just decorate the get_reward function in fact
class Reward
    attr_accessor :name, :description, :asset_path, :hover_asset_path

    def initialize(name, description, asset_path, hover_asset_path)
        @name = name
        @description = description
        @asset_path = asset_path
        @hover_asset_path = hover_asset_path
    end

    def get_reward

    end
end