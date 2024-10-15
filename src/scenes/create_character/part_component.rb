class PartComponent
  attr_accessor :parts, :current_index

  def initialize(parts_array)
    @parts = parts_array
    @current_index = 0
  end

  def current_part
    @parts[@current_index].image
  end

  def goNextPart
    @current_index += 1
    @current_index = 0 if @current_index >= @parts.length
  end

  def goBackPart
    @current_index -= 1
    @current_index = @parts.length - 1 if @current_index < 0
  end
end


class Part
  attr_accessor :image

  def initialize(imagePath)
    @image = Gosu::Image.new(imagePath, retro: true)
  end
end

class PartComponentFactory
  def self.create_head_part_component
    PartComponent.new([
      Part.new("assets/parts/head/buu.png")
    ])
  end

  def self.create_body_part_component
    PartComponent.new([
      Part.new("assets/parts/body/buu.png")
    ])
  end
end
