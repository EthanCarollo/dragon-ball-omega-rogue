# The difference between strength attack and intelligence attack is the stats used by the player
class SuperSayanAttack < AttackCommand 
    def initialize()
        super("Super Sayan transformation", 0, 0, "./assets/rewards/ssj_reward.png")
    end

    def execute(launcher, opponent)
      DebugLog.warning "#{launcher.name} transformed into Super Sayan"
      launcher.awakenToSSJ()
    end
  end