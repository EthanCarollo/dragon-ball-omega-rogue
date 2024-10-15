
class Player
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  attr_accessor :name, :character, :round

  def setup(name, character)
    @name = name
    @character = character
    @round = 0
  end
end
