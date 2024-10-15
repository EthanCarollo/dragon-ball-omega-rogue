require 'gosu'
class MenuScene
  def initialize(window)
    @window = window
    @font = Gosu::Font.new(20)

    # Create a button using the factory with a hover color and callback for scene change
    @button_factory = ButtonFactory.new(@window)
    @start_button = @button_factory.create_default_button(
      x: (@window.width - 200) / 2,  # Centering the button
      y: (@window.height - 50) / 2,
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
    Gosu.draw_rect(0, 0, @window.width, @window.height, Gosu::Color::BLACK)
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
