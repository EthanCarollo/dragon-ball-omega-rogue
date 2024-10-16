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

      @rewards = [
        RewardFactory.get_intelligence_reward(5),
        RewardFactory.get_intelligence_reward(5),
        RewardFactory.get_intelligence_reward(5)
      ]
  
      @reward_buttons = []
      button_width = 150
      button_height = 100
      spacing = 20
      start_x = (@window.width - (button_width * 3 + spacing * 2)) / 2
      start_y = 150
  
      @rewards.each_with_index do |reward, i|
        button = @button_factory.create_image_button(
          x: start_x + (button_width + spacing) * i,
          y: start_y,
          normal_image_path: reward.asset_path,
          hover_image_path: reward.hover_asset_path,
          width: button_width,
          height: button_height
        ) do
          reward.get_reward
          puts "#{reward.name} reward activated!"
        end
  
        @reward_buttons << button
      end
  end

  def update

  end

  def draw
    @next_button.draw
    @reward_buttons.each(&:draw)
  end

  def button_down(id)
    @next_button.button_down(id)
    @reward_buttons.each { |button| button.button_down(id) }
  end
end
