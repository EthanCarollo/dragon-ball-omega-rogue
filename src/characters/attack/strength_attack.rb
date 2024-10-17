# The difference between strength attack and intelligence attack is the stats used by the player
class StrengthAttack < AttackOption 
  def execute(launcher, opponent)
    intelligence_multiplier = 1 + (launcher.stats.strength * 0.1)
    damage = rand(@min_attack..@max_attack) * intelligence_multiplier
    opponent.hit(damage)
    DebugLog.warning "#{launcher.name} used intelligence #{@name} on #{opponent.name} for #{damage} damage!"
  end
end