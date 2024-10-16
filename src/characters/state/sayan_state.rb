# TODO : kill me and implement this shit please fuck
class SayanState
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
    @character.updateState(SSGodState.new(@character))
    @character.set_max_hp(@character.max_hp + 300).heal(1000000)
    Player.instance.window.event_manager.notify("Character transformed in Super Sayan God !")
  end

  def awakenToSSJ
    @character.updateState(SSJState.new(@character))
    @character.set_max_hp(@character.max_hp + 50).heal(150)
    Player.instance.window.event_manager.notify("Character transformed in Super Sayan !")
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
    raise "error"
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
    Player.instance.window.event_manager.notify("Character already transformed in Super Sayan !")
    return
  end

  def awakenToSSJ
    return
  end

  def awakenToEgo
    raise "error"
  end
end