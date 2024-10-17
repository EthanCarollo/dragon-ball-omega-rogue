class Character
  attr_accessor :name, :hp, :attack_options, :stats, :head, :body, :max_hp, :id

  def initialize(name, hp = 100)
    @name = name
    @hp = hp
    @max_hp = hp
    @id = nil
    @attack_options = []
    @head = nil
    @body = nil
  end

  def update

  end

  def set_id(id)
    @id = id
    return self
  end

  def have_attack(attack_name)
    @attack_options.any? { |attack| attack.name == attack_name }
  end

  def set_max_hp(max_hp)
    @max_hp = max_hp
    return self
  end

  def add_stats(character_stats)
    @stats = character_stats
    return self
  end

  def add_head(head_part)
    @head = head_part
    return self
  end

  def add_body(body_part)
    @body = body_part
    return self
  end

  def add_attack(attack_option)
    @attack_options << attack_option
    return self
  end

  def alive?
    @hp > 0
  end

  def hit(damage)
    @hp -= damage
  end 

  def heal(heal_point)
    @hp += heal_point
    if @hp > @max_hp
      @hp = @max_hp
    end
  end

  def attack(opponent, attack)
    if attack
      attack.execute(self, opponent)
    else
      DebugLog.warning "Attack not found!"
    end
  end

  def random_attack(opponent)
    attack_opt = @attack_options.sample
    attack(opponent, attack_opt)
  end

  def draw_at(x, y, reversed = false, draw_health = true, desired_size = 128)
    desired_width = desired_size
    desired_height = desired_size

    sprite_width = @state.get_character_head.width
    sprite_height = @state.get_character_head.height

    scale_x = desired_width.to_f / sprite_width
    scale_y = desired_height.to_f / sprite_height
    if reversed == false
      @state.get_character_body.draw(x, y, 1, scale_x, scale_y)
      @state.get_character_head.draw(x, y, 1, scale_x, scale_y)
    else
      @state.get_character_body.draw(x + desired_width, y, 1, scale_x - scale_x * 2, scale_y)
      @state.get_character_head.draw(x + desired_width, y, 1, scale_x - scale_x * 2, scale_y)
    end
    
    draw_health_bar(x, y) if draw_health
  end
  
  def draw_health_bar(x, y)
    bar_width = 128
    bar_height = 5
    health_ratio = @hp.to_f / @max_hp.to_f
    if health_ratio < 0
      health_ratio = 0
    end

    Gosu.draw_rect(x, y + 128, bar_width * health_ratio, bar_height, Gosu::Color::GREEN)
    Gosu.draw_rect(x + bar_width * health_ratio, y + 128, bar_width * (1 - health_ratio), bar_height, Gosu::Color::RED)
  end
end