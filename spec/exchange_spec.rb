require 'exchange'

describe Exchange do

  let (:exchange) {Exchange.new}
  let (:barrel) {double :barrel, price: 50}
  let (:barrel1) {double :barrel, price: 110}


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
    expect(exchange.quote).to be_between(0,100)
  end

  it 'should be able to remove a barrel from the exchange' do
    exchange.lose_barrel(50)
    expect(exchange.barrelstock.count).to be < 1000
  end

  it 'should be able to find out how many barrels are in the market at what price' do
    exchange.barrelstock << barrel1
    expect(exchange.quantity_for_sale(110).count).to eq(1)
  end


end