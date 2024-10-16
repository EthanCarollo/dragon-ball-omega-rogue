class AttackOption 
    attr_reader :name, :min_attack, :max_attack, :asset, :asset_path
    
    def initialize(name, min_attack, max_attack, asset_path = "./assets/ability/release_v1.2-single_1.png")
        @name = name
        @min_attack = min_attack
        @max_attack = max_attack
        @asset_path = asset_path
        @asset = Gosu::Image.new(asset_path, retro: true)
    end

    def execute(launcher, opponent)
        puts "execute attack option"
    end
end