require 'exchange'

describe Exchange do

	let (:exchange) {Exchange.new}
	let (:barrel) {Barrel.new}

	it 'should be able to hold a barrel of oil' do
		expect(exchange.barrelstock.count).to eq(0)
	end

	it 'should be able to fill up with barrels' do
		exchange.stock(barrel)
		expect(exchange.barrelstock.count).to eq(1000)
	end


end