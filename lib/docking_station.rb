class DockingStation
  attr_reader :docked
  # def initialize(*status)
  #   @status = status
  # end

  def release_bike
    raise "No bikes available" unless @docked
    Bike.new
    #  @status = "empty"
    #  "The docking station is #{@status}"
  end

  def dock_bike(bike)
    raise "Docking station is full" unless !@docked
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
