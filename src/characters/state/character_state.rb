# TODO : kill me and implement this shit please fuck
class CharacterState
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

class CharacterDefaultState < CharacterState
  def get_character_head
    return @character.head.image
  end

  def get_character_body
    return @character.body.image
  end

  def awakenToSSRed
    raise "error"
  end

  def awakenToSSJ
    @character.updateState(SSJState.new(@character))
    Player.instance.window.event_manager.notify("Character transformed in Super Sayan !")
  end

  def awakenToEgo
    raise "error"
  end
end

class SSJState < CharacterState
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