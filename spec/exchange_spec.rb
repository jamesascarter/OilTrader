require 'exchange'

describe Exchange do

	it 'should be able to hold a barrel of oil' do
		exchange = Exchange.new
		expect(exchange.barrelstock.count).to eq(0)

	end


end