require 'exchange'

describe Exchange do

  let (:exchange) {Exchange.new}
  let (:barrel) {double :barrel, price: 50}
  let (:barrel1) {double :barrel, price: 110}

  context 'should be able to' do

    it 'fill up with barrels' do
      expect(exchange.barrelstock.count).to eq(1000)
    end

    it 'apply a price to the barrels in its inventory' do
      expect(exchange.barrelstock[0].price).to_not eq(nil)
    end

    it 'generate a price between 0 and 100' do
      expect(exchange.market_pricer).to be_between(0,100)
    end

    it 'provide a quote' do
      allow(exchange).to receive(:quote) { 5 }
      expect(exchange.quote).to be_between(0,100)
    end

    it 'remove a barrel from the exchange' do
      exchange.lose_barrel(50)
      expect(exchange.barrelstock.count).to be < 1000
    end

    it 'find out how many barrels are in the market at what price' do
      exchange.barrelstock << barrel1
      expect(exchange.quantity_for_sale(110).count).to eq(1)
    end

    it 'change the price under crash market conditions' do
      allow(exchange).to receive(:market_conditions) {"crash"}
      exchange.barrelstock[0].price = 10
      expect{exchange.market_eventer}.to change{exchange.barrelstock[0].price}.by(-5)
    end

  end

end