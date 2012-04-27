require 'spec_helper'

describe 'Arrival' do
	it 'should return a string when called with object parameters' do
		bus = Colectivero::Bus.new('110')
		street = bus.streets.first
		intersection = bus.intersections(street).first
		bus_stop = Colectivero::BusStop.new(bus, street, intersection)

		arrival = Colectivero::Arrival.new bus, bus_stop
		arrival.message.should_not match "Disculpe\\*"
	end

	it 'should return a string when called with a bus stop number' do
		bus = Colectivero::Bus.new('110')
		valid_bus_stop = 7969

		arrival = Colectivero::Arrival.new bus, valid_bus_stop
		arrival.message.should_not match "Disculpe\\*"
	end

	it 'should return a Disculpe message when called with an invalid bus stop' do
		bus = Colectivero::Bus.new('110')
		street = bus.streets.first
		intersection = bus.intersections(street).first
		bus_stop = Colectivero::BusStop.new(bus, street, intersection)

		arrival = Colectivero::Arrival.new bus, 9191
		arrival.message.should match("Disculpe(.*)")
	end
end