class Input
  attr_accessor :text, :active

  AZERTY_MAPPING = {
    Gosu::KB_A => 'Q',
    Gosu::KB_Z => 'W',
    Gosu::KB_W => 'Z',
    Gosu::KB_Q => 'A',
    51 => 'M',
    Gosu::KB_M => ',',
    Gosu::KB_COMMA => ';',
    Gosu::KB_SPACE => ' ',
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
    @cursor_blink_rate = 30
    @frame_count = 0
  end

  def update
    @frame_count += 1
    if @frame_count % @cursor_blink_rate == 0
      @cursor_visible = !@cursor_visible
    end
  end

  def draw
    text_to_show = "#{@placeholder_text} #{@text}"
    @font.draw_text(text_to_show, @x, @y, 0)
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
    nil
  end

  def clicked?(mouse_x, mouse_y)
    mouse_x.between?(@x, @x + @width) && mouse_y.between?(@y - 20, @y + 20)
  end
end
