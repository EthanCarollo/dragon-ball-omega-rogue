# The CharacterStats implements some statistics that is used to multiply some value in the game
# The armur isn't in percentage, it's more like flat armor
class CharacterStats
  attr_accessor :intelligence, :strength, :wisdom, :armor

  def initialize(intelligence, strength, wisdom, armor = 10)
    @intelligence = intelligence
    @strength = strength
    @wisdom = wisdom
    @armor = armor
  end
end