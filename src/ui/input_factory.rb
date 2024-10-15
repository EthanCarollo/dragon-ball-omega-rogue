class InputFactory
  def initialize(window)
    @window = window
  end

  # Factory method to create a default input field
  def create_default_input(x:, y:, width:, placeholder:, font_size: 20)
    Input.new(@window, x, y, font_size, width, placeholder)
  end

  # Factory method to create a customized input field
  def create_input(x:, y:, width:, font_size:, placeholder:, cursor_blink_rate:)
    input = Input.new(@window, x, y, font_size, width, placeholder)
    input.instance_variable_set(:@cursor_blink_rate, cursor_blink_rate)
    input
  end
end
