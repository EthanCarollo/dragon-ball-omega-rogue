require 'gosu'
class RewardScene
  def initialize(window, reward_object, level_name = "toto")
    @window = window
    @font = Gosu::Font.new(20)

    @choose_your_reward = Gosu::Image.new("./assets/ui/choose_your_reward.png", retro: true)
    @namek_background = Gosu::Image.new("./assets/background/namek_background_pale.png", retro: true)
    @button_factory = ButtonFactory.new(window)

    @level_name = level_name
    @reward_object = reward_object
    @reward_originator = RewardOriginator.new(RewardDirector.get_reward(reward_object, level_name))
    @reward_caretaker = RewardCaretaker.new(@reward_originator)
    load_rewards

    # Create reload button
    @reload_button = @button_factory.create_default_button(
      x: @window.width / 2 - 75,   # Center the button horizontally
      y: @window.height - 100,     # Place it near the bottom
      width: 150,
      height: 50,
      text: "Reload"
    ) do
      reload_rewards
    end

    @go_back_button = @button_factory.create_default_button(
      x: @window.width / 2 + 125,   # Place it right of center
      y: @window.height - 100,     # Place it near the bottom
      width: 150,
      height: 50,
      text: "Go Back"
    ) do
      go_back
    end
  end

  def load_rewards
    @reward_buttons = []
    button_width = 150
    button_height = 150
    spacing = 20
    start_x = (@window.width - (button_width * 3 + spacing * 2)) / 2
    start_y = @window.height - 400
    @reward_originator.state.each_with_index do |reward, i|
      button = @button_factory.create_image_button_with_desc(
        x: start_x + (button_width + spacing) * i,
        y: start_y,
        normal_image_path: reward.asset_path,
        hover_image_path: reward.hover_asset_path,
        width: button_width,
        height: button_height,
        description: reward.description,
        ) do
        reward.get_reward
        @window.change_scene(GameScene.new(@window))
      end

      @reward_buttons << button

      # Heal every character health
      CharacterData.instance.refill_health_for_all_player
    end
  end

  def reload_rewards
    @reward_caretaker.backup
    @reward_originator.state = RewardDirector.get_reward(@reward_object, @level_name)
    load_rewards
  end

  def go_back
    DebugLog.warning "reload rewards to anterior state"
    @reward_caretaker.undo
    load_rewards
  end

  def update

  end

  def draw
    
    background_width = @namek_background.width / @window.width
    background_height = @namek_background.height / @window.height
    @namek_background.draw(0, 0, 0, background_width, background_height)

    @choose_your_reward.draw(@window.width / 2 - @choose_your_reward.width / 2, 150, 0, 1, 1)

    @reward_buttons.each(&:draw)
    @reload_button.draw
    if @reward_caretaker.mementos.length > 0
      @go_back_button.draw
    end
  end

  def button_down(id)
    @reward_buttons.each { |button| button.button_down(id) }
    @reload_button.button_down(id)
    if @reward_caretaker.mementos.length > 0
      @go_back_button.button_down(id)
    end
  end
end
