# The difference between strength attack and intelligence attack is the stats used by the player
class SuperSayanAttack < AttackOption 
    def initialize()
        super("Super Sayan transformation", 0, 0, "./assets/rewards/ssj_reward.png")
    end

    def execute(launcher, opponent)
      puts "#{launcher.name} transformed into Super Sayan"
      launcher.awakenToSSJ()
    end
  end