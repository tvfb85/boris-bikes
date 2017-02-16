class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bikes available" unless !@bikes.empty?
    @bikes.pop
  end

  def dock_bike(bike)
    raise "Docking station is full" unless @bikes.count < 20
    @bikes.push(bike)
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
