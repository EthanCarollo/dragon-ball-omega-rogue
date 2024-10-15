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
end

