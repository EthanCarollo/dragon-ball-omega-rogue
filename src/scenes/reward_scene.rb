require 'gosu'
class RewardScene
  def initialize(window)
    @window = window
    @font = Gosu::Font.new(20)

    @button_factory = ButtonFactory.new(window)
    text_to_show = "COOL !"
    text_width = @font.text_width(text_to_show) + 50
    text_x = @window.width / 2 - text_width / 2
    text_y = 50
    @next_button = @button_factory.create_default_button(
        x: (@window.width - 200) / 2, 
        y: (@window.height - 50) / 2,
        width: 200,
        height: 50,
        text: "GOOD !"
      ) do
        @window.change_scene(GameScene.new(@window))
      end
  end

  def update

  end

  def draw
    @next_button.draw
  end

  def button_down(id)
    @next_button.button_down(id)
  end
end
