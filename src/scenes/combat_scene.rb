class CombatScene
  def initialize(window)
    @window = window
    @font = Gosu::Font.new(20)

    # Define attacks
    player1_attacks = {
      "Punch" => { min: 5, max: 15 },
      "Kick" => { min: 10, max: 20 },
      "Special Move" => { min: 20, max: 30 }
    }

    player2_attacks = {
      "Scratch" => { min: 5, max: 10 },
      "Bite" => { min: 10, max: 20 }
    }

    # Create characters
    @player1 = Character.new("Player 1", 100, player1_attacks)
    @player2 = Character.new("Player 2", 100, player2_attacks)

    @current_turn = @player1
    @selected_attack = nil
  end

  def update
    if !@player1.alive?
      @winner = "Player 2 Wins!"
    elsif !@player2.alive?
      @winner = "Player 1 Wins!"
    elsif @current_turn == @player2 && !@winner
      @player2.random_attack(@player1)
      @current_turn = @player1
    end
  end

  def draw
    Gosu.draw_rect(0, 0, @window.width, @window.height, Gosu::Color::BLACK)

    # Draw player 1 stats
    @font.draw_text("#{@player1.name} HP: #{@player1.hp}", 50, 100, 1, 1.0, 1.0, Gosu::Color::WHITE)

    # Draw player 2 stats
    @font.draw_text("#{@player2.name} HP: #{@player2.hp}", @window.width - 200, 100, 1, 1.0, 1.0, Gosu::Color::WHITE)

    # Display whose turn it is
    @font.draw_text("Turn: #{@current_turn.name}", @window.width / 2 - 50, 50, 1, 1.0, 1.0, Gosu::Color::YELLOW)

    # If there's a winner, display it
    if @winner
      @font.draw_text(@winner, @window.width / 2 - 100, @window.height / 2, 1, 1.0, 1.0, Gosu::Color::GREEN)
    end

    # Display attack options for Player 1
    if @current_turn == @player1
      draw_attack_options
    end
  end

  def button_down(id)
    if id == Gosu::MS_LEFT && !@winner
      if @current_turn == @player1
        if attack_selected?
          @player1.attack(@player2, @selected_attack)
          @current_turn = @player2
          @selected_attack = nil
        else
          select_attack
        end
      end
    end
  end

  def draw_attack_options
    y_offset = @window.height - 150
    @player1.attack_options.each_with_index do |(name, _), index|
      Gosu.draw_rect(50, y_offset + (index * 50), 200, 40, Gosu::Color::GRAY)
      @font.draw_text(name, 60, y_offset + (index * 50) + 10, 1, 1.0, 1.0, Gosu::Color::WHITE)
    end
  end

  def select_attack
    y_offset = @window.height - 150
    mouse_x = @window.mouse_x
    mouse_y = @window.mouse_y

    @player1.attack_options.each_with_index do |(name, _), index|
      if mouse_x >= 50 && mouse_x <= 250 && mouse_y >= (y_offset + index * 50) && mouse_y <= (y_offset + (index * 50) + 40)
        @selected_attack = name
      end
    end
  end

  def attack_selected?
    !@selected_attack.nil?
  end
end
