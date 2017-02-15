require 'docking_station'

describe DockingStation do
  it 'releases a bike' do
    expect(DockingStation.new).to respond_to(:release_bike)
  end

  it 'docks a bike' do
    expect(DockingStation.new).to respond_to(:dock_bike)
  end

  it 'tests releasing the bike leaves docking station empty' do
    expect(DockingStation.new.release_bike).to eq("The docking station is empty")
  end

  it 'tests docking the bike makes docking station full' do
    expect(DockingStation.new.dock_bike).to eq("The docking station is full")
  end

  # it 'gets a bike' do
  #  expect(result).to eq(Bike.new)
  # end
  it 'checks if a bike is working' do
    expect(Bike.new.working?).to eq(true)
  end
  it 'checks if a bike is docked' do
    expect(Bike.new.docked?).to eq(true)
  end

  # it 'checks status' do
  #   expect(Bike.new.output).to eq(string)
  # end
end


# it { DockingStation.new.respond_to? (:release_bike) }
