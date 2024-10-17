class TrainingComponent
    attr_reader :trainings

    def initialize(window, player)
        @window = window
        @player = Player.instance
        @button_factory = ButtonFactory.new(@window)
        @text_factory = TextWithBackgroundFactory.new(@window)
        setup_ui
    end

    def setup_ui
        @buttons = []

        button_width = 250
        button_height = 65
        button_spacing = 10
        start_x = 50
        start_y = 50

        @training_points_text = @text_factory.create_default_text_with_background(
            x: start_x,
            y: 50,  # Position above the buttons
            width: button_width,
            height: 40,
            text: "Training Points: #{Player.instance.training_points}",
            font: Gosu::Font.new(20)
        )

        @player.trainings.each_with_index do |training, index|
            if index >= 5
                break
            end
            button_y = start_y + index * (button_height + button_spacing)
            button = @button_factory.create_training_button(
                x: start_x,
                y: button_y + 50,
                width: button_width,
                height: button_height,
                training_name: training.name,
                training_cost: training.cost  # Assuming Training class has a cost attribute
            ) { activate_training(training) }
            @buttons << button
        end
    end

    def activate_training(training)
        if @player.available_trainings.include?(training)
            @player.buy_training(training.name, @window)
        else
            DebugLog.warning "Pas assez de points d'entraînement pour acheter #{training.name}."
        end
    end

    def update
        # Update logic here if necessary
    end

    def draw
        @training_points_text.draw
        @buttons.each(&:draw)
    end

    def button_down(id)
        @buttons.each { |button| button.button_down(id) }
        setup_ui
    end
end
