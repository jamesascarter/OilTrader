require 'exchange'

describe Exchange do

	let (:exchange) {Exchange.new}
	let (:barrel) {double :barrel}


	it 'should be able to fill up with barrels' do
		expect(exchange.barrelstock.count).to eq(1000)
	end

	it 'should be able to apply a price to the barrels in its inventory' do
		expect(exchange.barrelstock[0].price).to_not eq(nil)
	end

	it 'should be able to generate a price between 0 and 100' do
		expect(exchange.market_pricer).to be_between(0,100)
	end

	it 'should be able to provide a quote' do
		allow(exchange).to receive(:quote) { 5 }
		expect(exchange.quote).to eq(5) 
	end


end