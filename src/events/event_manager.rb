class EventManager
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def notify(event)
    @observers.each { |observer| observer.receive(event) }
  end
end
