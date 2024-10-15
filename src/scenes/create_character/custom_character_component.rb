class CustomCharacterComponent
  attr_reader :x, :y

  def initialize(window)
    @window = window
    @head_part = PartComponentFactory.create_head_part_component
    @body_part = PartComponentFactory.create_body_part_component
    @active = false
  end

  def update
    # Update logics here, i dont think i will use but idc
  end

  def draw
    width = 500
    height = 500
    center = @window.width.div(2) - width.div(2)

    @body_part.current_part.draw(center, 50, 1, width.to_f / @body_part.current_part.width, height.to_f / @body_part.current_part.height)
    @head_part.current_part.draw(center, 50, 1, width.to_f / @head_part.current_part.width, height.to_f / @head_part.current_part.height)
  end

  def button_down(id)

  end

  def clicked?
    mouse_x = @window.mouse_x
    mouse_y = @window.mouse_y
    mouse_x.between?(@x, @x + @body_part.current_part.width) && mouse_y.between?(@y - @head_part.current_part.height, @y + @body_part.current_part.height)
  end
end
