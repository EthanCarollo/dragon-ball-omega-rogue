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
      player_size = 350
      Player.instance.character.draw_at(@window.width / 2 - player_size / 2,
                                        @window.height / 2 - player_size / 2,
                                        false, false, player_size)
    end
  
    def button_down(id)
      case id
      when Gosu::KB_ESCAPE
        @window.close
      end
    end
  end