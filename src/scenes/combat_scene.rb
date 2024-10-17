# TODO : Here, I should just add to the scene the Character that needs to fight here
class CombatScene
  DELAY_BETWEEN_ATTACKS = 5.0
  def initialize(window, player, level)
    @window = window

    @level = level
    
    @font = Gosu::Font.new(20)

    @player1 = player
    @player2 = level.opponent

    # Set the positions for the characters
    @player1_x = 200 # Position for Player 1
    @player1_y = 400
    @player2_x = @window.width - 200 - 128 # Position for Player 2 (right side)
    @player2_y = 400

    @background_image = Gosu::Image.new("./assets/map/fight_map.png", retro: true)
    @turn = 0

    @ability_buttons = []
    @button_factory = ButtonFactory.new(window)
    @player1.attack_options.each_with_index do |(attack, _), index|
      start_x = 10
      desired_size = 84
      start_y = 720 - desired_size - 10 
      x_position = start_x + index * (desired_size + 10) 
      button = @button_factory.create_image_button(
        x: x_position,
        y: start_y,
        normal_image_path: attack.asset_path,
        hover_image_path: attack.asset_path,
        width: desired_size,
        height: desired_size,
      ) { 
        DebugLog.warning "click on button"
        @turn = 1
        @last_attack_time = Time.now
        Thread.new do
          # Just made a little thread for a delay between attack
          sleep(DELAY_BETWEEN_ATTACKS / 1.1)
          @player1.attack(@player2, attack)
        end
      }
      @ability_buttons << button
    end

    @last_attack_time = Time.now
  end

  def update
    if not @player2.alive?
      player_win
      return
    elsif not @player1.alive? 
      player_loose
      # return
    end
    if @turn == 1
      if Time.now - @last_attack_time >= DELAY_BETWEEN_ATTACKS
        @player2.random_attack(@player1)
        @turn = 0
        @last_attack_time
      end

    end
  end

  def draw
    background_width =  @window.width.to_f / @background_image.width
    background_height =  @window.height.to_f / @background_image.height
    @background_image.draw(0, 0, 0, background_width, background_height)

    @player1.draw_at(@player1_x, @player1_y, false, true, 160)
    @player2.draw_at(@player2_x, @player2_y, true, true, 160)

    display_info
    display_attack_options
  end

  def player_win
    @window.event_manager.notify("#{@player1.name} Winned !")
    @window.change_scene(RewardScene.new(@window, @level.reward_object, @level.name))
  end

  def player_loose
    # TODO : add loose screen scene
    @window.event_manager.notify("#{@player1.name} Loosed ! Returning to the menu scene !")
    @window.change_scene(MenuScene.new(@window))
  end

  def display_info
    screen_width = 1280
    @window.draw_quad(10, 100, Gosu::Color.rgba(0, 0, 0, 128),          # Coin haut gauche
                      10 + @font.text_width("Player 1 HP: #{@player1.hp}"), 100, Gosu::Color.rgba(0, 0, 0, 128), # Coin haut droit
                      10 + @font.text_width("Player 1 HP: #{@player1.hp}"), 120, Gosu::Color.rgba(0, 0, 0, 128), # Coin bas droit
                      10, 120, Gosu::Color.rgba(0, 0, 0, 128))          # Coin bas gauche
    @font.draw_text("Player 1 HP: #{@player1.hp}", 10, 100, 1, 1.0, 1.0, Gosu::Color::WHITE)
    player2_hp_text = "Player 2 HP: #{@player2.hp}"
    player2_hp_width = @font.text_width(player2_hp_text)
    @window.draw_quad(screen_width - player2_hp_width - 10, 100, Gosu::Color.rgba(0, 0, 0, 128),    # Coin haut gauche
                      screen_width - 10, 100, Gosu::Color.rgba(0, 0, 0, 128),                       # Coin haut droit
                      screen_width - 10, 120, Gosu::Color.rgba(0, 0, 0, 128),                       # Coin bas droit
                      screen_width - player2_hp_width - 10, 120, Gosu::Color.rgba(0, 0, 0, 128))    # Coin bas gauche
    @font.draw_text(player2_hp_text, screen_width - player2_hp_width - 10, 100, 1, 1.0, 1.0, Gosu::Color::WHITE)
    current_player = @turn == 0 ? @player1.name : @player2.name
    turn_text = "#{current_player}'s Turn"
    turn_width = @font.text_width(turn_text)
    @window.draw_quad((screen_width - turn_width) / 2, 130, Gosu::Color.rgba(0, 0, 0, 128),   # Coin haut gauche
                      (screen_width + turn_width) / 2, 130, Gosu::Color.rgba(0, 0, 0, 128),   # Coin haut droit
                      (screen_width + turn_width) / 2, 150, Gosu::Color.rgba(0, 0, 0, 128),   # Coin bas droit
                      (screen_width - turn_width) / 2, 150, Gosu::Color.rgba(0, 0, 0, 128))   # Coin bas gauche
    @font.draw_text(turn_text, (screen_width - turn_width) / 2, 130, 1, 1.0, 1.0, Gosu::Color::YELLOW)
  end
  
  def display_attack_options
    if @turn == 0
      @ability_buttons.each_with_index do |(attack, _), index|
        attack.draw
      end
    end
  end

  def button_down(id)
    if id == Gosu::MS_LEFT
      if @turn == 0 
        @ability_buttons.each_with_index do |(attack, _), index|
          attack.button_down(id)
        end
      end
    end
  end
end
