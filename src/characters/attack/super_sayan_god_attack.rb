# The difference between strength attack and intelligence attack is the stats used by the player
class SuperSayanGodAttack < AttackCommand 
    def initialize()
        super("Super Sayan God transformation", 0, 0, "./assets/rewards/ssjgod_reward.png")
    end

    def execute(launcher, opponent)
      DebugLog.warning "#{launcher.name} transformed into Super Sayan God"
      launcher.awakenToSSRed()
    end
  end