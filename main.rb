require 'gosu'

class GameWindow < Gosu::Window
  WIDTH = 640
  HEIGHT = 480

  def initialize
    super(WIDTH, HEIGHT)
    self.caption = "Ruby Gosu Boilerplate"

    # Variables for animation
    @x = WIDTH / 2
    @y = HEIGHT / 2
    @velocity_x = 5
    @velocity_y = 5
  end

  def update
    
  end

  def draw

  end

  def button_down(id)
    case id
    when Gosu::KB_ESCAPE
      close  # Pressing ESC will close the window
    end
  end
end

GameWindow.new.show
