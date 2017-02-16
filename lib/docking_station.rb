class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bikes available" if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    raise "Docking station is full" if full?
    @bikes.push(bike)
  end

private
  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count == DEFAULT_CAPACITY
  end

end


class Bike
  def working?
    true
  end
  def docked?
    true
  end
end
