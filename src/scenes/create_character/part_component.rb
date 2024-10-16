class PartComponent
  attr_accessor :parts, :current_index

  def initialize(parts_array)
    @parts = parts_array
    @current_index = 0
  end

  def current_part
    @parts[@current_index]
  end

  def current_part_image
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

class PartComponentFactory
  def self.create_head_part_component
    PartComponent.new([
      Part.new("assets/parts/head/vegeta.png", "assets/parts/head/vegeta_ego.png"),
      Part.new("assets/parts/head/goku_gt.png", "assets/parts/head/goku_ssred.png"),
      Part.new("assets/parts/head/gohan_mirai.png", "assets/parts/head/gohan_mirai_ssj.png"),
      Part.new("assets/parts/head/trunks.png", "assets/parts/head/trunks_ssj.png")
    ])
  end

  def self.create_body_part_component
    PartComponent.new([
      Part.new("assets/parts/body/vegeta.png"),
      Part.new("assets/parts/body/goku_gt.png"),
      Part.new("assets/parts/body/gohan_mirai.png")
    ])
  end
end

class Part
  attr_accessor :image, :ssj_image

  def initialize(imagePath, awakenedImg = false)
    @image = Gosu::Image.new(imagePath, retro: true)
    if awakenedImg == false
      @ssj_image = Gosu::Image.new(imagePath, retro: true)
    else
      @ssj_image = Gosu::Image.new(awakenedImg, retro: true)
    end
  end
end

class PartFactory 
  def self.create_vegeta_head
    Part.new("assets/parts/head/vegeta.png", "assets/parts/head/vegeta_ego.png")
  end

  def self.create_vegeta_body
    Part.new("assets/parts/body/vegeta.png")
  end
end
