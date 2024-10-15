class ClassicAttack < AttackOption 
    def execute(launcher, opponent)
      damage = rand(@min_attack..@max_attack)
      opponent.hp -= damage
      puts "#{launcher.name} used #{@name} on #{opponent.name} for #{damage} damage!"
    end
  end