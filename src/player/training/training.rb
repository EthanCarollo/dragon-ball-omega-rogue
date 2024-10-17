class Training
  attr_accessor :name, :cost

  def initialize(name, cost)
    @name = name
    @cost = cost
  end

  def activate(player)
    DebugLog.warning "#{@name} a été activé par #{player.name}."
  end
end