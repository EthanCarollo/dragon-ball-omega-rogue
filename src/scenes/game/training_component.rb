class TrainingComponent
  attr_reader :trainings

  def initialize(window, player)
    @window = window
    @player = player
    @button_factory = ButtonFactory.new(@window)
    @trainings = player.trainings
    @buttons = []

    button_width = 250
    button_height = 50
    button_spacing = 10
    start_x = 50
    start_y = 50


    @trainings.each_with_index do |training, index|
      button_y = start_y + index * (button_height + button_spacing)
      button = @button_factory.create_default_button(
        x: start_x,
        y: button_y,
        width: button_width,
        height: button_height,
        text: training.name
      ) { activate_training(training) }
      @buttons << button
    end
  end

  def activate_training(training)
    if @player.available_trainings.include?(training)
      @player.buy_training(training.name)
    else
      puts "Pas assez de points d'entraînement pour acheter #{training.name}."
    end
  end

  def update
    # Update logic here if necessary
  end

  def draw
    @buttons.each(&:draw)
  end

  def button_down(id)
    @buttons.each { |button| button.button_down(id) }
  end
end
