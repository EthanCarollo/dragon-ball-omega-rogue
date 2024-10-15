class PlayerCharacter < Character
  # TODO : add the logics for the Player character

  def initialize(name, head_part, body_part)
    @name = name
    @hp = 100
    @attack_options = attack_options
    @head = head_part
    @body = body_part
  end

  def draw_at(x, y, reversed = false, draw_health = true, desired_size = 128)
    desired_width = desired_size
    desired_height = desired_size

    sprite_width = @head.image.width
    sprite_height = @head.image.height

    scale_x = desired_width.to_f / sprite_width
    scale_y = desired_height.to_f / sprite_height

    if reversed == false
      @body.image.draw(x, y, 1, scale_x, scale_y)
      @head.image.draw(x, y, 1, scale_x, scale_y)
    else
      @body.part.image.draw(x + desired_width, y, 1, scale_x - scale_x * 2, scale_y)
      @head.part.image.draw(x + desired_width, y, 1, scale_x - scale_x * 2, scale_y)
    end
    if draw_health == true
      draw_health_bar(x, y)
    end
  end
end