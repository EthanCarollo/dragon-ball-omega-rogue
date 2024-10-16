class ButtonFactory
  def initialize(window)
    @window = window
  end

  def create_button(x:, y:, width:, height:, text:, background_color:, hover_color:, text_color:, &callback)
    Button.new(@window, x, y, width, height, text, background_color, hover_color, text_color, &callback)
  end

  def create_default_button(x:, y:, width:, height:, text:, &callback)
    default_background_color = Gosu::Color::WHITE
    default_hover_color = Gosu::Color::GRAY
    default_text_color = Gosu::Color::BLACK

    create_button(
      x: x,
      y: y,
      width: width,
      height: height,
      text: text,
      background_color: default_background_color,
      hover_color: default_hover_color,
      text_color: default_text_color,
      &callback
    )
  end

  def create_training_button(x:, y:, width:, height:, training_name:, training_cost:, &callback)
    background_color = Gosu::Color::WHITE
    hover_color = Gosu::Color::GRAY
    text_color = Gosu::Color::BLACK

    TrainingButton.new(
      @window,
      x,
      y,
      width,
      height,
      training_name,
      training_cost,
      background_color,
      hover_color,
      text_color,
      &callback
    )
  end

  def create_image_button(x:, y:, normal_image_path:, hover_image_path:, width:, height:, &callback)
    ImageButton.new(
      @window,
      x,
      y,
      normal_image_path,
      hover_image_path,
      width,
      height,
      "",
      &callback
    )
  end

  def create_image_button_with_desc(x:, y:, normal_image_path:, hover_image_path:, width:, height:, description:, &callback)
    ImageButton.new(
      @window,
      x,
      y,
      normal_image_path,
      hover_image_path,
      width,
      height,
      description,
      &callback
    )
  end
end

