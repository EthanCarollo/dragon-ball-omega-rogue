class TextDisplay
  attr_reader :visible

  def initialize(window)
    @window = window
    @text = ""
    @visible = false
    @display_duration = 3.0
    @time_displayed = 0.0
    @font = Gosu::Font.new(20)
  end

  def update(delta_time)
    return unless @visible

    if delta_time - @time_displayed >= @display_duration
      @visible = false
      @text = ""
    end
  end

  def draw
    return unless @visible

    # Calculer la position du texte
    text_x = @window.width / 2 - @font.text_width(@text) / 2
    text_y = @window.height - 50

    # Dessiner un fond noir semi-transparent
    background_color = Gosu::Color.new(50, 0, 0, 0)  # Opacité 50, couleur noire
    background_width = @font.text_width(@text) + 20 # Largeur du fond avec un peu de marge
    background_height = @font.height + 10           # Hauteur du fond avec un peu de marge

    # Dessiner le rectangle en arrière-plan
    Gosu.draw_rect(text_x - 10, text_y - 5, background_width, background_height, background_color)

    # Dessiner le texte
    @font.draw_text(@text, text_x, text_y, 1, 1.0, 1.0, Gosu::Color::WHITE)
  end

  def receive(new_text)
    @text = new_text
    @visible = true
    @time_displayed = Gosu::milliseconds / 1000.0
  end
end
