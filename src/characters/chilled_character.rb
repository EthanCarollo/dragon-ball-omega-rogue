class ChilledCharacter < Character

  attr_accessor :name, :hp, :attack_options, :stats, :head, :body, :max_hp

  def initialize(name, hp = 100)
    super(name, hp)
    @state = nil
  end

  def updateState(state)
    @state = state
  end

  def awakenToSSRed
    @state.awakenToSSRed
  end

  def awakenToSSJ
    @state.awakenToSSJ
  end

  def awakenToEgo
    @state.awakenToEgo
  end

end