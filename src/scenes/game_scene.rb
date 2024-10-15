require 'gosu'

class GameScene
    WIDTH = 640
    HEIGHT = 480
  
    def initialize(window)
      @window = window
    end
  
    def update
    
    end
  
    def draw

    end
  
    def button_down(id)
      case id
      when Gosu::KB_ESCAPE
        @window.close
      end
    end
  end