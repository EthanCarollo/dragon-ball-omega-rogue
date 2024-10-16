
class RewardOriginator
  attr_accessor :state

  def initialize(state)
    @state = state
  end

  def save
    deep_copied_state = @state.map(&:deep_copy)
    RewardMemento.new(deep_copied_state)
  end

  def restore(memento)
    puts memento.state
    @state = memento.state
  end
end

class RewardCaretaker
  attr_accessor :mementos
  def initialize(originator)
    @mementos = []
    @originator = originator
  end

  def backup
    @mementos << @originator.save
  end

  def undo
    return if @mementos.empty?
    memento = @mementos.pop
    @originator.restore(memento)
  end

  def show_history
    @mementos.each { |memento| puts memento }
  end
end

class RewardMemento
  attr_reader :state
  attr_reader :date

  def initialize(state)
    @state = state
    @date = Time.now.strftime('%F %T')
  end
end
