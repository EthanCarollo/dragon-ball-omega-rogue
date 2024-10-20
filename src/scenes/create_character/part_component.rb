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
      Part.new("assets/parts/head/vegeta.png", "assets/parts/head/vegeta_ssj.png", "assets/parts/head/vegeta_ssred.png"),
      Part.new("assets/parts/head/goku_gt.png", "assets/parts/head/goku_gt_ssj.png", "assets/parts/head/goku_ssred.png"),
      Part.new("assets/parts/head/gohan_mirai.png", "assets/parts/head/gohan_mirai_ssj.png", "assets/parts/head/gohan_mirai_ssred.png"),
      Part.new("assets/parts/head/trunks.png", "assets/parts/head/trunks_ssj.png", "assets/parts/head/trunks_ssred.png")
    ])
  end

  def self.create_body_part_component
    PartComponent.new([
      Part.new("assets/parts/body/vegeta.png"),
      Part.new("assets/parts/body/goku_gt.png"),
      Part.new("assets/parts/body/gohan_mirai.png")
    ])
  end

  def self.create_chilled_part_component
    PartComponent.new([
      Part.new("assets/parts/full/frieza1.png")
    ])
  end
end

class Part
  attr_accessor :image, :ssj_image, :ssred_image

  def initialize(imagePath, ssj_image = nil, ssred_image = nil)
    @image = Gosu::Image.new(imagePath, retro: true)
    if ssj_image == nil
      @ssj_image = Gosu::Image.new(imagePath, retro: true)
    else
      @ssj_image = Gosu::Image.new(ssj_image, retro: true)
    end

    if ssred_image == nil
      @ssred_image = Gosu::Image.new(imagePath, retro: true)
    else
      @ssred_image = Gosu::Image.new(ssred_image, retro: true)
    end
  end

  def self.get_normal_character_part(key)
    Part.new(CharacterDataPart.instance.get_value(key))
  end
end

class PartFactory 

  def self.create_part_component(part_component)
    begin 
      Part.new(part_component["normal"], part_component["ssj"], part_component["ssjgod"])
    rescue StandardError => e
      DebugLog.error("Got an error in creating part component for : #{part_component["normal"]} : #{e}")
    end
  end

end
