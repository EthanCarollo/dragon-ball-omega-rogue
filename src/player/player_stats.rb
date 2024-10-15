# The PlayerStats implements some statistics that is used to multiply some value in the game
class PlayerStats
  attr_accessor :intelligence, :strength, :wisdom

  def initialize
    @intelligence = 0
    @strength = 0
    @wisdom = 0
  end
end