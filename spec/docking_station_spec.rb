require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  describe '#release_bike' do
      it "tests that the release_bike method returns a bike" do
          bike = Bike.new
          subject.dock_bike(bike)
          expect(subject.release_bike).to be_an_instance_of Bike
      end
        # uses rspec 'predicate' syntax
      it "tests that the released bike is working" do
        bike = Bike.new
        subject.dock_bike(bike)
          expect(subject.release_bike.working?).to eq true
      end

      it "raises an error if docking station is empty" do
        expect {subject.release_bike}.to raise_error("No bikes available")
      end

    end

    describe '#dock_bike' do
      it "shows a bike that has been docked" do
        bike = Bike.new
        subject.dock_bike(bike)
        expect(subject.docked).to eq(bike)
      end
    end

end

# describe DockingStation do
#       #let(:docked) {docked = nil}
#
# end
