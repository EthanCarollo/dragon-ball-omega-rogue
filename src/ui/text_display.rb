class TextDisplay
  attr_reader :visible

  def initialize(window)
    @window = window
    @text = ""
    @visible = false
    @display_duration = 6.0
    @time_displayed = 0.0
    @actual_delta_time = 0.0
    @font = Gosu::Font.new(20)
  end

  def update(delta_time)
    return unless @visible

    @actual_delta_time = delta_time
    if delta_time - @time_displayed >= @display_duration
      @visible = false
      @text = ""
    end
  end

  def draw
    return unless @visible

    text_x = @window.width / 2 - @font.text_width(@text) / 2
    text_y = @window.height - 50

    background_opacity = 100 - ((@actual_delta_time - @time_displayed ) * 40)
    background_color = Gosu::Color.new(background_opacity, 0, 0, 0)  # Opacité 50, couleur noire
    background_width = @font.text_width(@text) + 20 # Largeur du fond avec un peu de marge
    background_height = @font.height + 10           # Hauteur du fond avec un peu de marge

    Gosu.draw_rect(text_x - 10, text_y - 5, background_width, background_height, background_color)

    text_opacity = 255 - ((@actual_delta_time - @time_displayed ) * 60)
    text_color = Gosu::Color.new(text_opacity, 255, 255, 255)
    @font.draw_text(@text, text_x, text_y, 1, 1.0, 1.0, text_color)
  end

  def receive(new_text)
    @text = new_text
    @visible = true
    @time_displayed = Gosu::milliseconds / 1000.0
  end
end
