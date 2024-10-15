class TextWithBackgroundFactory
  def initialize(window)
    @window = window
  end

  def create_text_with_background(x:, y:, width:, height:, text:, background_color:, text_color:, font:)
    TextWithBackground.new(@window, x, y, width, height, text, background_color, text_color, font)
  end

  def create_default_text_with_background(x:, y:, width:, height:, text:, font:)
    default_background_color = Gosu::Color::WHITE
    default_text_color = Gosu::Color::BLACK

    create_text_with_background(
      x: x,
      y: y,
      width: width,
      height: height,
      text: text,
      background_color: default_background_color,
      text_color: default_text_color,
      font: font
    )
  end
end
