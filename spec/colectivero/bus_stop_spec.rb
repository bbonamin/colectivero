require 'spec_helper'

describe 'BusStop' do
	it 'should return a bus_stop number when called with the correct parameters' do
		bus = Colectivero::Bus.new('110')
		street = bus.streets.first
		intersection = bus.intersections(street).first
		bus_stop = Colectivero::BusStop.new(bus, street, intersection)

		bus_stop.should_not be_nil
	end

	it 'should return an error when called with no parameters' do
		expect { Colectivero::BusStop.new}.should raise_error
	end
end