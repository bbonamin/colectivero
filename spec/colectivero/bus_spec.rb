require 'spec_helper'

describe Bus do
	before(:each) do
		binding.pry
		@bus = Colectivero::Bus.new('110')
	end

	it 'should be valid' do
		@bus.should be_valid
	end
end