require 'spec_helper'

describe 'Bus' do
	before(:each) do
		@bus = Colectivero::Bus.new('110')
	end

	it 'should have an id' do
		@bus.line_id.should eq '11'
	end
end