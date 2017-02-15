
class DockingStation
  attr_reader :status

  def initialize(*status)
    @status = status
  end

  # def status=(new_status)
  # end
  #
  # def status("full")
  #   @status
  # end

  def release_bike
     Bike.new
     @status = "empty"
     "The docking station is #{@status}"
  end

  def dock_bike
     Bike.new
     @status = "full"
     "The docking station is #{@status}"
  end
end

class Bike
  # def initialize(status)
  #   @status = status
  # end

  def working?
    true
  end

  def docked?
    true
  end

  # def output
  #   p "The docking station is #{@status}"
  # end

end
