# TODO : Here, I should just add to the scene the Character that needs to fight here
class CombatScene
  def initialize(window)
    @window = window
    
    @font = Gosu::Font.new(20)
    

    player1_attacks = [
      ClassicAttack.new("Punch", 5, 15),
      ClassicAttack.new("Kick", 10, 20),
      ClassicAttack.new("Special Move", 20, 30)
    ]


    player2_attacks = [
      ClassicAttack.new("Slap", 4, 12),
      ClassicAttack.new("Headbutt", 8, 18),
      ClassicAttack.new("Power Punch", 15, 25)
    ]

    # Create instances of characters
    @player1 = Character.new("Player 1", 100, player1_attacks, "assets/character/vegeta/idle.png")
    @player2 = Character.new("Player 2", 100, player2_attacks, "assets/character/vegeta/idle.png")

    # Set the positions for the characters
    @player1_x = 100 # Position for Player 1
    @player1_y = 300
    @player2_x = @window.width - 100 - 128 # Position for Player 2 (right side)
    @player2_y = 300
    
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
      ) { puts "click on button" }
      @ability_buttons << button
    end
  end

  def update
    if @turn == 1 # If it's Player 2's turn
      @player2.random_attack(@player1) # AI attacks Player 1
      @turn = 0 # Switch turn back to Player 1
    end
  end

  def draw
    Gosu.draw_rect(0, 0, @window.width, @window.height, Gosu::Color::BLACK)

    # Draw characters at their designated positions
    @player1.draw_at(@player1_x, @player1_y)
    @player2.draw_at(@player2_x, @player2_y, true)

    # Display HP and turn information
    display_info
    
    # Display attack options for Player 1
    display_attack_options
  end

  def display_info
    screen_width = 1280
  
    @font.draw_text("Player 1 HP: #{@player1.hp}", 10, 10, 1, 1.0, 1.0, Gosu::Color::WHITE)
  
    player2_hp_text = "Player 2 HP: #{@player2.hp}"
    player2_hp_width = @font.text_width(player2_hp_text)
    @font.draw_text(player2_hp_text, screen_width - player2_hp_width - 10, 10, 1, 1.0, 1.0, Gosu::Color::WHITE)
  
    current_player = @turn == 0 ? @player1.name : @player2.name
    turn_text = "#{current_player}'s Turn"
    turn_width = @font.text_width(turn_text) 
    @font.draw_text(turn_text, (screen_width - turn_width) / 2, 30, 1, 1.0, 1.0, Gosu::Color::YELLOW)
  end
  
  def display_attack_options
    @ability_buttons.each_with_index do |(attack, _), index|
      attack.draw
    end
  end

  def button_down(id)
    if id == Gosu::MS_LEFT
      if @turn == 0 
        mouse_x, mouse_y = @window.mouse_x, @window.mouse_y 
        attack_index = calculate_attack_index(mouse_x, mouse_y)
  
        if attack_index && @player1.alive?
          puts attack_index
          attack = @player1.attack_options[attack_index]
          @player1.attack(@player2, attack)
          @turn = 1 
        end
      end
    end
  end
  
  def calculate_attack_index(mouse_x, mouse_y)
    start_x = 10
    start_y = 720 - 64 - 10 
    rect_size = 64
    spacing = 10 

    if mouse_y >= start_y && mouse_y <= start_y + rect_size
      index = ((mouse_x - start_x) / (rect_size + spacing)).floor   
      return index if index >= 0 && index < @player1.attack_options.size
    end
  
    nil 
  end
  
end
