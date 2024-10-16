class ImageButton < Button
    def initialize(window, x, y, normal_image_path, hover_image_path, desired_width = 128, desired_height = 128, description = "", &callback)
      super(window, x, y, desired_width, desired_height, "", Gosu::Color::NONE, Gosu::Color::NONE, "", &callback)
      @normal_image = Gosu::Image.new(normal_image_path, retro: true)
      @hover_image = Gosu::Image.new(hover_image_path, retro: true)
      @width = @normal_image.width
      @height = @normal_image.height
      @width = desired_width
      @height = desired_height
      @description = description
      @font = Gosu::Font.new(20)
    end

    def hovering?
        mouse_x = @window.mouse_x
        mouse_y = @window.mouse_y
        mouse_x > @x && mouse_x < @x + @width && mouse_y > @y && mouse_y < @y + @height
    end
  
    def draw
      @is_hovered = hovering?
      current_image = @is_hovered ? @hover_image : @normal_image
      
      width_button = @width.to_f / @normal_image.width
      height_button = @height.to_f / @normal_image.height

      current_image.draw(@x, @y, 0, width_button, height_button)

      if @description.length > 0 && hovering?
        description_color = Gosu::Color.new(128, 255, 255, 255)
        description_x = @x + 10 
        description_y = @y + @height + 5 
        @window.draw_rect(description_x - 5, description_y - 5, @font.text_width(@description) + 10, @font.height + 10, description_color, 0)
        @font.draw_text(@description, description_x, description_y, 1, 1, 1, Gosu::Color::BLACK)
      end
    end
  end