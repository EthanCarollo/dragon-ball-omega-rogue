require 'gosu'

class ChooseFightScene
  def initialize(window)
    @window = window
    @font = Gosu::Font.new(20)
    @name_font = Gosu::Font.new(30)
    @stats_font = Gosu::Font.new(25)
    @background_image = Gosu::Image.new("./assets/background/namek_background.png", retro: true)

    @button_factory = ButtonFactory.new(@window)

    @levels = LevelDirector.get_random_level
    
    @level_buttons = []
    
    button_width = 500
    button_height = 100
    spacing = 20
    start_x = (@window.width - button_width) / 2
    start_y = 75
    
    @levels.each_with_index do |level, index|
      button = @button_factory.create_default_button(
        x: start_x,
        y: start_y + (button_height + spacing) * index,
        width: button_width,
        height: button_height,
        text: level.name
      ) do
        DebugLog.warning "Level #{index + 1} selected: #{level}"
        @window.change_scene(CombatScene.new(@window, Player.instance.character, level))
      end

      @level_buttons << button
    end

    # Bouton retour pour revenir au menu
    @back_button = @button_factory.create_image_button(
      x: (@window.width - 250) / 2,
      y: start_y + (button_height + spacing) * @levels.size + 50,  # Positionne en dessous des niveaux
      normal_image_path: "./assets/ui/button_main_menu.png",
      hover_image_path: "./assets/ui/button_main_menu.png",
      width: 250,
      height: 50
    ) do
      @window.change_scene(GameScene.new(@window))  # Retour au menu principal
    end
  end

  def update
    @hovered_level = nil
    @level_buttons.each_with_index do |button, index|
      if button.hovering?
        @hovered_level = @levels[index]
        break
      end
    end
  end

  def draw
    background_width = @background_image.width / @window.width
    background_height = @background_image.height / @window.height
    @background_image.draw(0, 0, 0, background_width, background_height)
    @level_buttons.each(&:draw)
    @back_button.draw

    character_size = 450
    Player.instance.character.draw_at(10, @window.height / 2 - character_size / 2 + 50, false, false, character_size)

    # TODO ----------
    # This logics works well, the only problem is that it is really not cpu efficient, it takes a lot of
    # memory for weird reason and cpu cannot follow it, so I will need to make it more efficient
    # if I want to make this game really playable
    # TODO ----------
    if @hovered_level
        opponent = @hovered_level.opponent
      
        opponent_x = @window.width - 10 - character_size
        opponent_y = @window.height / 2 - character_size / 2 + 50
        opponent.draw_at(opponent_x, opponent_y, true, false, character_size)
      
        name_font = Gosu::Font.new(30)
        name_text = opponent.name
        name_width = name_font.text_width(name_text)
        name_x = opponent_x + (character_size - name_width) / 2
        name_y = opponent_y - 40  
      
        rect_padding = 10
        name_rect_x = name_x - rect_padding
        name_rect_y = name_y - rect_padding
        name_rect_width = name_width + rect_padding * 2
        name_rect_height = name_font.height + rect_padding * 2
        Gosu.draw_rect(name_rect_x, name_rect_y, name_rect_width, name_rect_height, Gosu::Color.new(200, 0, 0, 0), 0)
        name_font.draw_text(name_text, name_x, name_y, 1, 1, 1, Gosu::Color::WHITE)
        stats_text = "Intelligence: #{opponent.stats.intelligence}\n" \
                     "Strength: #{opponent.stats.strength}\n" \
                     "Wisdom: #{opponent.stats.wisdom}\n" \
                     "Armor: #{opponent.stats.armor}\n" \
                     "HP: #{opponent.hp}"
      
        stats_x_right = opponent_x + character_size - 20  
        stats_y = opponent_y + 20  

        stats_text.split("\n").each_with_index do |line, index|
          line_y = stats_y + index * (@stats_font.height + 20)
          line_width = @stats_font.text_width(line) + rect_padding * 2  
          line_x = stats_x_right - line_width + rect_padding
          Gosu.draw_rect(line_x - rect_padding, line_y - rect_padding, line_width, @stats_font.height + rect_padding * 2, Gosu::Color.new(168, 0, 0, 0), 0)
          @stats_font.draw_text(line, line_x, line_y, 1, 1, 1, Gosu::Color::WHITE)
        end
      end
      
  end

  def button_down(id)
    if id == Gosu::MS_LEFT
      @level_buttons.each do |button|
        if button.clicked?(@window.mouse_x, @window.mouse_y)
          button.trigger
        end
      end

      if @back_button.clicked?(@window.mouse_x, @window.mouse_y)
        @back_button.trigger
      end
    end
  end
end
