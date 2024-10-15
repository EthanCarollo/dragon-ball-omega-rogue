class LaunchFightComponent
  attr_reader :window, :player

  def initialize(window, player)
    @window = window
    @player = Player.instance
    @button_factory = ButtonFactory.new(@window)
    @text_factory = TextWithBackgroundFactory.new(@window)
    setup_ui
  end

  def setup_ui
    button_width = 250
    button_height = 65
    padding = 20
    button_x = @window.width - button_width - padding
    button_y = @window.height - button_height - padding

    @rounds_text = @text_factory.create_default_text_with_background(
      x: button_x,
      y: button_y - 40 - 10,
      width: button_width,
      height: 40,
      text: "Current Rounds: #{@player.round}",
      font: Gosu::Font.new(20)
    )

    @launch_button = @button_factory.create_default_button(
      x: button_x,
      y: button_y,
      width: button_width,
      height: button_height,
      text: "Launch Fight"
    ) { launch_fight }
  end

  def launch_fight
    puts "Fight launched!"
    # TODO : PUT THE LOGICS IN THIS SHIT FOR GOING TO THE COMBAT SCENE LOL
  end

  def update
    @rounds_text.text = "Current Rounds: #{@player.round}"
  end

  def draw
    @rounds_text.draw
    @launch_button.draw
  end

  def button_down(id)
    @launch_button.button_down(id)
  end
end
