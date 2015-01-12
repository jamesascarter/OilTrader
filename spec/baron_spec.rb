require 'baron'

describe Baron do

  let(:baron) {Baron.new('jimmie')}
  let(:exchange) {double :exchange, barrelstock: [barrel, barrel1], lose_barrel: nil}
  let(:barrel) {double :barrel, price: 50}
  let(:barrel1) {double :barrel, price: 70}

  context "should have" do

    it 'a name' do
      expect(baron.name).to eq('jimmie')
    end

    it 'a set amount of capital' do
      expect(baron.capital).to eq(10000)
    end

    it 'a barrel container' do
      expect(baron.barrels.count).to eq(0)
    end

  end

  context "should be able to" do

    it 'check the price of a barrel' do
      allow(exchange).to receive(:quote) { 20 }
      expect(baron.check_price(exchange)).to eq(20)
    end

    it 'buy a barrel of oil' do
      baron.buy(exchange, 50)
      expect(baron.barrels.count).to eq(1)
    end

    it 'be charged for a barrel of oil' do
      baron.buy(exchange, 50)
      expect(baron.capital).to eq(9950)
    end

    it 'buy only when has sufficient capital' do
      baron.capital = 0
      baron.buy(exchange, 50)
      expect(baron.barrels.count).to eq(0)
    end

    it 'sell a barrel of oil to the exchange' do
      baron.buy(exchange, 50)
      expect{baron.sell(exchange, 50, 1)}.to change{exchange.barrelstock.count}.by(1)
    end

    it 'add price of barrel to the barons capital' do
      baron.buy(exchange, 50)
      expect{baron.sell(exchange, 70, 1)}.to change{baron.capital}.by(70)
    end

    it 'lose a barrel(on sale)' do
      baron.buy(exchange, 50)
      expect{baron.remove_barrels(1)}.to change{baron.barrels.count}.by(-1)
    end


  end

  context 'has rules to abide by in the game such as' do

    it 'a set number of price checks' do
      expect(baron.price_checks).to eq(20)
    end

    it 'price check number counts down' do
      allow(exchange).to receive(:quote)
      expect{baron.check_price(exchange)}.to change{baron.price_checks}.by(-1)
    end

    it 'will raise a game over error if user has no checks left' do
      baron.price_checks = 0
      expect(lambda{baron.check_price(exchange)}).to raise_error('No more turns. Game over!')
    end

    it 'will sell remaining barrels to exchange at cost' do
      baron.buy(exchange, 50)
      expect{baron.sell_at_cost}.to change{baron.capital}.by(50)
    end

    it 'will remove remianing barrels from baron' do
      baron.buy(exchange, 50)
      expect{baron.sell_at_cost}.to change{baron.barrels.length}.by(-1)
    end

  end

end
