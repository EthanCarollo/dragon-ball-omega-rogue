# TODO : kill me and implement this shit please fuck
class SayanState
  attr_accessor :character

  def initialize(character)
    @character = character
  end

  def update
    return
  end

  def aura
    return 
  end

  def current_aura_image
    return
  end

  def get_character_image
    return @character.sprite
  end

  def awakenToSSRed
    raise "error"
  end

  def awakenToSSJ
    raise "error"
  end

  def awakenToEgo
    raise "error"
  end
end

class SayanDefaultState < SayanState
  def get_character_head
    return @character.head.image
  end

  def get_character_body
    return @character.body.image
  end

  def awakenToSSRed
    SuperSayanGodProxy.new(self).activate
  end

  def awakenToSSJ
    SuperSayanProxy.new(self).activate
  end

  def awakenToEgo
    raise "error"
  end
end

class SSJState < SayanState
  FRAME_COUNT = 45

  def initialize(character)
    super(character)


    @images_aura = [
        "./assets/aura/sayan/sayan_1_aura.png",
        "./assets/aura/sayan/sayan_2_aura.png",
        "./assets/aura/sayan/sayan_3_aura.png",
        "./assets/aura/sayan/sayan_4_aura.png"
    ]


    @current_aura_frame = 0 
    @frame_time = 0 
  end

  def get_character_head
    return @character.head.ssj_image
  end

  def get_character_body
    return @character.body.ssj_image
  end

  def update
    @frame_time += 1 
    if @frame_time >= 5
      @frame_time = 0
      @current_aura_frame = (@current_aura_frame + 1) % @images_aura.size
    end
  end

  def current_aura_image
    Gosu::Image.new(@images_aura[@current_aura_frame], retro: true)
  end

  def awakenToSSRed
    SuperSayanGodProxy.new(self).activate
  end

  def awakenToSSJ
    Player.instance.window.event_manager.notify("Character already transformed in Super Sayan !")
    return
  end

  def awakenToEgo
    raise "error"
  end
end

class SSGodState < SayanState
  FRAME_COUNT = 45

  def initialize(character)
    super(character)

    @images_aura = [
        "./assets/aura/ssred/sayan_1_aura.png",
        "./assets/aura/ssred/sayan_2_aura.png",
        "./assets/aura/ssred/sayan_3_aura.png",
        "./assets/aura/ssred/sayan_4_aura.png"
    ]
    
    @current_aura_frame = 0 
    @frame_time = 0 
  end

  def get_character_head
    return @character.head.ssred_image
  end

  def get_character_body
    return @character.body.ssred_image
  end

  def update
    @frame_time += 1 
    if @frame_time >= 5
      @frame_time = 0
      @current_aura_frame = (@current_aura_frame + 1) % @images_aura.size
    end
  end

  def current_aura_image
    Gosu::Image.new(@images_aura[@current_aura_frame], retro: true)
  end

  def awakenToSSRed
    Player.instance.window.event_manager.notify("Character already transformed in Super Sayan God !")
    return
  end

  def awakenToSSJ
    Player.instance.window.event_manager.notify("Cannot transform in Super Sayan while in Super Sayan God !")
    return
  end

  def awakenToEgo
    raise "error"
  end
end