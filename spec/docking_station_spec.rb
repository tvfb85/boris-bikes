require 'docking_station'

describe DockingStation do
  docking = DockingStation.new
  it 'releases a bike' do
    expect(docking).to respond_to(:release_bike)
  end
end
