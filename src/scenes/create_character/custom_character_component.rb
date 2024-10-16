class CustomCharacterComponent
  attr_reader :x, :y, :head_part, :body_part, :type

  def initialize(window)
    @window = window
    @head_part = PartComponentFactory.create_head_part_component
    @body_part = PartComponentFactory.create_body_part_component
    @active = false
    @type = "sayan"

    @button_factory = ButtonFactory.new(@window)

    button_width = 140
    button_height = 50
    button_spacing = 200
    body_center_x = @window.width.div(2)
    body_top_y = 50
    body_bottom_y = body_top_y + @body_part.current_part_image.height

    @top_left_button = @button_factory.create_default_button(
      x: body_center_x - @body_part.current_part_image.width / 2 - button_width - button_spacing,
      y: body_top_y,
      width: button_width,
      height: button_height,
      text: "Back Head"
    ) { @head_part.goBackPart }

    @bottom_left_button = @button_factory.create_default_button(
      x: body_center_x - @body_part.current_part_image.width / 2 - button_width - button_spacing,
      y: body_bottom_y ,
      width: button_width,
      height: button_height,
      text: "Back Body"
    ) { @body_part.goBackPart }

    @top_right_button = @button_factory.create_default_button(
      x: body_center_x + @body_part.current_part_image.width / 2 + button_spacing,
      y: body_top_y,
      width: button_width,
      height: button_height,
      text: "Next Head"
    ) { @head_part.goNextPart }

    @bottom_right_button = @button_factory.create_default_button(
      x: body_center_x + @body_part.current_part_image.width / 2 + button_spacing,
      y: body_bottom_y ,
      width: button_width,
      height: button_height,
      text: "Next Body"
    ) { @body_part.goNextPart }

    @sayan_button = @button_factory.create_default_button(
      x: 50,
      y: @window.height - 150,
      width: button_width,
      height: button_height,
      text: "Create Sayan"
    ) { create_sayan_character }

    @chilled_button = @button_factory.create_default_button(
      x: @window.width - button_width - 50,
      y: @window.height - 150,
      width: button_width,
      height: button_height,
      text: "Create Chilled"
    ) { create_chilled_character }

    # By default, craete sayan
    create_sayan_character
  end

  def create_sayan_character
    @head_part = PartComponentFactory.create_head_part_component
    @body_part = PartComponentFactory.create_body_part_component
    @type = "sayan"
  end

  def create_chilled_character
    @head_part = PartComponentFactory.create_chilled_part_component
    @body_part = PartComponentFactory.create_chilled_part_component
    @type = "chilled"
  end

  def update
    # Update logics here, i dont think i will use but idc
  end

  def draw
    width = 500
    height = 500
    center = @window.width.div(2) - width.div(2)

    @body_part.current_part_image.draw(center, 50, 1, width.to_f / @body_part.current_part_image.width, height.to_f / @body_part.current_part_image.height)
    @head_part.current_part_image.draw(center, 50, 1, width.to_f / @head_part.current_part_image.width, height.to_f / @head_part.current_part_image.height)

    if @type == "sayan"
      @top_left_button.draw
      @bottom_left_button.draw
      @top_right_button.draw
      @bottom_right_button.draw

    end

    @sayan_button.draw
    @chilled_button.draw
  end

  def button_down(id)
    if @type == "sayan"
      @top_left_button.button_down(id)
      @bottom_left_button.button_down(id)
      @top_right_button.button_down(id)
      @bottom_right_button.button_down(id)
    end

    @sayan_button.button_down(id)
    @chilled_button.button_down(id)
  end

  def clicked?
    mouse_x = @window.mouse_x
    mouse_y = @window.mouse_y
    mouse_x.between?(@x, @x + @body_part.current_part_image.width) && mouse_y.between?(@y - @head_part.current_part_image.height, @y + @body_part.current_part_image.height)
  end
end
