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

  # Draw the button with background and text
  def draw
    # Check hover state
    @is_hovered = hovering?

    # Use hover color if hovered, else use background color
    current_color = @is_hovered ? @hover_color : @background_color

    # Draw button background
    Gosu.draw_rect(@x, @y, @width, @height, current_color)

    # Calculate text position
    text_x = @x + (@width - @font.text_width(@text)) / 2
    text_y = @y + (@height - @font.height) / 2

    # Draw button text
    @font.draw_text(@text, text_x, text_y, 1, 1.0, 1.0, @text_color)
  end

  # Check if the button is clicked
  def clicked?(mouse_x, mouse_y)
    mouse_x > @x && mouse_x < @x + @width && mouse_y > @y && mouse_y < @y + @height
  end

  # Check if the button is being hovered
  def hovering?
    mouse_x = @window.mouse_x
    mouse_y = @window.mouse_y
    mouse_x > @x && mouse_x < @x + @width && mouse_y > @y && mouse_y < @y + @height
  end

  # Trigger the callback when clicked
  def trigger
    @callback.call if @callback
  end

  # Handle mouse button down events
  def button_down(id)
    if id == Gosu::MS_LEFT && clicked?(@window.mouse_x, @window.mouse_y)
      trigger
    end
  end
end
