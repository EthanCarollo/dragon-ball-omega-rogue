class CharacterState
  def initialize(character)
    @character = character
  end

  def get_character_head
    return @character.head.image
  end

  def get_character_body
    return @character.body.image
  end
end

class DefaultState < CharacterState
  def get_character_head
    return @character.head.image
  end

  def get_character_body
    return @character.body.image
  end
end