require 'exchange'

describe Exchange do

	let (:exchange) {Exchange.new}
	let (:barrel) {Barrel.new}


	it 'should be able to fill up with barrels' do
		expect(exchange.barrelstock.count).to eq(1000)
	end

	it 'should be able to create a price between 0 and 100' do
		
	end


end