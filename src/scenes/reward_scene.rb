require 'gosu'
class RewardScene
  def initialize(window, rewards)
    @window = window
    @font = Gosu::Font.new(20)

    @choose_your_reward = Gosu::Image.new("./assets/ui/choose_your_reward.png", retro: true)
    @namek_background = Gosu::Image.new("./assets/background/namek_background_pale.png", retro: true)
    @button_factory = ButtonFactory.new(window)

    @rewards = rewards

    @reward_buttons = []
    button_width = 150
    button_height = 150
    spacing = 20
    start_x = (@window.width - (button_width * 3 + spacing * 2)) / 2
    start_y = @window.height - 400

    @rewards.each_with_index do |reward, i|
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
    end
  end

  def update

  end

  def draw
    
    background_width = @namek_background.width / @window.width
    background_height = @namek_background.height / @window.height
    @namek_background.draw(0, 0, 0, background_width, background_height)

    @choose_your_reward.draw(@window.width / 2 - @choose_your_reward.width / 2, 150, 0, 1, 1)

    @reward_buttons.each(&:draw)
  end

  def button_down(id)
    @reward_buttons.each { |button| button.button_down(id) }
  end
end
