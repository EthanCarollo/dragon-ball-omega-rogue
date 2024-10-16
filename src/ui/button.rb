class Button
  attr_reader :x, :y, :width, :height

  def initialize(window, x, y, width, height, text, background_color, hover_color, text_color, &callback)
    @window = window
    @x = x
    @y = y
    @width = width
    @height = height
    @text = text
    @background_color = background_color
    @hover_color = hover_color
    @text_color = text_color
    @font = Gosu::Font.new(20)
    @callback = callback
    @is_hovered = false
  end

  def draw
    @is_hovered = hovering?

    current_color = @is_hovered ? @hover_color : @background_color

    Gosu.draw_rect(@x, @y, @width, @height, current_color)

    text_x = @x + (@width - @font.text_width(@text)) / 2
    text_y = @y + (@height - @font.height) / 2

    @font.draw_text(@text, text_x, text_y, 1, 1.0, 1.0, @text_color)
  end

  def clicked?(mouse_x, mouse_y)
    mouse_x > @x && mouse_x < @x + @width && mouse_y > @y && mouse_y < @y + @height
  end

  def hovering?
    mouse_x = @window.mouse_x
    mouse_y = @window.mouse_y
    mouse_x > @x && mouse_x < @x + @width && mouse_y > @y && mouse_y < @y + @height
  end

  def trigger
    @callback.call if @callback
  end

  def button_down(id)
    if id == Gosu::MS_LEFT && clicked?(@window.mouse_x, @window.mouse_y)
      trigger
    end
  end
end
