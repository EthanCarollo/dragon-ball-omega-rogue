class DebugFPS
  def initialize
    @fps_font = Gosu::Font.new(20)
  end

  def draw
    fps_text = "FPS: #{Gosu.fps}"
    text_width = @fps_font.text_width(fps_text)
    text_height = @fps_font.height
    Gosu.draw_rect(0, 0, text_width + 10, text_height + 10, Gosu::Color::BLACK, 4)
    @fps_font.draw_text(fps_text, 5, 5, 5, 1.0, 1.0, Gosu::Color::WHITE)
  end
end