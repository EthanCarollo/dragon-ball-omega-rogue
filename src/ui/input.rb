class Input
  attr_accessor :text, :active

  AZERTY_MAPPING = {
    Gosu::KB_A => 'Q',
    Gosu::KB_Z => 'W',
    Gosu::KB_Q => 'A',
    51 => 'M',
    Gosu::KB_M => ',',
    Gosu::KB_COMMA => ';',  # Assuming a specific mapping for AZERTY
    Gosu::KB_SPACE => ' ',  # Space is still space
    # Add additional mappings for numbers or special characters as needed
    # Example: Gosu::KB_1 => '1', etc.
  }

  def initialize(window, x, y, font_size, width, placeholder_text = "")
    @window = window
    @text = ""
    @placeholder_text = placeholder_text
    @font = Gosu::Font.new(font_size)
    @x = x
    @y = y
    @width = width
    @cursor_visible = true
    @active = false
    @cursor_blink_rate = 30  # Control the blink speed of the cursor
    @frame_count = 0
  end

  def update
    # Control cursor blinking
    @frame_count += 1
    if @frame_count % @cursor_blink_rate == 0
      @cursor_visible = !@cursor_visible
    end
  end

  def draw
    # Draw the text input
    text_to_show = "#{@placeholder_text} #{@text}"
    @font.draw_text(text_to_show, @x, @y, 0)
    # Draw the blinking cursor if the input is active
    if @active && @cursor_visible
      @font.draw_text("_", @x + @font.text_width(text_to_show), @y, 0)
    end
  end

  def button_down(id)
    if @active
      case id
      when Gosu::KB_BACKSPACE
        @text.chop! if @text.length > 0
      when Gosu::KB_RETURN
        return @text  # Returning the text to signify submission
      else
        if AZERTY_MAPPING.key?(id)
          char = AZERTY_MAPPING[id]
          @text << char if char
        else
          if id >= Gosu::KB_A && id <= Gosu::KB_Z
            char = (id - Gosu::KB_A + 65).chr
            @text << char
          end
        end
      end
    end
    nil  # If no submission, return nil
  end

  # Method to check if the user clicked within the input field's bounds
  def clicked?(mouse_x, mouse_y)
    mouse_x.between?(@x, @x + @width) && mouse_y.between?(@y - 20, @y + 20)
  end
end
