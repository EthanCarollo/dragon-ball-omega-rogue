class CreateCharacterScene
  def initialize(window)
    @window = window
    @font = Gosu::Font.new(20)
    @button_factory = ButtonFactory.new(@window)
    @input_factory = InputFactory.new(@window)

    # Create the input field for the character name using the factory
    create_character_name_input
    create_submit_button
    @custom_character_component = CustomCharacterComponent.new(window)
  end

  def create_character_name_input
    input_x = (1280 - 400) / 2  # Center the input field
    input_y = 720 - 120
    @character_name_input = @input_factory.create_default_input(
      x: input_x,
      y: input_y,
      width: 400,
      placeholder: "Enter Character Name:"
    )
  end

  def create_submit_button
    submit_button_x = (1280 - 120) / 2
    submit_button_y = @character_name_input.instance_variable_get(:@y) + 40
    @submit_button = @button_factory.create_default_button(
      x: submit_button_x,
      y: submit_button_y,
      width: 120,
      height: 30,
      text: "Submit"
    ) do
      submit_character
    end
  end

  def update
    @character_name_input.update
    @custom_character_component.update
    # Maybe in the future, add an update to this
    # @submit_button.update
  end

  def draw
    @character_name_input.draw
    @submit_button.draw
    @custom_character_component.draw
  end

  def button_down(id)
    case id
    when Gosu::MS_LEFT
      if @character_name_input.clicked?(@window.mouse_x, @window.mouse_y)
        @character_name_input.active = true
      else
        @character_name_input.active = false
      end
      if @submit_button.clicked?(@window.mouse_x, @window.mouse_y)
        @submit_button.trigger
      end
    end
    if @character_name_input.active
      result = @character_name_input.button_down(id)
      submit_character if result == @character_name_input.text  # Handle input submission
    end
    @custom_character_component.button_down(id)
  end

  def submit_character
    character_name = @character_name_input.text
    puts "Character created with name: #{character_name}"
    head = @custom_character_component.head_part.current_part
    body = @custom_character_component.body_part.current_part
    player_character = PlayerCharacter.new(character_name)
      .add_head(head)
      .add_body(body)
      .add_stats(CharacterStats.new(10, 10, 10))
      .add_attack(StrengthAttack.new("Fulguro Fist", 14, 15, "./assets/ability/release_v1.2-single_17.png"))
      .add_attack(IntelligenceAttack.new("Kikoha", 8, 24, "./assets/ability/release_v1.2-single_6.png"))
      .add_attack(IntelligenceAttack.new("Masenko", 3, 30, "./assets/ability/release_v1.2-single_10.png"))
    Player.instance.setup(character_name, player_character)
    @character_name_input.active = false
    @window.change_scene(GameScene.new(@window))
  end
end
