# Here, the Command pattern is implemented via the Attack Option, we have an execute,
# and it changes depending on the attack
# The main role of this is to encapsulate attack
# So this class is much like the Command abstract class in top of the Command pattern.
class AttackOption 
    attr_reader :name, :min_attack, :max_attack, :asset_path, :deal_damage
    
    def initialize(name, min_attack, max_attack, asset_path = "./assets/ability/release_v1.2-single_1.png", deal_damage = true)
        @name = name
        @min_attack = min_attack
        @max_attack = max_attack
        @asset_path = asset_path
        @deal_damage = deal_damage
    end

    def execute(launcher, opponent)
        DebugLog.warning "execute attack option"
    end
end