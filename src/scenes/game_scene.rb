require 'gosu'

class GameScene
    WIDTH = 640
    HEIGHT = 480
  
    def initialize(window)
      @window = window
      @background = Gosu::Image.new("./assets/background/namek.png", retro: true)
      @font = Gosu::Font.new(30, name: "./assets/fonts/upheavtt.ttf")

      @text_factory = TextWithBackgroundFactory.new(self)
      text_to_show = "Your name : #{Player.instance.name}"
      text_width = @font.text_width(text_to_show) + 50
      text_x = @window.width / 2 - text_width / 2
      text_y = 50
      @text_for_name = @text_factory.create_default_text_with_background(
        x: text_x,
        y: text_y,
        width: text_width,
        height: 50,
        text: text_to_show,
        font: @font
      )

      @training_component = TrainingComponent.new(window, Player.instance)
    end
  
    def update
    
    end
  
    def draw
      desired_width = 1280
      desired_height = 720

      bg_width = @background.width
      bg_height = @background.height

      scale_x = desired_width.to_f / bg_width
      scale_y = desired_height.to_f / bg_height

      @background.draw(0, 0, 0, scale_x, scale_y)
      player_size = 350
      Player.instance.character.draw_at(@window.width / 2 - player_size / 2,
                                        @window.height / 2 - player_size / 2 + 120,
                                        false, false, player_size)

      @text_for_name.draw
      @training_component.draw

    end
  
    def button_down(id)
      @training_component.button_down(id)
    end
  end