class CustomCharacterComponent
  attr_reader :x, :y, :head_part, :body_part

  def initialize(window)
    @window = window
    @head_part = PartComponentFactory.create_head_part_component
    @body_part = PartComponentFactory.create_body_part_component
    @active = false


    @button_factory = ButtonFactory.new(@window)

    button_width = 80
    button_height = 30
    button_spacing = 200
    body_center_x = @window.width.div(2)
    body_top_y = 50
    body_bottom_y = body_top_y + @body_part.current_part.height

    @top_left_button = @button_factory.create_default_button(
      x: body_center_x - @body_part.current_part.width / 2 - button_width - button_spacing,
      y: body_top_y,
      width: button_width,
      height: button_height,
      text: "Top Left"
    ) { @head_part.goBackPart }

    @bottom_left_button = @button_factory.create_default_button(
      x: body_center_x - @body_part.current_part.width / 2 - button_width - button_spacing,
      y: body_bottom_y ,
      width: button_width,
      height: button_height,
      text: "Bottom Left"
    ) { @body_part.goBackPart }

    @top_right_button = @button_factory.create_default_button(
      x: body_center_x + @body_part.current_part.width / 2 + button_spacing,
      y: body_top_y,
      width: button_width,
      height: button_height,
      text: "Top Right"
    ) { @head_part.goNextPart }

    @bottom_right_button = @button_factory.create_default_button(
      x: body_center_x + @body_part.current_part.width / 2 + button_spacing,
      y: body_bottom_y ,
      width: button_width,
      height: button_height,
      text: "Bottom Right"
    ) { @body_part.goNextPart }
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

    @top_left_button.draw
    @bottom_left_button.draw
    @top_right_button.draw
    @bottom_right_button.draw
  end

  def button_down(id)
    @top_left_button.button_down(id)
    @bottom_left_button.button_down(id)
    @top_right_button.button_down(id)
    @bottom_right_button.button_down(id)
  end

  def clicked?
    mouse_x = @window.mouse_x
    mouse_y = @window.mouse_y
    mouse_x.between?(@x, @x + @body_part.current_part.width) && mouse_y.between?(@y - @head_part.current_part.height, @y + @body_part.current_part.height)
  end
end
