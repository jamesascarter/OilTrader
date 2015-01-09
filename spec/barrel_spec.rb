require 'barrel'

describe Barrel do

	it 'should have a price' do
		wti = Barrel.new
		wti.price = 50
		expect(wti.price).to eq (50)
	end

end
