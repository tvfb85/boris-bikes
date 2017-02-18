require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  describe "capacity" do
    context "without parameters" do
      #let(:docking_station) { DockingStation.new }
      it "should use the default capacity of 20" do
        expect(subject.capacity).to eq(20)
      end
    end
    context "with parameters" do
      let(:station) { DockingStation.new(25)}
      it "should allow the user to specify a capacity value" do
        expect(station.capacity).to eq(25)
      end
    end
  end

  describe '#release_bike' do
    it "tests that the release_bike method returns a bike" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to be_an_instance_of Bike
    end

    it "tests that the released bike is working" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to have_attributes(:broken => false)
    end

    describe '#working' do
      it 'raises an error if the bike is broken' do
        bike = Bike.new
        bike.report_broken
        20.times { subject.dock_bike(bike) }
        expect {subject.release_bike}.to raise_error("No working bikes")
      end
    end
  end

  it "raises an error if docking station is empty" do
    bike = Bike.new
    bike.report_broken
    expect {subject.release_bike}.to raise_error("No bikes available")
  end

  describe '#dock_bike' do
    context "with parameters" do
      let(:docking_station) { DockingStation.new(35) }
      it "raises an error if docking station is full" do
        subject.capacity.times { subject.dock_bike(Bike.new) }
        expect {subject.dock_bike(Bike.new)}.to raise_error("Docking station is full")
      end
    end


    describe '#dock_bike returns bikes' do

      before :each do
        @bike = Bike.new
        subject.dock_bike(@bike)
      end

      it "shows a bike that has been docked" do
        expect(subject.bikes).to eq([@bike])
      end

      it "returns an array" do
        expect(subject.bikes).to be_kind_of(Array)
      end

      it "adds a new bike to the end of the array" do
        expect(subject.bikes[-1]).to eq(@bike)
      end

      it "does not add bike to the beginning of the array" do
        @bike = Bike.new
        subject.dock_bike(@bike)
        expect(subject.bikes[0]).to_not eq(@bike)
      end
    end

    describe "#dock_bike accepts broken bikes" do
      it "docks broken bikes" do
        bike = Bike.new
        bike.report_broken
        subject.dock_bike(bike)
        expect(subject.bikes).to include(bike)
      end
    end

  end
end
