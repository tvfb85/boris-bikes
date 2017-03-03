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
    #checks if the docking station is empty
    raise "No bikes available" if empty?
    #checks if any working bikes present
    if @bikes.any? { |bike| bike.broken == false }
      #loop through array to find first match
      @bikes.find do |bike|
        if bike.broken == false
          @bikes.delete(bike)
        end
      end

    else
      raise "No working bikes"
    end

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

#-----------------------------------------------------------
class Bike
  attr_accessor :broken

  def initialize
    @broken = false
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

end
