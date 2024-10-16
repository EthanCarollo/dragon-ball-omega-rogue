# The difference between strength attack and intelligence attack is the stats used by the player
class SuperSayanAttack < AttackOption 
    def execute(launcher, opponent)
      puts "#{launcher.name} transformed into Super Sayan"
    end
  end