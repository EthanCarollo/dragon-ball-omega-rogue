class Level
    attr_accessor :name, :description, :asset_path, :opponent
    def initialize(name, description, asset_path, opponent)
        @name = name
        @description = description
        @asset_path = asset_path
        @opponent = opponent
    end
end