require 'exchange'

describe Exchange do

	let (:exchange) {Exchange.new}
	let (:barrel) {Barrel.new}


	it 'should be able to fill up with barrels' do
		expect(exchange.barrelstock.count).to eq(1000)
	end

	it 'should be able to apply a price between 0 and 100' do
		exchange.priceup
		expect(exchange.barrelstock[0].price).to be_between(0, 100)
	end


end