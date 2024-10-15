class PlayerCharacter < Character
  # TODO : add the logics for the Player character

  def initialize(name, head_part, body_part)
    @name = name
    @hp = hp
    @attack_options = attack_options
    @head = head_part
    @body = body_part
  end

  def draw_at(x, y, reversed = false)
    desired_width = 128
    desired_height = 128

    sprite_width = @sprite.width
    sprite_height = @sprite.height

    scale_x = desired_width.to_f / sprite_width
    scale_y = desired_height.to_f / sprite_height

    if reversed == false
      @head.part.image.draw(x, y, 1, scale_x, scale_y)
    else
      @head.part.image.draw(x + desired_width, y, 1, scale_x - scale_x * 2, scale_y)
    end

    draw_health_bar(x, y)
  end
end