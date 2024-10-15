class CombatScene
  def initialize(window)
    @window = window
    
    @font = Gosu::Font.new(20)
    
    # Define attack options for each character
    player1_attacks = {
      "Punch" => { min: 5, max: 15 },
      "Kick" => { min: 10, max: 20 },
      "Special Move" => { min: 20, max: 30 }
    }

    player2_attacks = {
      "Slap" => { min: 4, max: 12 },
      "Headbutt" => { min: 8, max: 18 },
      "Power Punch" => { min: 15, max: 25 }
    }

    # Create instances of characters
    @player1 = Character.new("Player 1", 100, player1_attacks, "assets/character/vegeta/idle.png")
    @player2 = Character.new("Player 2", 100, player2_attacks, "assets/character/vegeta/idle.png")

    # Set the positions for the characters
    @player1_x = 100 # Position for Player 1
    @player1_y = 300
    @player2_x = @window.width - 100 - 128 # Position for Player 2 (right side)
    @player2_y = 300
    
    @turn = 0 # 0 for Player 1, 1 for Player 2
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
    @player2.draw_at(@player2_x, @player2_y)

    # Display HP and turn information
    display_info
    
    # Display attack options for Player 1
    display_attack_options
  end

  def display_info
    # Display Player 1's HP
    @font.draw_text("Player 1 HP: #{@player1.hp}", 10, 10, 1, 1.0, 1.0, Gosu::Color::WHITE)
    
    # Display Player 2's HP
    @font.draw_text("Player 2 HP: #{@player2.hp}", 10, 30, 1, 1.0, 1.0, Gosu::Color::WHITE)

    # Display current turn
    current_player = @turn == 0 ? @player1.name : @player2.name
    @font.draw_text("#{current_player}'s Turn", 10, 50, 1, 1.0, 1.0, Gosu::Color::YELLOW)
  end

  def display_attack_options
    @font.draw_text("Attack Options:", 10, 100, 1, 1.0, 1.0, Gosu::Color::WHITE)
    
    @player1.attack_options.each_with_index do |(attack_name, _), index|
      @font.draw_text("#{index + 1}. #{attack_name}", 10, 120 + index * 20, 1, 1.0, 1.0, Gosu::Color::WHITE)
    end
  end

  def button_down(id)
    if id == Gosu::MS_LEFT
      if @turn == 0 # Player 1's turn
        attack_name = choose_attack # Replace this with actual input logic
        if @player1.alive?
          @player1.attack(@player2, attack_name)
          @turn = 1 # Switch turn to Player 2
        end
      end
    end
  end

  def choose_attack
    # Placeholder for attack selection logic. You could replace this with actual UI for selecting attacks.
    attack_index = rand(@player1.attack_options.keys.length) # Randomly select an attack index
    @player1.attack_options.keys[attack_index] # Return the attack name
  end
end
