class Character
  attr_accessor :name, :hp, :attack_options

  def initialize(name, hp, attack_options, sprite_path)
    @name = name
    @hp = hp
    @attack_options = attack_options 
    @sprite = Gosu::Image.new(sprite_path, retro: true)
  end

  def alive?
    @hp > 0
  end

  def attack(opponent, attack)
    if attack
      attack.execute(self, opponent) # Use the AttackOption's execute method
    else
      puts "Attack not found!"
    end
  end

  def random_attack(opponent)
    attack_opt = @attack_options.sample
    attack(opponent, attack_opt)
  end

  def draw_at(x, y, reversed = false)
    desired_width = 128
    desired_height = 128
  
    sprite_width = @sprite.width
    sprite_height = @sprite.height
  
    scale_x = desired_width.to_f / sprite_width
    scale_y = desired_height.to_f / sprite_height
  
    if reversed == false 
      @sprite.draw(x, y, 1, scale_x, scale_y)
    else
      @sprite.draw(x + desired_width, y, 1, scale_x - scale_x * 2, scale_y)
    end
    
    draw_health_bar(x, y)
  end
  
  

  def draw_health_bar(x, y)
    bar_width = 128
    bar_height = 5
    health_ratio = @hp.div(100.0) # Assuming max HP is 100
    Gosu.draw_rect(x, y + 128, bar_width * health_ratio, bar_height, Gosu::Color::GREEN)
    Gosu.draw_rect(x + bar_width * health_ratio, y + 128, bar_width * (1 - health_ratio), bar_height, Gosu::Color::RED)
  end
end