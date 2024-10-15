class AttackOption 
    attr_reader :name, :min_attack, :max_attack
    
    def initialize(name, min_attack, max_attack)
        @name = name
        @min_attack = min_attack
        @max_attack = max_attack
    end

    def execute(launcher, opponent)
        puts "execute attack option"
    end
end