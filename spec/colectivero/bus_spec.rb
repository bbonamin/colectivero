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

	context 'with a non valid name' do
		it 'should be nil' do
			@bus = Colectivero::Bus.new('xxx')
			@bus.should be_nil
		end
	end
end