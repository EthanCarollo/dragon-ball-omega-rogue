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

  def kill
    raise "error"
  end
end

class CharacterDefaultState < CharacterState
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

  def kill
    raise "error"
  end
end