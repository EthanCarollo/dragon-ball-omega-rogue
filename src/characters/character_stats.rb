# The CharacterStats implements some statistics that is used to multiply some value in the game
class CharacterStats
  attr_accessor :intelligence, :strength, :wisdom

  def initialize(intelligence, strength, wisdom)
    @intelligence = intelligence
    @strength = strength
    @wisdom = wisdom
  end
end