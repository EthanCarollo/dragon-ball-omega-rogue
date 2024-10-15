
class Player
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  attr_accessor :name, :character

  def setup(name, character)
    @name = name
    @character = character
  end
end
