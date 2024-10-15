class Character
  attr_accessor :name, :hp, :attack_options

  def initialize(name, hp, attack_options)
    @name = name
    @hp = hp
    @attack_options = attack_options # List of attacks
  end

  def alive?
    @hp > 0
  end

  def attack(opponent, attack_name)
    attack = @attack_options[attack_name]
    damage = rand(attack[:min]..attack[:max])
    opponent.hp -= damage
    puts "#{@name} used #{attack_name} on #{opponent.name} for #{damage} damage!"
  end

  def random_attack(opponent)
    attack_name = @attack_options.keys.sample
    attack(opponent, attack_name)
  end
end