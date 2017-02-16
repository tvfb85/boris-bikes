class DockingStation
  attr_reader :docked
  # def initialize(*status)
  #   @status = status
  # end

  def release_bike
    raise "No bikes available" if docked == nil
    #  @status = "empty"
    #  "The docking station is #{@status}"
    Bike.new
  end

  def dock_bike(bike)
    @docked = bike
    #  @status = "full"
    #  "The docking station is #{@status}"
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
