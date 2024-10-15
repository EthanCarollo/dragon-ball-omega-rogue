class TrainingButton < Button
  attr_reader :training_cost

  def initialize(window, x, y, width, height, training_name, training_cost, background_color, hover_color, text_color, &callback)
    super(window, x, y, width, height, training_name, background_color, hover_color, text_color, &callback)
    @training_cost = training_cost
    @training_name = training_name
  end

  def draw
    @is_hovered = hovering?
    current_color = @is_hovered ? @hover_color : @background_color
    Gosu.draw_rect(@x, @y, @width, @height, current_color)
    text_x = @x + (@width - @font.text_width(@text)) / 2
    text_y = @y + @font.height - 5
    @font.draw_text(@text, text_x, text_y, 1, 1.0, 1.0, @text_color)
    cost_text = "Cost: #{@training_cost}"
    cost_x = @x + (@width - @font.text_width(cost_text)) / 2
    cost_y = @y + @height - @font.height - 5 #
    @font.draw_text(cost_text, cost_x, cost_y, 1, 1.0, 1.0, @text_color)
  end
end
