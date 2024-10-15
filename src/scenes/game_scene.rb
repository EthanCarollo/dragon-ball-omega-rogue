require 'gosu'

class GameScene
    WIDTH = 640
    HEIGHT = 480
  
    def initialize(window)
      @window = window
      @x = WIDTH / 2
      @y = HEIGHT / 2
      @velocity_x = 5
      @velocity_y = 5
    end
  
    def update
      @x += @velocity_x
      @y += @velocity_y
  
      if @x >= WIDTH || @x <= 0
        @velocity_x *= -1
      end
  
      if @y >= HEIGHT || @y <= 0
        @velocity_y *= -1
      end
    end
  
    def draw
      Gosu.draw_rect(@x - 10, @y - 10, 20, 20, Gosu::Color::WHITE)
    end
  
    def button_down(id)
      case id
      when Gosu::KB_ESCAPE
        @window.close
      end
    end
  end