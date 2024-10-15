class Character
  attr_accessor :name, :hp, :attack_options

  def initialize(name, hp, attack_options, sprite_path)
    @name = name
    @hp = hp
    @attack_options = attack_options # List of attacks
    @sprite = Gosu::Image.new(sprite_path, retro: true) # Load the sprite image
    @x = 100 # Default x position, you can change this as needed
    @y = 100 # Default y position, you can change this as needed
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

  def draw_at(x, y)
    # Desired size for the character sprite
    desired_width = 128
    desired_height = 128
  
    # Get current dimensions of the sprite
    sprite_width = @sprite.width
    sprite_height = @sprite.height
  
    # Calculate scale factors to resize the sprite
    scale_x = desired_width.to_f / sprite_width
    scale_y = desired_height.to_f / sprite_height
  
    # Draw the character sprite at (x, y) with scaling
    @sprite.draw(x, y, 1, scale_x, scale_y)
  
    # Draw the health bar below the sprite
    draw_health_bar(x, y)
  end
  
  

  def draw_health_bar(x, y)
    bar_width = 128
    bar_height = 5
    health_ratio = @hp / 100.0 # Assuming max HP is 100
    Gosu.draw_rect(x, y + 128, bar_width * health_ratio, bar_height, Gosu::Color::GREEN)
    Gosu.draw_rect(x + bar_width * health_ratio, y + 60, bar_width * (1 - health_ratio), bar_height, Gosu::Color::RED)
  end
end