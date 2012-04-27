require 'spec_helper'

describe 'Bus' do
	before(:each) do
		@bus = Colectivero::Bus.new('110')
	end

	context 'with a valid name' do
		it 'should have an id' do
			@bus.line_id.should_not be_nil
		end

		it 'should have a name' do
			@bus.name.should_not be_nil
		end
		
		it 'should have a value' do
			@bus.value.should_not be_nil
		end
	end

	context 'with an invalid name' do
		it 'should be raise an error' do
			expect { Colectivero::Bus.new('xxx') }.should raise_error
		end
	end

	it 'should have many streets' do
		@bus.streets.should_not be_empty
	end

	context 'with a street as parameter' do
		it 'should have many intersections' do
			street = @bus.streets.first
			@bus.intersections(street).should_not be_empty
		end
	end

	it 'should raise an error when calling intersections without params' do
		expect { @bus.intersections }.should raise_error
	end
end