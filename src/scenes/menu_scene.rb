require 'gosu'

class MenuScene
  def initialize(window)
    @window = window
    @button_width = 100
    @button_height = 40
    @button_color = Gosu::Color::WHITE
    @font = Gosu::Font.new(20)

    # Center the button on the screen
    @button_x = (@window.width - @button_width) / 2
    @button_y = (@window.height - @button_height) / 2
  end

  def update
  end

  def draw
    Gosu.draw_rect(0, 0, @window.width, @window.height, Gosu::Color::BLACK)
    
    Gosu.draw_rect(@button_x, @button_y, @button_width, @button_height, @button_color)
    
    @font.draw_text("Start", @button_x + 20, @button_y + 10, 1, 1.0, 1.0, Gosu::Color::BLACK)
  end

  def button_down(id)
    if id == Gosu::MS_LEFT
      if mouse_over_button?
        @window.change_scene(CreateCharacterScene.new(@window))
      end
    end
  end

  def mouse_over_button?
    mouse_x = @window.mouse_x
    mouse_y = @window.mouse_y
    mouse_x >= @button_x && mouse_x <= (@button_x + @button_width) &&
      mouse_y >= @button_y && mouse_y <= (@button_y + @button_height)
  end
end
