class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end


  # def capacity(capacity = 20)
  #     @capacity = capacity
  # end

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
    @bikes.count == @capacity
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
