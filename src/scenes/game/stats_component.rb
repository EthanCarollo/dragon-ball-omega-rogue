class StatsComponent
    def initialize(window, player)
      @window = window
      @player = player
      @bar_width = 200
      @bar_height = 20
      @bar_spacing = 30
      @font = Gosu::Font.new(20)
      setup_stats
    end
  
    def setup_stats
          @stats = {
            health: { value: @player.character.hp, max_value: @player.character.max_hp, label: "Health" },
            strength: { value: 0, max_value: 150, label: "Strength" },
            intelligence: { value: 4, max_value: 150, label: "Intelligence" },
            wisdom: { value: 20, max_value: 150, label: "Wisdom" },
            armor: { value: 20, max_value: 1000, label: "Armor" }
          }
    end
  
    def draw_bar(stat, x, y)
      @window.draw_rect(x, y, @bar_width, @bar_height, Gosu::Color::GRAY, z = 1)

      fill_width = (stat[:value].to_f / stat[:max_value]) * @bar_width
      @window.draw_rect(x, y, fill_width, @bar_height, Gosu::Color::GREEN, z = 2)

      @font.draw_text("#{stat[:label]}: #{stat[:value]}/#{stat[:max_value]}", x + 5, y - 25, 3, 1.0, 1.0, Gosu::Color::WHITE)
    end
  
    def update
      @stats[:health][:value] = @player.character.hp
      @stats[:health][:max_value] = @player.character.max_hp
      @stats[:strength][:value] = @player.character.stats.strength
      @stats[:intelligence][:value] = @player.character.stats.intelligence
      @stats[:wisdom][:value] = @player.character.stats.wisdom
      @stats[:armor][:value] = @player.character.stats.armor
    end
  
    def draw
      start_x = @window.width - 50 - @bar_width
      start_y = 70
      y_offset = 0
  
      @stats.each do |_, stat|
        draw_bar(stat, start_x, start_y + y_offset)
        y_offset += @bar_height + @bar_spacing
      end
    end
  end
  