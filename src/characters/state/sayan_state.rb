# TODO : kill me and implement this shit please fuck
class SayanState
  attr_accessor :character

  def initialize(character)
    @character = character
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
  def get_character_head
    return @character.head.ssj_image
  end

  def get_character_body
    return @character.body.ssj_image
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
  def get_character_head
    return @character.head.ssred_image
  end

  def get_character_body
    return @character.body.ssred_image
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