require 'gosu'
class MenuScene
  def initialize(window)
    @window = window
    @font = Gosu::Font.new(20)
    @dragon_ball_title = Gosu::Image.new("./assets/title/dbrogue.png", retro: true)
    @namek_background = Gosu::Image.new("./assets/background/namek_background.png", retro: true)

    # Create a button using the factory with a hover color and callback for scene change
    @button_factory = ButtonFactory.new(@window)
    @start_button = @button_factory.create_default_button(
      x: (@window.width - 200) / 2,  # Centering the button
      y: (@window.height - 50) / 2 + 200,
      width: 200,
      height: 50,
      text: "Start"
    ) do
      # Button callback: change the scene
      @window.change_scene(CreateCharacterScene.new(@window))
    end
  end

  def update

  end

  def draw
    background_width = @namek_background.width / @window.width
    background_height = @namek_background.height / @window.height
    @namek_background.draw(0, 0, 0, background_width, background_height)

    wanted_width = 400*1.5.to_f
    wanted_height = 270*1.5.to_f
    title_width = wanted_width / @dragon_ball_title.width
    title_height = wanted_height / @dragon_ball_title.height
    puts title_height
    x_tit_pos = @window.width / 2 - wanted_width / 2
    @dragon_ball_title.draw(x_tit_pos, 0, 1, title_width, title_height)
    @start_button.draw
  end

  def button_down(id)
    if id == Gosu::MS_LEFT
      if @start_button.clicked?(@window.mouse_x, @window.mouse_y)
        @start_button.trigger
      end
    end
  end
end
