class TextWithBackground
  attr_reader :x, :y, :width, :height

  def initialize(window, x, y, width, height, text, background_color, text_color, font)
    @window = window
    @x = x
    @y = y
    @width = width
    @height = height
    @text = text
    @background_color = background_color
    @text_color = text_color
    @font = font
  end

  # Draw the text with a background
  def draw
    # Draw the background rectangle
    Gosu.draw_rect(@x, @y, @width, @height, @background_color)

    # Calculate text position to center it within the rectangle
    text_x = @x + (@width - @font.text_width(@text)) / 2
    text_y = @y + (@height - @font.height) / 2

    # Draw the text
    @font.draw_text(@text, text_x, text_y, 1, 1.0, 1.0, @text_color)
  end
end
